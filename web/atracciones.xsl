<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="about:legacy-compat" />

    <xsl:include href="../base/header.xsl" />
    <xsl:include href="../base/footer.xsl" />

    <!-- Plantilla para mostrar las atracciones con el mismo estilo que gastrobar -->
    <xsl:template match="/gestionParque">
        <html>
            <head>
                <meta charset="UTF-8" />
                <title>Atracciones</title>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <!-- Incluir contenido de header.xml -->
                <xsl:apply-templates select="document('../base/header.xml')/header" />

                <main id="atracciones">
                    <h1>ATRACCIONES</h1>
                    <table>
                        <tr>
                            <th>ATRACCION</th>
                            <th>EDAD MINIMA</th>
                            <th>PESO MAXIMO</th>
                        </tr>
                        <xsl:apply-templates select="atracciones/atraccion" />
                    </table>
                </main>

                <!-- Incluir contenido de footer.xml -->
                <xsl:apply-templates select="document('../base/footer.xml')/footer" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="atraccion">
        <tr>
            <xsl:attribute name="title">
                <span>Operador: <xsl:value-of select="operador" /></span>
            </xsl:attribute>
            <td>
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>https://es.wikipedia.org/wiki/</xsl:text>
                        <xsl:value-of select="translate(nombre, ' ', '_')" />
                    </xsl:attribute>
                    <xsl:attribute name="target">_blank</xsl:attribute>
                    <xsl:attribute name="rel">noopener noreferrer</xsl:attribute>
                    <xsl:value-of select="nombre" />
                </a>
            </td>
            <td>
                <xsl:value-of select="restricciones/edadMinima" />
            </td>
            <td>
                <xsl:value-of select="restricciones/pesoMaximo" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>