<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="about:legacy-compat"/>
    
    <xsl:include href="../base/header.xsl"/>
    <xsl:include href="../base/footer.xsl"/>

    <!-- Plantilla para mostrar los eventos del año 2024 -->
    <xsl:template match="/gestionParque">
        <xsl:variable name="anio" select="'2024'"/>
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Eventos</title>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <!-- Incluir contenido de header.xml -->
                <xsl:apply-templates select="document('../base/header.xml')/header"/>   

                <main id="eventos">
                    <h1>Eventos del <xsl:value-of select="$anio"/></h1>
                    <xsl:apply-templates select="eventos/evento[starts-with(fechaHora, $anio)]">
                        <xsl:sort select="fechaHora" order="descending"/>
                    </xsl:apply-templates>
                </main>
                
                <!-- Incluir contenido de footer.xml -->
                <xsl:apply-templates select="document('../base/footer.xml')/footer"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="evento">
        <article class="eventos">
            <h4><xsl:value-of select="descripcion"/> - <xsl:value-of select="count(comentarios/comentario)"/> Comentarios</h4>
            <ul>
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </article>
    </xsl:template>

    <xsl:template match="comentario">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>
