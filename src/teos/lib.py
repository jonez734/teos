#
# Copyright (C) 2023 zoidtechnologies.com. All Rights Reserved.
#

import os
import re
import hashlib
import copy
import tempfile
import argparse

import ttyio5 as ttyio
import bbsengine5 as bbsengine

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
  origsig = copy.deepcopy(sig)
  if sig["intro"] is not None:
    introhash = hashlib.new("md5")
    introhash.update(sig["intro"])
  else:
    introhash = None

  origsig["introhash"] = introhash
  
  dirty = False

  loop = True
  while loop:
    bbsengine.title(header)
    if sig != origsig:
      dirty = True

    if sig["name"] is None and sig["title"] is not None:
      sig["name"] = buildnamefromtitle(sig["title"])

    if sig["name"] is None:
      ttyio.echo("[N]ame")
    else:
      ttyio.echo("[N]ame: %s" % (sig["name"]))
      if origsig["name"] != sig["name"]:
        ttyio.echo("(was %s)" % (origsig["name"]))
      else:
        ttyio.echo()

    if sig["title"] is None:
      ttyio.echo("[T]itle")
    else:
      ttyio.echo("[T]itle: %s" % (sig["title"]))
      if origsig["title"] != sig["title"]:
        ttyio.echo("(was %s)" % (origsig["title"]))
      else:
        ttyio.echo()
    
    if sig["intro"] != origsig["intro"]:
      ttyio.echo("[I]ntro (changed)")
    else:
      ttyio.echo("[I]ntro")
    ttyio.echo("[Q]uit")

    ch = ttyio.inputchar(header, "NTIQ", "")
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
