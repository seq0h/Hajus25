<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th>eesnimi</th>
				<th>perenimi</th>
				<th>synd</th>
				<th>lapsi</th>
				<th>vanem</th>
				<th>vanavanem</th>
			</tr>

			<xsl:for-each select="//inimene">
				<tr>
					<td>
						<xsl:value-of select="eesnimi" />
					</td>
					<td>
						<xsl:value-of select="perenimi" />
					</td>
					<td>
						<xsl:value-of select="@synd" />
					</td>
					<td>
						<xsl:value-of select="count(lapsed/inimene)" />
					</td>
					<td>
						<xsl:value-of select="../../eesnimi" />
						<br/>
						<xsl:value-of select="../../perenimi" />
					</td>
					<td>
						<xsl:value-of select="../../../../eesnimi" />
						<br/>
						<xsl:value-of select="../../../../perenimi" />
					</td>
				</tr>
			</xsl:for-each>

		</table>
	</xsl:template>
</xsl:stylesheet>
