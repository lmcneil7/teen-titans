<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
  <!--2019-12-07 ebb: This XSLT is meant to run over the collection of episode XML files for Teen Titans,
 and output a single HTML file for each episode, pairing it up with whatever issues files (if any) are associated with it. -->  
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
   
   <!--These global variables reach for the two collections of XML documents for TV episodes, and for comics. -->
    <xsl:variable name="episodeColl" as="document-node()+" select="collection('../xml/tv/?select=*.xml')"/>
    <xsl:variable name="comicColl" as="document-node()+" select="collection('../xml/comic/?select=*.xml')"/>
    
    <xsl:template match="/">
        <!--In oXygen, run this over a "dummy" XML file from the episode collection in the XSLT mode. -->
        
        
    <xsl:for-each select="$episodeColl/root">    
    <xsl:variable name="filename" as="xs:string" select="current()/base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml') ! concat(., '.html')"/>     
          <xsl:result-document method="html"
              indent="yes"
              href="../web/html/episode-issue/{$filename}">
        <html>
            <head>
                <title><xsl:apply-templates select="descendant::episode"/></title>
                <link rel="stylesheet" type="text/css" href="../teenstyle.css"/>
                <script src="../charToggle.js">/**/</script>
                <link rel="icon" href="../teenTitans-favicon.png"/>
            </head>
            <body>
                <section class="container"> 
                  
                <div id="episode">  
                    
                    <xsl:variable name="episodeNumber" as="xs:double" select="tokenize(current()/base-uri(), '/')[last()] ! substring-before(., '.xml') ! substring-after(., '-') ! number()"/>
                    <h2><xsl:apply-templates select="descendant::episode"/></h2>
                    <h3>Episode number: <xsl:value-of select="$episodeNumber"/></h3>
                    <ul id="episodeNav">
                        <xsl:if test="$episodeNumber gt 1"><li><a href="episode-{$episodeNumber - 1}.html">⇦  Previous episode</a></li></xsl:if>
                        <xsl:if test="$episodeNumber lt 13"> 
                         <li><a href="episode-{$episodeNumber + 1}.html">Next episode ⇨</a></li></xsl:if>
                    </ul>
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
             </div>
             <div id="issue">
             <xsl:choose> 
                 <xsl:when test="descendant::issueInfo"> 
                  <xsl:for-each select="descendant::issueInfo"> 
                   <xsl:choose>
                    <xsl:when test="@link">
                        <xsl:apply-templates select="$comicColl//root[base-uri() ! tokenize(., '/')[last()] = tokenize(current()/@link/string(), '/')[last()]]" mode="comic"/>
  
                    </xsl:when>
                   
                    <xsl:otherwise>
                        <h2>There are no corresponding comic issues.</h2>
                    </xsl:otherwise>
                </xsl:choose>
                 </xsl:for-each>
              </xsl:when>
             <xsl:otherwise>
                 <h2>No information was marked about related comic issues!</h2>
             </xsl:otherwise>
             </xsl:choose>
             </div>    
                  
              </section>
                <p><a href="../index.html">Back To Home</a></p>
            </body>
        </html></xsl:result-document></xsl:for-each>
    </xsl:template>
    <xsl:template match="charList">
        <li><xsl:apply-templates/></li> 
    </xsl:template>
    <xsl:template match="title" mode="toc">
        <li><a href="#A{count(preceding::act)}"><xsl:apply-templates/></a></li>
    </xsl:template>
    
    <xsl:template match="act">
        <div class="act">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="title">
        <h2 id="A{count(preceding::act)}"><xsl:apply-templates/></h2>
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
 <!--ebb: comics issue template rules follow: -->   
   <xsl:template match="root" mode="comic">
       <h1><xsl:apply-templates select="descendant::issueTitle | descendant::title[@issue]"/></h1>
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
       <ul><xsl:apply-templates select="descendant::title" mode="comic-TOC"/></ul>
       <xsl:apply-templates select="descendant::setting" mode="comic"/>
       <h3>References:</h3>
       <ul><xsl:apply-templates select="descendant::reference"/></ul>
       <hr/>
   </xsl:template>
    
    
    <xsl:template match="setting" mode="comic-TOC">
        <xsl:apply-templates select="title" mode="comic-TOC"/>
    </xsl:template>
    <xsl:template match="descendant::setting" mode="comic">
        <xsl:apply-templates select="title" mode="comic"/>
        <p><xsl:apply-templates select="p"/></p>
        <h3>Characters Present:</h3>
       <ul> <xsl:apply-templates select="descendant::char" mode="comic"/></ul>
    </xsl:template>
    <xsl:template match="title" mode="comic-TOC">
        <li><a href="#i{preceding::issueTitle/@issue}s{count(preceding::title)}"><xsl:apply-templates/></a></li>
    </xsl:template>
    <xsl:template match="title" mode="comic">
        <h2 id="i{preceding::issueTitle/@issue}s{count(preceding::title)}">
            <span class="setting">
                <xsl:apply-templates/>
            </span>
        </h2>
    </xsl:template>
    <xsl:template match="descendant::char" mode="comic">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="setting//char">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="act//char">
        <span class="char"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="reference">
        <li><xsl:apply-templates/></li>
    </xsl:template>
  
</xsl:stylesheet>