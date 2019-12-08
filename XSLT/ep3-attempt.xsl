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
                <title><xsl:apply-templates select="descendant::episode"/></title>
                <link rel="stylesheet" type="text/css" href="../web/css/teenstyle.css"/>
                <script src="../web/html/charToggle.js">/**/</script>
            </head>
            <body>
                <h2><xsl:apply-templates select="descendant::episode"/></h2>
                <h3>Writer: <xsl:apply-templates select="descendant::writer"/><br/>
                Director: <xsl:apply-templates select="descendant::director"/><br/>
                Storyboard: <xsl:apply-templates select="descendant::storyboard"/></h3>
                <h3>Character List: </h3>
                <ul><xsl:apply-templates select="descendant::charList"/></ul>
               <h3>Acts:</h3>
                <ul><xsl:apply-templates select="descendant::title" mode="toc"/></ul>
                <hr/>
                
                <div id="fieldset">
                    <fieldset>
                        <legend>Click to Highlight:</legend>
                        <input type="checkbox" id="ROBtoggle" style="cursor:pointer" />
                        <span class="robin">Robin</span>
                        <br/>
                        <input type="checkbox" id="BBtoggle" style="cursor:pointer" />
                        <span class="beastBoy">Beast Boy</span>
                        <br/>
                        <input type="checkbox" id="CYtoggle" style="cursor:pointer" />
                        <span class="cyborg">Cyborg</span>
                        <br/>
                        <input type="checkbox" id="RAVtoggle" style="cursor:pointer" />
                        <span class="raven">Raven</span>
                        <br/>
                        <input type="checkbox" id="STARtoggle" style="cursor:pointer" />
                        <span class="starfire">Starfire</span>
                        <br/>
                    </fieldset>
                </div>
                  <xsl:apply-templates select="descendant::body"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="charList">
        <li><xsl:apply-templates/></li> 
    </xsl:template>
    <xsl:template match="title" mode="toc">
        <li><a href="#A{count(preceding::act)}"><xsl:apply-templates/></a></li>
    </xsl:template>
    
    <xsl:template match="act">
        <span class="act" n="{count(preceding::act)}" id="A{count(preceding::act)}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="title">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="sd">
        <i><xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>) </xsl:text></i>
    </xsl:template>
    <xsl:template match="spkr">
        <b><xsl:apply-templates/><xsl:text>: </xsl:text></b>
    </xsl:template>
    <xsl:template match="sp">
        <p><xsl:apply-templates/></p>
    </xsl:template>
        <xsl:template match="spkr[@ref='#Cyborg']">
            <span class="cyborg"><xsl:apply-templates/><xsl:text>: </xsl:text></span>
    </xsl:template>
    <xsl:template match="spkr[@ref='#BeastBoy']">
        <span class="beastBoy"><xsl:apply-templates/><xsl:text>: </xsl:text></span>
    </xsl:template>
    <xsl:template match="spkr[@ref='#Raven']">
        <span class="raven"><xsl:apply-templates/><xsl:text>: </xsl:text></span>
    </xsl:template>
    <xsl:template match="spkr[@ref='#Starfire']">
        <span class="starfire"><xsl:apply-templates/><xsl:text>: </xsl:text></span>
    </xsl:template>
    <xsl:template match="spkr[@ref='#Robin']">
        <span class="robin"><xsl:apply-templates/><xsl:text>: </xsl:text></span>
    </xsl:template>
    
    
  
</xsl:stylesheet>