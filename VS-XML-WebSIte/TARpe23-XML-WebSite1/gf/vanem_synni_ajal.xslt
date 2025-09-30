<?xml version="1.0" encoding="utf-8"?>
<!--kui vana oli vanem kui laps syndis-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:for-each select="//inimene">
			<xsl:if test="count(lapsed/inimene)=0">
				<xsl:value-of select="../../eesnimi"/> oli <xsl:value-of select="(@synd - ../../@synd)"/> aastat vana kui <xsl:value-of select="eesnimi"/> sündis
				<br/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
