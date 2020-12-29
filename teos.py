import os
import re
import pwd
import hashlib
import sys
import copy
import string
import tempfile
import ConfigParser

import ttyio
import bbsengine

ZOIDWEB2CFG = "/etc/zoidweb2/zoidweb2.cfg"

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
    print "-="*40+"-"
    print header
    print "-="*40+"-"
    print

    if sig != original:
      dirty = True

    if sig["name"] is None and sig["title"] is not None:
      sig["name"] = buildnamefromtitle(sig["title"])

    if sig["name"] is None:
      print "[N]ame"
    else:
      print "[N]ame: %s" % (sig["name"]),
      if original["name"] != sig["name"]:
        print "(was '%s')" % (original["name"])
      else:
        print

    if sig["title"] is None:
      print "[T]itle"
    else:
      print "[T]itle: %s" % (sig["title"]),
      if original["title"] != sig["title"]:
        print "(was %s)" % (original["title"])
      else:
        print
    
    if sig["intro"] != original["intro"]:
      print "[I]ntro (changed)"
    else:
      print "[I]ntro"
    print "[Q]uit"

    if sig["name"] is not None:
      parentid = sig["parentid"]
      name = sig["name"]
      path = "%s.%s" % (getsigpath(parentid), name)
      print "path=%r" % (path)
      sig["path"] = path

    ch = ttyio.accept(header, "NTIQ", "")
    if ch == "Q":
      print "quit"
      done = True
    elif ch == "N":
      print "name"
      buf = bbsengine.inputstring("name: ", sig["name"])
      print buf
      if buf == "":
        sig["name"] = None
      else:
        sig["name"] = buf
    elif ch == "T":
      print "title"
      buf = bbsengine.inputstring("title: ", sig["title"])
      print buf
      if buf == "":
        sig["title"] = None
      else:
        sig["title"] = buf
    elif ch == "I":
      print "intro"
      print
      if os.environ.has_key("VISUAL"):
        editor = os.environ["VISUAL"]
      elif os.environ.has_key("EDITOR"):
        editor = os.environ["EDITOR"]
      else:
        editor = "joe"
      introfn = tempfile.mktemp()

      intro = sig["intro"]
      fp = open(introfn, "w")
      if intro is not None:
        fp.writelines(intro)
      fp.close()
      
      try:
        os.system("%s %s" % (editor, introfn))
      except:
        print
        print "error running editor"
        print
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
  print "debug: res=",res
  if res is None or len(res) == 0:
    print
    print "invalid id"
    print
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

def editsig(dbh):
  sigid = bbsengine.inputsig(ZOIDWEB2CFG)
  if sigid is None:
    print "aborted"
    return

  _sig = _get(dbh, sigid)
  if _sig is None:
    print "could not load sig record"
    return
  sig = copy.deepcopy(_sig)
  res = _edit(sig, "edit sig")
  if res is None:
    print "** error editing sig **"
    return

  print "new=",res
  print "old=",sig
  if bbsengine.inputboolean("save?") is True:
    sig["lastmodified"] = "now()"
    sig["lastmodifiedby"] = currentmemberid
    bbsengine.update(dbh, "sig", sigid, sig)
    dbh.commit()
    print
    print "** sig updated **"
    print
  else:
    print
    print "** sig not updated **"
    print
  return

def listsigs(dbh):
  sql = "select * from engine.sig order by path"
  cur = dbh.cursor()
  cur.execute(sql)
  res = cur.fetchall()
  for rec in res:
    print rec["path"]
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
    print 
    print "** no path specified. aborted. **"
    print
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
    try:
      res = bbsengine.insert(dbh, "sig", sig)
    except Exception, e:
      print e
      dbh.rollback()
      bbsengine.logentry("addsig.0: error: %r" % (e))
      print "[ERROR] sig not added (code: addsig.0)"
      return False
    else:
      dbh.commit()
  return True

def main():
  done = False
  dbh = bbsengine.dbconnect(ZOIDWEB2CFG, "system")

  while not done:
    print "-="*40+"-"
    print "teos (greek librarian) (categories)"
    print "-="*40+"-"
    print
    print "[A]dd sig"
    print "[E]dit sig"
    print "[L]ist sigs"
    print
    print "[Q]uit"
    ch = ttyio.accept("teos", "AELQ", "")
    if ch == "Q":
      print "quit"
      done = True
      continue
    elif ch == "A":
      print "add sig"
      addsig(dbh)
    elif ch == "E":
      print "edit sig"
      editsig(dbh)
    elif ch == "L":
      print "list sigs"
      listsigs(dbh)
    elif ch == "D":
      print "delete sig"
      deletesig(dbh)

  return

if __name__ == "__main__":
  membermap = {"jam" : 1}

  loginid = pwd.getpwuid(os.geteuid())[0]
  if membermap.has_key(loginid):
    currentmemberid = membermap[loginid]
  else:
    print "uhmmm... you do not exist. go away!"
    sys.exit(-1)
  main()
