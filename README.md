"# a1-db-migration-ttahmazli"

*Because PostgreSQL don't like uppercasing, namings are lower-case. Typing everything with "" would look messy.
*Script is written in SQL language
*create_tables creates instance tables to work on. Also deletes tables beforehand.
*Migration creates new column for students table, gathers interests of same ids and assign it to corresponding ids there.
Then, interests table gets modified, emptied. Temporary arrays move to interests table and get deleted from students table.
Students table gets modified at last.
*Restoring script creates temporart table firstly as empty copy of table of interests' first version.
Then *tries to add elements of arrays with nested loop method. It partially works due to first loop not being repeated.
Then, interests table gets restored, emptied. Temporary interests and ids move to interests table.
Temporary table gets deleted.
Students table gets restored at last.

*Scripts can run by being copied to one sheet to test restoring. Only difference from begginning will be interests of missing ids due to loop failing.

*You may run scripts by PG Admin client of PostgreSQL with Query Tool and editor (button on top left).

