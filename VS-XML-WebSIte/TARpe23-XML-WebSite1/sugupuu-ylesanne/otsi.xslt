<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="otsi" select="'Prince'"/>
  <xsl:template match="/">
    <html>
      <body>
        <h2>Otsing: <xsl:value-of select="$otsi"/></h2>
        <ul>
          <xsl:for-each select="family/person[contains(name, $otsi)]">
            <li><xsl:value-of select="name"/></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
