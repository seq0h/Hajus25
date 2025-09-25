<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<h1>
			<xsl:value-of select="name(*)" />
		</h1>
		<table>
			<tr>
				<xsl:for-each select="*/*[1]/*">
					<th>
						<xsl:value-of select="name(.)" />
					</th>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="*/*">
				<tr>
					<xsl:for-each select="*">
						<td>
							<xsl:value-of select="." />
						</td>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>
</xsl:stylesheet>




