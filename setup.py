from distutils.core import setup

import time

v = time.strftime("%Y%m%d%H%M")
projectname = "teos"

setup(
  name=projectname,
  description="a set of Python scripts for project management based in part on RFC1297",
  version=v,
  url="http://projects.zoidtechnologies.com/%s/" % (projectname),
  author="zoid technologies",
  author_email="%s@projects.zoidtechnologies.com" % (projectname),
  scripts=["teos"],
  py_modules=["teos"]
  requires=["ttyio4", "bbsengine4"],
  license="GPLv2"
)
