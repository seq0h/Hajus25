<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		<ul>
			<xsl:for-each select="autod/auto">
				<li>
					<xsl:if test="$lastChar = '1' or $lastChar = '2'">
							
					</xsl:if>
					<xsl:value-of select="substring(registrinumber1,3)"/>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:stylesheet>
