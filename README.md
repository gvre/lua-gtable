# lua-gtable
A small helper library about tables (WIP).

## Installation
Copy the file `src/gtable.lua` to your project.

## Methods
* gtable.<code>merge(object:table, object:table):object:table</code><br />
Merges the two tables and returns a new one

* gtable.<code>prepend(object:table, object:table):object:table</code><br />
Prepends the values of the second table to the first one

* gtable.<code>append(object:table, object:table):object:table</code><br />
Appends the values of the second table to the first one

* gtable.<code>is_table(object:table):boolean</code><br />
Checks if the given parameter is a table

* gtable.<code>is_empty(object:table):boolean</code><br />
Checks if the given parameter is an empty table

* gtable.<code>key_exists(key:string, object:table):boolean</code><br />
Checks if the given parameter exists as a key in the given table

## Testing
Run `make` to lint and test the code (you need `luacheck` and `luaunit`)
