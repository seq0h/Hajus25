<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		<ul>
			<xsl:for-each select="autod/auto/omanik">
				<li>
					<xsl:value-of select="concat(position(),' - ',perekonnanimi,' ')" />
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:stylesheet>
