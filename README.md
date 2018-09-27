# lua-gtable
A small helper library about tables.

## Installation
Copy the file `src/gtable.lua` to your project.

## Methods
* gtable.<code>merge(object:table, object:table):object:table</code><br />
Merges the two tables and returns a new one

* gtable.<code>prepend(object:table, object:table):object:table</code><br />
Prepends the values of the second table to the first one

* gtable.<code>append(object:table, object:table):object:table</code><br />
Appends the values of the second table to the first one

## Testing
You need `luacheck` and `luaunit` to lint and test the code.
Run `make` to lint and test the code.
