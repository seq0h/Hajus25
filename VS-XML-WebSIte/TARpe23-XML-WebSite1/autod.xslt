<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		Autode regstrinumbrid:<xsl:for-each select="autod/auto">;
		<tr>
			<td>
				<xsl:value-of select="registrinumber"/>
				<p>-</p>
				<xsl:value-of select="omanik/perekonnanimi"/>
			</td>
		</tr>
	</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
