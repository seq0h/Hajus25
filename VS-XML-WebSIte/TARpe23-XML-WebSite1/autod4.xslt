<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		inimese perekonnanime viimane täht:<xsl:for-each select="(autod/auto/omanik)">;
					<xsl:value-of select="substring(perekonnanimi,string-length())"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
