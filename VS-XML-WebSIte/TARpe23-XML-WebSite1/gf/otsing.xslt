<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" />
	<xsl:param name="otsing">ar</xsl:param>
	<xsl:param name="pikkus">5</xsl:param>
	<xsl:template match="/">
		Nimed, mis sisaldavad kombinatsiooni <xsl:value-of select="$otsing" />:
		<xsl:for-each select="//inimene[contains(eesnimi, $otsing)]">
			<xsl:sort select="eesnimi" order="descending" />
			<xsl:value-of select="concat(eesnimi, ' ', perenimi)" />;
		</xsl:for-each>
		Nimed pikkusega <xsl:value-of select="$pikkus" /> ja rohkem:
		<xsl:for-each select="//inimene[string-length(eesnimi)>=$pikkus]" >
			<xsl:value-of select="concat(eesnimi, ' ', perenimi,
 ' varuks ', string-length(eesnimi)-$pikkus)" />;
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>