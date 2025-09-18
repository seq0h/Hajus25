<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		Autode registrinumbri numbrite osa:<xsl:for-each select="(autod/auto)">
			;
			<tr>
				<td>
					<xsl:value-of select="substring(registrinumber, 1, 3)"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
