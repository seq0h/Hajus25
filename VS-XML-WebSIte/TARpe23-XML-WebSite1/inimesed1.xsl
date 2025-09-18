<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		Kolme esimese inimese perekonnanimed:<xsl:value-of select="/inimesed/inimene[1]/perenimi" />;
		<xsl:value-of select="/inimesed/inimene[2]/perenimi" />;
		<xsl:value-of select="/inimesed/inimene[3]/perenimi" />;
	</xsl:template>
</xsl:stylesheet>