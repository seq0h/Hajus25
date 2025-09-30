<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:for-each select="//inimene">
			<xsl:if test="count(lapsed/inimene)=0">
				<xsl:value-of select="eesnimi"/> - <xsl:value-of select="(2025 - @synd)"/><br/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
