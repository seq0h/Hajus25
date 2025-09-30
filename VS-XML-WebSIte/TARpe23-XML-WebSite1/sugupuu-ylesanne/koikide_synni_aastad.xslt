<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Kõigi inimeste sünniaastad</h2>
        <ul>
          <xsl:for-each select="family/person">
            <li><xsl:value-of select="name"/> – <xsl:value-of select="birthYear"/></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
