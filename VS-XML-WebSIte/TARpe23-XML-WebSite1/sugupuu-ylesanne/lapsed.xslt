<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Lapsed (need kellel pole järglasi)</h2>
        <ul>
          <xsl:for-each select="family/person[isLeaf='true']">
            <li><xsl:value-of select="name"/> – vanus <xsl:value-of select="age"/></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
