from setuptools import setup
# from distutils.core import setup

import time

v = time.strftime("%Y%m%d%H%M")
projectname = "teos"

setup(
  name=projectname,
  description="a program to manage SIGs on zoidtechnologies.com",
  version=v,
  url="http://projects.zoidtechnologies.com/%s/" % (projectname),
  author="zoidtechnologies.com",
  author_email="%s@projects.zoidtechnologies.com" % (projectname),
  scripts=["teos"],
  py_modules=["teos"]
  requires=["ttyio5", "bbsengine6"],
  license="GPLv2"
)
