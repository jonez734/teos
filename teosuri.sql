create language "plpythonu";

create or replace function teosuri(path text)
returns text as $$
if path is not None:
  foo = path.replace("top.", "")
  foo = foo.replace(".", "/")
  foo = foo.replace("_", "-")
  foo = foo + "/"
  return foo

return None

$$
language plpythonu;
