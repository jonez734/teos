# teos - sig view

## todo

- [ ] www: during insert, $siguri is an undefined variable. the insert works, but the redirect is to 'top' instead of the new sig
- [ ] www: edit is broken
- [ ] tty: teos.py
- [x] tty: write setup.py (@done 20220407)
- [x] listsig(): control for not listing top.eros.* using bbsengine.checkeros() (@since 20220406 @done 20220407)
- (manipulating trees using sql and the postgresql ltree extension)[https://patshaughnessy.net/2017/12/14/manipulating-trees-using-sql-and-the-postgres-ltree-extension)
- [Saving a Tree in Postgres Using LTREE](https://patshaughnessy.net/2017/12/13/saving-a-tree-in-postgres-using-ltree)
- https://stackoverflow.com/questions/9727673/list-directory-tree-structure-in-python
- [x] use bbsengine.inputsig() (@since 20220407 @done 20220611)
- [ ] modify node list (or link list from vulcan, etc) to use "generators" (yield) for performance (@since 20220611)
    * https://www.php.net/manual/en/language.generators.syntax.php
