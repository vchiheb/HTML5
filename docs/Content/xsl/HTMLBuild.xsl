<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:param name="file1"/>
<xsl:variable name="file" select="document(concat('../html/', $file1, '.html'))"/>

<xsl:variable name="site-header-file" select="document('../html/SiteHeader.html')"/>

<xsl:template match="Document">
    <html>
        <head>
            <xsl:call-template name="head"/>
        </head>
        <body>
            <xsl:call-template name="site-header"/>
            <xsl:call-template name="body"/>
        </body>
    </html>
</xsl:template>

<xsl:template name="site-header">
    <xsl:copy-of select="$site-header-file"/>
</xsl:template>

<xsl:template name="body">
    <xsl:copy-of select="$file"/>
</xsl:template>

<xsl:template name= "head">
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="description">
            <xsl:attribute name="content">
                <xsl:value-of select="Description"/>
            </xsl:attribute>
        </meta>

        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        
        <link rel="stylesheet" href="styles.css"/>
        
        <title><xsl:value-of select="Title"/></title>
        
        <meta property="og:title">
            <xsl:attribute name="content">
                <xsl:value-of select="Title"/>
            </xsl:attribute>
        </meta>

        <meta property="og:description">
            <xsl:attribute name="content">
                <xsl:value-of select="Description"/>
            </xsl:attribute>
        </meta>

        <meta property="og:type" content="website"/>
        <meta property="og:url" content=""/>
        <meta property="og:image" content="image.png"/>

        <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png"/>
        <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon-32x32.png"/>
        <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-16x16.png"/>
</xsl:template>

</xsl:stylesheet>