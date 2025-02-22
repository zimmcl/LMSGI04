<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat"/>

    <!-- Plantilla para el encabezado -->
    <xsl:template match="header">
        <header>
            <a href="../index.html" class="header-logo-link">
                <img class="header-logo">
                    <xsl:attribute name="src">
                        <xsl:value-of select="logo/@src"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="logo/@alt"/>
                    </xsl:attribute>
                </img>
            </a>
            <nav>
                <xsl:apply-templates select="nav/link"/>
            </nav>
        </header>
    </xsl:template>

    <xsl:template match="link">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
</xsl:stylesheet>
