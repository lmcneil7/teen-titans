<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
<pattern><title>Checking the move attributes on action elements</title>
    <rule context="action[preceding::action[@mrkr = current()/@mrkr]]">
    <report test="@move" role="info">
        <value-of select="preceding::action[1]/@move"/> is the value of the move attribute on the immediately preceding action element.
    </report>
        <report test="@move = preceding::action[@mrkr = current()/@mrkr]/@move" role="error">
           ZOUNDS! You have encoded the same value for the move attribute on a previous move element. 
        </report>
</rule>
</pattern>
    <pattern>
    <title>Checking the values of @mrkr and @place, so characters don't get coded as places. (This deals with the IDREF problem in Relax NG in which IDREF datatypes can be anything coded as IDs.)</title>
    <rule context="action" role="error">
        <report test="@mrkr = //locList/@id">YIKES! The mrkr attribute must not point to a location! MRKRS are PEOPLE NOT PLACES!</report>
        <report test="@place = //charList/@id">YIKES! The place attribute must not point to a lcharacter! PLACES ARE NOT PEOPLE!</report>
    </rule>    
</pattern>

    
</schema>