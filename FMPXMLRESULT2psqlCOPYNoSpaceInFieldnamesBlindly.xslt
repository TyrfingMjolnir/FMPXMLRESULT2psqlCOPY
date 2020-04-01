<?xml version="1.0" encoding="UTF-8"?>
<!-- Written by Gjermund G Thorsen -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:fmp="http://www.filemaker.com/fmpxmlresult"
	exclude-result-prefixes="xsl fmp">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<xsl:text>CREATE TABLE IF NOT EXISTS "</xsl:text>
		<xsl:value-of select="$databaseName"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="$tableName"/>
		<xsl:text>" (
</xsl:text>
		<xsl:for-each select="fmp:METADATA/fmp:FIELD">
			<xsl:text>"</xsl:text>
		<xsl:value-of select="translate( translate( translate(@NAME,' ', '') ,'.', '') ,':', '')"/>
			<xsl:text>"</xsl:text>
			<xsl:text> </xsl:text>
			<xsl:value-of select="concat(
			              substring( 'text',      1 div boolean( @TYPE  = 'TEXT'      ) ),
			              substring( 'blob',      1 div boolean( @TYPE  = 'CONTAINER' ) ),
			              substring( 'date',      1 div boolean( @TYPE  = 'DATE'      ) ),
			              substring( 'timestamp', 1 div boolean( @TYPE  = 'TIMESTAMP' ) ),
			              substring( 'numeric',   1 div boolean( @TYPE  = 'NUMBER'    ) )
)"/>
			<xsl:choose>
				<xsl:when test="position()=last()">
					<xsl:text/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>,
</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>
);
</xsl:text>
				<xsl:text>COPY "</xsl:text>
		<xsl:value-of select="$databaseName"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="$tableName"/>
		<xsl:text>" ( </xsl:text>
		<xsl:for-each select="fmp:METADATA/fmp:FIELD">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="translate( translate( translate(@NAME,' ', '') ,'.', '') ,':', '')"/>
			<xsl:text>"</xsl:text>
						<xsl:choose>
				<xsl:when test="position()=last()">
					<xsl:text/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>, </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each><xsl:text> ) FROM stdin;
</xsl:text>		
		<xsl:for-each select="fmp:RESULTSET/fmp:ROW">
			<xsl:for-each select="fmp:COL">
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="fmp:DATA"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="fmp:DATA"/><xsl:text>	</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:text>
</xsl:text>
		</xsl:for-each>	
		<xsl:text>\.


</xsl:text>
	</xsl:template>
	<xsl:variable name="databaseName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME"/>
	</xsl:variable>
	<xsl:variable name="tableName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT"/>
	</xsl:variable>
	<xsl:variable name="timeformat">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@TIMEFORMAT"/>
	</xsl:variable>
</xsl:stylesheet>
