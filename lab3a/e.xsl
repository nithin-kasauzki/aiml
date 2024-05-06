<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Books Information</title>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h2>Books Information</h2>
        <table>
          <tr>
            <th>ISBN</th>
            <th>Title</th>
            <th>Author</th>
          </tr>
          <xsl:apply-templates select="Books/Book"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Book">
    <tr>
      <td><xsl:value-of select="Isbn"/></td>
      <td><xsl:value-of select="Title"/></td>
      <td><xsl:value-of select="Author"/></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
