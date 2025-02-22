<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="about:legacy-compat"/>
    
    <xsl:include href="../base/header.xsl"/>
    <xsl:include href="../base/footer.xsl"/>
    
    <!-- Plantilla para mostrar los platos del gastrobar con el mismo estilo -->
    <xsl:template match="/gestionParque">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Gastrobar</title>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <!-- Incluir contenido de header.xml -->
                <xsl:apply-templates select="document('../base/header.xml')/header"/>
                
                <main id="gastrobar">
                    <h1>ENTRANTES</h1>
                    <xsl:apply-templates select="gastrobar/plato[@categoria='Entrante']"/>
                </main>
                
                <!-- Incluir contenido de footer.xml -->
                <xsl:apply-templates select="document('../base/footer.xml')/footer"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="plato">
        <article class="articulo">
            <img class="imagen">
                <xsl:attribute name="src">
                    <xsl:value-of select="imagen"/>
                </xsl:attribute>
            </img>
            <xsl:if test="starts-with(@codigo, 'A')">
                <img src="../img/icono-novedad.png" class="novedad-icono"/>
            </xsl:if>
            <h2><xsl:value-of select="nom_plato"/></h2>
            <h3><xsl:value-of select="precio"/>€</h3>
        </article>
    </xsl:template>
</xsl:stylesheet>
