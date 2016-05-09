# FMPXMLRESULT2psqlCOPY
FileMaker XML result to PostgreSQL COPY including current selection of records.

This is a PoC( Proof of Concept )

Works fine with all field types but content may or may not be a bit trikcy for multi line content( may or may not be fixed if I need this feature eventually ) and repeating fields( This is just a stupid concept in the first place I CCL( Couldn't Care Less. ) )

Note that adding a layout name in the FMPXMLRESULT export; before translating using this XSLT, will make the output more complete.
