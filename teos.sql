create table "category" (
  "path" ltree unique primary key not null,
  "title" text not null,
  "name" text not null,
  "description" text,
  "acl" text
);

grant all on "category" to "www-data";

create index idx_category_path on category using gist (path);

insert into category(path, title, name) values ('top', 'top', 'top');
