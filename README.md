# bom
Create a BOM table using recursive SQL.

Environment
PostgreSQL 12

Description

1.create table composition.sql

Script to create a composition table.
 

2.bom.csv

Parts list. Import and use the composition table.


3.copy bom.sql

Script for setting data in the composition table.

Change the host name, port number, user name, database name, and full path of the file(bom.csv) as you wish.


4.create view vBom.sql

This is the SQL to construct the BOM table.

It consists of the following items.
  
4-1.level
This is a number that indicates the depth of the component.

4-2.parent
Parent component number. If this value is null, it is the final product.

4-3.child
Child component number. 

4-4.class
It visualizes the depth of the level.

4-5.product
The final product group.

4-6.quantity
The quantity of child component numbers required to make up the parent component number.

4-7.usedquantity
The used quantity of child component numbers used to create the final product.


  
  
