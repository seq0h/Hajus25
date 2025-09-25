<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<h1>
			Juurelement: <xsl:value-of select="name(*)" />
		</h1>
		<h2>
			Esimene alamelement: <xsl:value-of select="name(*/*)" />
		</h2>
		<h3>Alamelemendi järglased: </h3>
		<ul>
			<xsl:for-each select="*/*[1]/*">
				<li>
					<xsl:value-of select="name(.)" />
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:stylesheet>




