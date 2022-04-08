#
# Copyright (C) 2021 zoidtechnologies.com. All Rights Reserved.
#

import os
import re
import pwd
import hashlib
import sys
import copy
import string
import tempfile
from optparse import OptionParser
# import ConfigParser

import ttyio4 as ttyio
import bbsengine4 as bbsengine

currentmemberid = None
"""
	function buildname($url)
	{
		// society & culture -> society-culture
		$url = strtolower($url);
		$url = preg_replace("@[^a-z0-9\/_]@","-", $url);
		$url = preg_replace("@[-]{2,}@", "-", $url);
		$url = preg_replace("@-$@", "", $url);
		$url = preg_replace("@^-@", "", $url);
		
		return $url;
	}
"""
def buildnamefromtitle(txt):
  txt = txt.lower() # lowercase the string
  txt = re.sub(r"[^A-Za-z0-9\/_-]", "-", txt) # replace anything that is not alphanumeric or '_' or '-' or '/' with '-'
  txt = re.sub(r"[-]{2,}", "-", txt) # replace two or more '-' with a single '-'
  txt = re.sub(r"-$", "", txt) # trim '-' from end of string
  txt = re.sub(r"^-", "", txt) # trim '-' from beginning of string
  return txt

def getsigpath(id):
  if id is None:
    return "top"

  dbh = bbsengine.dbconnect(ZOIDWEB2CFG, "system")
  sql = "select path from engine.sig where id=%s"
  dat = (id,)
  cur = dbh.cursor()
  cur.execute(sql, dat)
  res = cur.fetchone()
  return res["path"]

def buildsig(rec):
  sig = {}
  if rec.has_key("id"):
    sig["id"] = rec["id"]
  sig["name"] = rec["name"]
  sig["title"] = rec["title"]
  sig["path"] = rec["path"]
  sig["parentid"] = rec["parentid"]
  sig["intro"] = rec["intro"]

  return sig

def _delete(dbh, table, id):
  sql = "delete from %s where id=%s"
  dat = (table, id)
  cur = dbh.cursor()
  cur.execute(sql, dat)
  cur.close()
  return
  
def _edit(sig, header):
  dirty = False
  done = False
  
  original = copy.deepcopy(sig)
  if sig["intro"] is not None:
    introhash = hashlib.new("md5")
    introhash.update(sig["intro"])
  else:
    introhash = None

  original["introhash"] = introhash
  
  while not done:
    bbsengine.title(header)
#    ttyio.echo("-="*40+"-")
#    ttyio.echo(header)
#    ttyio.echo("-="*40+"-")
#    print

    if sig != original:
      dirty = True

    if sig["name"] is None and sig["title"] is not None:
      sig["name"] = buildnamefromtitle(sig["title"])

    if sig["name"] is None:
      ttyio.echo("[N]ame")
    else:
      ttyio.echo("[N]ame: %s" % (sig["name"]))
      if original["name"] != sig["name"]:
        ttyio.echo("(was %s)" % (original["name"]))
      else:
        ttyio.echo()

    if sig["title"] is None:
      ttyio.echo("[T]itle")
    else:
      ttyio.echo("[T]itle: %s" % (sig["title"]))
      if original["title"] != sig["title"]:
        ttyio.echo("(was %s)" % (original["title"]))
      else:
        ttyio.echo()
    
    if sig["intro"] != original["intro"]:
      ttyio.echo("[I]ntro (changed)")
    else:
      ttyio.echo("[I]ntro")
    ttyio.echo("[Q]uit")

    if sig["name"] is not None:
      parentid = sig["parentid"]
      name = sig["name"]
      path = "%s.%s" % (getsigpath(parentid), name)
      ttyio.echo("path=%r" % (path), level="debug")
      sig["path"] = path

    ch = ttyio.accept(header, "NTIQ", "")
    if ch == "Q":
      ttyio.echo("quit")
      done = True
    elif ch == "N":
      ttyio.echo("name")
      buf = bbsengine.inputstring("name: ", sig["name"])
      ttyio.echo(buf)
      if buf == "":
        sig["name"] = None
      else:
        sig["name"] = buf
    elif ch == "T":
      ttyio.echo("title")
      buf = bbsengine.inputstring("title: ", sig["title"])
      ttyio.echo(buf)
      if buf == "":
        sig["title"] = None
      else:
        sig["title"] = buf
    elif ch == "I":
      ttyio.echo("intro{f6}")
      
      if "VISUAL" in os.environ:
        editor = os.environ["VISUAL"]
      elif "EDITOR" in os.environ:
        editor = os.environ["EDITOR"]
      else:
        editor = "joe -r"
      introfn = tempfile.mktemp()

      intro = sig["intro"]
      fp = open(introfn, "w")
      if intro is not None:
        fp.writelines(intro)
      fp.close()
      
      try:
        os.system("%s %s" % (editor, introfn))
      except:
        ttyio.echo("{f6}error running editor{f6}")
      else:
        if os.access(introfn, os.F_OK|os.R_OK):
          fp = open(introfn, "r")
          intro = fp.readlines()
          intro = "".join(intro)
          fp.close()
          introhash = hashlib.new("md5")
          introhash.update(intro)
          sig["introhash"] = introhash
          sig["intro"] = intro
      
  return sig

