<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="text" />
	<xsl:template match="/">
		Eelviimase inimese perekonnanimi:<xsl:value-of select="/inimesed/inimene[last()-1]/perenimi" />;
	</xsl:template>
</xsl:stylesheet>
