<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		Perenimi ja sugu:<xsl:for-each select="inimesed/inimene">;
				<tr>
					<td>
						<xsl:value-of select="perenimi"/>
						<p>-</p>
						<xsl:value-of select="sugu"/>
					</td>
				</tr>
			</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