def _get(dbh, id):
  sql = "select sig.* from engine.sig where sig.id=%s"
  dat = (int(id),)
  cur = dbh.cursor()
  cur.execute(sql, dat)
  res = cur.fetchall()
  ttyio.echo("debug: res=%s" % (res))
  if res is None or len(res) == 0:
    ttyio.echo("{f6}invalid id{f6}")
    return None
  rec = res[0]

  sig = {}
  sig["id"] = rec["id"]
  sig["title"] = rec["title"]
  sig["name"] = rec["name"]
  sig["parentid"] = rec["parentid"]
  sig["dateposted"] = rec["dateposted"]
  sig["lastmodifiedbyid"] = rec["lastmodifiedbyid"]
  sig["lastmodified"] = rec["lastmodified"]
  sig["intro"] = rec["intro"]
  return sig

def editsig(opts):
  sigid = bbsengine.inputsig(opts, multiple=False, noneok=True)
  if sigid is None:
    ttyio.echo("aborted")
    return

  _sig = _get(dbh, sigid)
  if _sig is None:
    ttyio.echo("could not load sig record")
    return
  sig = copy.deepcopy(_sig)
  res = _edit(sig, "edit sig")
  if res is None:
    ttyio.echo("** error editing sig **")
    return

  ttyio.echo("new=%r" % (res))
  ttyio.echo("old=%r" % (old))
  if bbsengine.inputboolean("save?") is True:
    sig["lastmodified"] = "now()"
    sig["lastmodifiedby"] = currentmemberid
    bbsengine.update(dbh, "sig", sigid, sig)
    dbh.commit()
    ttyio.echo("{f6}** sig updated **{f6}")
  else:
    ttyio.echo("{f6}** sig not updated **{f6}")
  return

def listsigs(opts):
  eros = bbsengine.checkeros(opts, currentmemberid)
#  ttyio.echo("eros=%s" % (eros), level="debug")
  sql = "select * from engine.sig"
  if eros is False:
    sql += " where not path ~ 'top.eros.*'"
  sql += " order by path asc"
  dbh = bbsengine.databaseconnect(opts)
  cur = dbh.cursor()
  cur.execute(sql)
  for sig in bbsengine.ResultIter(cur, 20):
    ttyio.echo(sig["path"])
    
#  print(cur.mogrify(sql))
#  res = cur.fetchall()
#  for rec in res:
#    ttyio.echo(rec["path"])
  return

def addsig(dbh):
  sig = {}
  sig["title"] = None
  sig["name"] = None
  sig["parentid"] = None
  sig["intro"] = None
#  sig["parent"] = None
  sig["path"] = None
  
  rec = _edit(sig, "add sig")

  if rec["path"] is None:
    ttyio.echo("{f6}** no path specified. aborted. **{f6}")
    return

  if bbsengine.inputboolean("add?") is True:
    rec["path"] = rec["path"].replace("-","_")
    sig["path"] = rec["path"]
    sig["title"] = rec["title"]
    sig["name"] = rec["name"]
    sig["intro"] = rec["intro"]
    sig["lastmodified"] = "now()"
    sig["lastmodifiedbyid"] = currentmemberid
    sig["dateposted"] = "now()"
    sig["postedbyid"] = currentmemberid
#    try:
    res = bbsengine.insert(dbh, "sig", sig)
#    except:
#      ttyio.echo(e)
#      dbh.rollback()
#      bbsengine.logentry("addsig.0: error: %r" % (e))
#      ttyio.echo("[ERROR] sig not added (code: addsig.0)")
#      return False
#    else:
    dbh.commit()
  return True

def main():
  membermap = {"jam" : 1}

  loginid = pwd.getpwuid(os.geteuid())[0]
  if loginid in membermap:
    currentmemberid = membermap[loginid]
  else:
    ttyio.echo("uhmmm... you do not exist. go away!")
    sys.exit(-1)

  parser = OptionParser(usage="usage: %prog [options]")
  parser.add_option("--verbose", default=True, action="store_true", help="run %prog in verbose mode")
  parser.add_option("--debug", default=False, action="store_true", help="run %prog in debug mode")
  parser.add_option("--eros", default=False, action="store_true", help="enable one of two flags to allow adult content")
  parser.add_option("--databasename", dest="databasename", action="store", default="zoidweb4", help="database name (%default)")
  parser.add_option("--databasehost", dest="databasehost", action="store", default="localhost", help="database host (%default)")
  parser.add_option("--databaseuser", dest="databaseuser", action="store", default=bbsengine.getcurrentmemberlogin(), help="database user (%default)")
  parser.add_option("--databaseport", dest="databaseport", action="store", default="5432")
  parser.add_option("--databasepassword", dest="databasepassword", action="store", default=None, help="database password")

  (opts, args) = parser.parse_args()

  dbh = bbsengine.databaseconnect(opts)

  done = False
  while not done:
    bbsengine.title("teos (sigs)")

    ttyio.echo("dbh=%r" % (dbh))

    ttyio.echo("[A]dd sig")
    ttyio.echo("[E]dit sig")
    ttyio.echo("[L]ist sigs")
    ttyio.echo("{f6}[Q]uit")
    ch = ttyio.accept("teos: ", "AELQ", "")
    if ch == "Q":
      ttyio.echo("quit")
      done = True
      continue
    elif ch == "A":
      ttyio.echo("add sig")
      addsig(opts)
    elif ch == "E":
      ttyio.echo("edit sig")
      editsig(opts)
    elif ch == "L":
      ttyio.echo("list sigs")
      listsigs(opts)
    elif ch == "D":
      ttyio.echo("delete sig")
      deletesig(opts)

  return

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt:
    ttyio.echo("{/all}{bold}INTR{bold}")
  except EOFError:
    ttyio.echo("{/all}{bold}EOF{/bold}")
  finally:
    ttyio.echo("{reset}{/all}")
