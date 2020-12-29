#!/usr/bin/env python

from optparse import OptionParser

import ttyio3 as ttyio
import bbsengine4 as bbsengine

def main():
  done = False
  
  parser = OptionParser(usage="usage: %prog [options] projectid")
  parser.add_option("--verbose", default=True, action="store_true", help="run %prog in verbose mode")
  parser.add_option("--debug", default=True, action="store_true", help="run %prog in debug mode")
  parser.add_option("--databasename", dest="databasename", action="store", default="zoidweb4", help="database name (%default)")
  parser.add_option("--databasehost", dest="databasehost", action="store", default="localhost", help="database host (%default)")
  parser.add_option("--databaseport", dest="databaseport", action="store", default="5432", help="database port (%default)")
  parser.add_option("--databaseuser", dest="databaseuser", action="store", default=bbsengine.getcurrentmemberlogin(), help="database user (%default)")
  parser.add_option("--databasepassword", dest="databasepassword", action="store", default=None, help="database password")

  (opts, args) = parser.parse_args()

  dbh = bbsengine.databaseconnect(opts)
  fromsig = bbsengine.inputsig(dbh, opts, "rename from: ", multiple=False, verify=True)
  if fromsig is None:
    ttyio.echo("invalid input. mvsig aborted")
    return

  tosig = bbsengine.inputsig(dbh, opts, "rename to: ", multiple=False, verify=False)
  if tosig is None:
    ttyio.echo("invalid input. mvsig aborted")
    return

  sql = "select id, unnest(sigs) as sigs from vulcan.link where sigs ~ %s"
  dat = (fromsig[0],)
  cur = dbh.cursor()
  cur.execute(sql,dat)
  ttyio.echo(cur.mogrify(sql, dat))
  res = cur.fetchall()
  cur.close()
  ttyio.echo(res)

if __name__ == "__main__":
    main()
