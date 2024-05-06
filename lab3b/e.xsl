<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Pets</title>
        <style>
          table {
            
            width: 50%;
          }
          th,tr {
            text-align : center;
          }
          
        </style>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Type</th>
            <th>Color</th>
          </tr>
          <xsl:for-each select="pets/pet">
            <tr>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="age"/></td>
              <td><xsl:value-of select="type"/></td>
              <td><xsl:value-of select="color"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
