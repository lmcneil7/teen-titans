<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../web/css/teenstyle.css"/>
            </head>
            <body>
                <h1><xsl:apply-templates select="descendant::issueTitle"/></h1>
                <h3>Publisher: <xsl:apply-templates select="descendant::publisher"/><br/>
                    Writer: <xsl:apply-templates select="descendant::writer"/><br/>
                    Penciller: <xsl:apply-templates select="descendant::penciller"/><br/>
                Finisher: <xsl:apply-templates select="descendant::finisher"/><br/>
                    Letterer: <xsl:apply-templates select="descendant::letterer"/> <br/>
                    Colorist: <xsl:apply-templates select="descendant::colorist"/> <br/>
                    Editor: <xsl:apply-templates select="descendant::editor"/> <br/>
                </h3>
                <h3>Character List:</h3>
                <ul><xsl:apply-templates select="descendant::charList"/></ul>
                <h3>Settings</h3>
                <ul><xsl:apply-templates select="descendant::title" mode="toc"/></ul>
                <hr/>
                <xsl:apply-templates select="descendant::setting"/>
                <h3>Place References:</h3>
                <ul><xsl:apply-templates select="descendant::reference"/></ul>
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="charList">
        <li><xsl:apply-templates/></li> 
    </xsl:template>
    <xsl:template match="title" mode="toc">
        <li><a href="#A{count(preceding::title)}"><xsl:apply-templates/></a></li>
    </xsl:template>
  <xsl:template match="title">
      <h2>
      <span class="act" n="{count(preceding::title)}" id="A{count(preceding::title)}">
          <xsl:apply-templates/>
      </span>
      </h2>
  </xsl:template>
  
    <xsl:template match="setting">
        <xsl:apply-templates select="title"/>
        <p><xsl:apply-templates select="p"/></p>
        <h3>Characters Present:</h3>
        <xsl:apply-templates select="descendant::char"/>
    </xsl:template>
    <xsl:template match="descendant::char">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="reference">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    
    
</xsl:stylesheet>