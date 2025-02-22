<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Plantilla para mostrar los platos del gastrobar -->
    <xsl:template match="/sitio/gastrobar">
        <html>
            <body>
                <h1>Listado de Platos</h1>
                <xsl:apply-templates select="plato"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="plato">
        <div>
            <h2>
                <xsl:if test="starts-with(@codigo, 'A')">
                    <span style="color:red;">New!</span>
                </xsl:if>
                <xsl:value-of select="nombre"/>
            </h2>
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="imagen"/>
                </xsl:attribute>
            </img>
            <p>Precio: <xsl:value-of select="precio"/>€</p>
        </div>
    </xsl:template>

    <!-- Plantilla para mostrar las atracciones -->
    <xsl:template match="/sitio/atracciones">
        <html>
            <body>
                <h1>Listado de Atracciones</h1>
                <xsl:apply-templates select="atraccion"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="atraccion">
        <div>
            <h2>
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>https://es.wikipedia.org/wiki/</xsl:text>
                        <xsl:value-of select="translate(nombre, ' ', '_')"/>
                    </xsl:attribute>
                    <xsl:value-of select="nombre"/>
                </a>
            </h2>
            <p>Edad mínima: <xsl:value-of select="edad_minima"/></p>
            <p>Peso máximo: <xsl:value-of select="peso_maximo"/></p>
        </div>
    </xsl:template>

    <!-- Plantilla para mostrar los eventos del 2024 ordenados por fecha -->
    <xsl:template match="/sitio/eventos">
        <xsl:variable name="anio" select="'2024'"/>
        <html>
            <body>
                <h1>Eventos del 2024</h1>
                <xsl:apply-templates select="evento[starts-with(@fecha, $anio)]">
                    <xsl:sort select="@fecha" order="descending"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="evento">
        <div>
            <h2><xsl:value-of select="nombre"/></h2>
            <p>Comentarios (<xsl:value-of select="comentarios/@total"/>)</p>
            <ul>
                <xsl:apply-templates select="comentarios/comentario"/>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="comentario">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
</xsl:stylesheet>
