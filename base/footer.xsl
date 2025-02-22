<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <!-- Plantilla para el pie de página -->
    <xsl:template match="footer">
        <footer>
            <xsl:apply-templates select="address"/>
        </footer>
    </xsl:template>

    <xsl:template match="address">
        <address><xsl:value-of select="."/></address>
    </xsl:template>
</xsl:stylesheet>
