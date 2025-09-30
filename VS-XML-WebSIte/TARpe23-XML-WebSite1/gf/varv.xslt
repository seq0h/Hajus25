<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<ul>
			<xsl:for-each select="//inimene">
				<li>
					<span>
						<xsl:if test="string-length(eesnimi) &lt; 7">
							<xsl:attribute name="style">background-color:green</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="eesnimi" />
					</span>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:stylesheet>