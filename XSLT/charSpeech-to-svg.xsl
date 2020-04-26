<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
 
    <!--2019-12-05 ebb: Here's my revision of your code, so you can see how the xsl:for-each works to simplify things! The hard part here is just the XPath to coordinate your charList elements with counts of all the matching speeches. Also, you need to see how position() and current() work in the XSLT. 
        * We use current() to get the current charList element (cast list member) being processed. 
        * We use position() (literally the position of the current charList element in for-each loop) to multiply with your $X-Stretcher value to space across the screen.
    -->
    
    <xsl:variable name="Y-Spacer" as="xs:integer" select="10"/>  
    <xsl:variable name="X-Stretcher" as="xs:integer" select="100"/>
  
 <!--ebb: I'm adjusting some of these values to match your grid-lines to your actual plot. We're just going to work with an $X-Spacer and  $Y-Spacer here. -->
    
    
    <xsl:template match="/">
        <svg width="100%" height="100%">
            <g transform="translate(25, 410) scale(.6)">
                <text x="{6 * $X-Stretcher}" y="-620" text-anchor="middle" fill="DodgerBlue" font-size="40"><xsl:apply-templates select="descendant::episode"/></text>
                
                <!--x and y axes -->  
                <line x1="50" y1="0" x2="1200" y2="0" stroke="BlueViolet" stroke-width="3"/>
                <line x1="50" y1="0" x2="50" y2="{-60 * $Y-Spacer}" stroke="BlueViolet" stroke-width="3"/>
            
                <!--Here's our for-each over each character: -->      
                <xsl:for-each select="descendant::charList">
                    <xsl:sort select="//sp/spkr[@ref  = current()/@id] => count()" order="descending"/>
                    
    <g id="{current()/@id}"> <text x="{position() * $X-Stretcher} " y="30" text-anchor="start" font-size="22" fill="blue"><xsl:value-of select="current()"/></text>
                    
                    <rect x="{position() * $X-Stretcher}" y="-{//sp/spkr[@ref  = current()/@id] => count() * $Y-Spacer}" width="75" height="{//sp/spkr[@ref = current()/@id] => count() * $Y-Spacer}" fill="lightgrey"/></g>
                    <!--ebb: I want to see what your counts are as a number, so I'm going to output that as an xsl:comment. You might want to change this to a text label that appears on your plot.  -->
                    
               <xsl:comment>Count of <xsl:value-of select="current()"/> speeches is: <xsl:value-of select="//sp/spkr[@ref = current()/@id] => count()"/></xsl:comment>
            <!--ebb: from this, skimming your output in oXygen, I see that Cyborg, the one with the most speeches, has 43. So that means my plot needs to go from 0 up to 50, and I need a reasonable factor to space that out. If we set $Y-Spacer at 10, that means the graph needs to go up to -500, and something above that, to maybe -600 to accomodate the title. I've just set your title at -550. -->        
                </xsl:for-each>
                
               
         <!-- ebb: So, I threw off your carefully crafted grid lines from the old plot, but I'll try to replace them so they match the new plot. I'm holding one of them for reference. Look below this comment to see how to do a for-each that loops over integers to plot hash lines. 
            <text x="15" y="{55 * $Y-Spacer}" fill="#ff4dc4" text-anchor="middle">5</text>
                <line x1="25" y1="{55 * $Y-Spacer}" x2="{34*$X-Stretcher}" y2="{55*$Y-Spacer}" stroke="Chartreuse" stroke-dasharray="10"/>
                We want a number range from 0 to 5 to go over to plot 5 lines at 10, 20, 30, 40, and 50. 
         -->
   <xsl:for-each select="1 to 6">
       
       <text x="35" y="-{current() * 10 *$Y-Spacer}" fill="#ff4dc4" text-anchor="middle" font-size="20"><xsl:value-of select="current() * 10"/></text>
       <line x1="50" y1="-{current() * 10 * $Y-Spacer}" x2="{11*$X-Stretcher}" y2="-{current() * 10 *$Y-Spacer}" stroke="Chartreuse" stroke-dasharray="10"/>
       
       
   </xsl:for-each>
                
            </g>
        </svg>
        
    </xsl:template>
 
</xsl:stylesheet>