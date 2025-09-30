<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Sugupuu tabel</h2>
        <table border="1">
          <tr>
            <th>Nimi</th>
            <th>Sünniaasta</th>
            <th>Surmaaasta</th>
            <th>Vanem</th>
            <th>Vanavanem</th>
            <th>Lapsed</th>
            <th>Laps?</th>
            <th>Vanus</th>
          </tr>
          <xsl:for-each select="family/person">
            <tr>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="birthYear"/></td>
              <td><xsl:value-of select="deathYear"/></td>
              <td><xsl:value-of select="parentName"/></td>
              <td><xsl:value-of select="grandParentName"/></td>
              <td>
                <xsl:for-each select="children/child">
                  <xsl:value-of select="."/><xsl:text> </xsl:text>
                </xsl:for-each>
              </td>
              <td><xsl:value-of select="isLeaf"/></td>
              <td><xsl:value-of select="age"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
