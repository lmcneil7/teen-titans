<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
<pattern>
    <rule context="action[preceding::action[@mrkr = current()/@mrkr]]">
    <report test="@move" role="info">
        <value-of select="preceding::action[1]/@move"/> is the value of the move attribute on the immediately preceding action element.
    </report>
        <report test="@move = preceding::action[@mrkr = current()/@mrkr]/@move" role="error">
           ZOUNDS! You have encoded the same value for the move attribute on a previous move element. 
        </report>
    
</rule>
</pattern>

    
</schema>