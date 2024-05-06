<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Students</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Name</th>
            <th>Roll No</th>
            <th>Department</th>
            <th>CGPA</th>
          </tr>
          <xsl:for-each select="Students/Student">
            <tr>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="rollno"/></td>
              <td><xsl:value-of select="department"/></td>
              <td><xsl:value-of select="cgpa"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
