# FMPXMLRESULT2psqlCOPY
FileMaker XML result to PostgreSQL COPY including current selection of records.

This is a PoC( Proof of Concept )

Works fine with all field types but content may or may not be a bit trikcy for multi line content( may or may not be fixed if I need this feature eventually ) and repeating fields( This is just a stupid concept( back in the day it might have had been an approach to achieve array, but this is 2016 for crying out loud ) in the first place I CCL( Couldn't Care Less. ) )

Note that adding a layout name in the FMPXMLRESULT export; before translating using this XSLT, will make the output more complete.

How to use this file in terminal: xsltproc FMPXMLRESULT2psqlCOPY.xslt YourTable.fmpxmlresult.xml > YourTable.sql

Depending on your userbase you may or may not want to run
---
tidy -i -xml -wrap 0 -utf8 YourTable.fmpxmlresult.xml \> YourTable.tidy.fmpxmlresult.xml 

and then 
---
xsltproc FMPXMLRESULT2psqlCOPY.xslt YourTable.tidy.fmpxmlresult.xml \> YourTable.sql

To minimize editing in the .sql file you would really like to edit your fmpxmlresult.xml file to match the following criteria \<DATABASE LAYOUT="tablename" NAME="schemaname" /\> as pr example: \<DATABASE LAYOUT="contact" NAME="public" />
