<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Nimed värvitud pikkuse järgi</h2>
        <ul>
          <xsl:for-each select="family/person">
            <li>
              <xsl:attribute name="style">
                <xsl:if test="string-length(translate(name,' ','')) &lt; 7">background-color:lightgreen;</xsl:if>
              </xsl:attribute>
              <xsl:value-of select="name"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
