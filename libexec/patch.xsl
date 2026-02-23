<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:rng="http://relaxng.org/ns/structure/1.0"
                xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
                exclude-result-prefixes="rng">
  <xsl:output encoding="UTF-8" indent="yes"/>
  <xsl:template match="rng:grammar">
    <xsl:copy>
      <xsl:attribute name="a:documentation" xml:lang="en">Patched RELAX NG schema for CommonMark XML.  This has more precise sourcepos attribute value, reduced unnecessary definitions, and torelant old cmark behavior.</xsl:attribute>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="/rng:grammar/@datatypeLibrary">
    <xsl:attribute name="{local-name()}">http://www.w3.org/2001/XMLSchema-datatypes</xsl:attribute>
  </xsl:template>
  <xsl:template
      match="rng:define[@name='attlist.list']/rng:optional[rng:attribute[@name='delimiter']]"
      xmlns="http://relaxng.org/ns/structure/1.0">
    <optional>
      <attribute name="delim">
        <ref name="attribute_value.delimiter"/>
      </attribute>
    </optional>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="rng:define[@name='attlist.list']//rng:attribute[@name='delimiter']"
                xmlns="http://relaxng.org/ns/structure/1.0">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ref name="attribute_value.delimiter"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template
      match="rng:define[@name='attlist.list']"
      xmlns="http://relaxng.org/ns/structure/1.0">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
    <define name="attribute_value.delimiter">
      <choice>
        <value>period</value>
        <value>paren</value>
      </choice>
    </define>
  </xsl:template>
  <xsl:template match="rng:define[@name='attlist.ANY']/rng:optional/rng:attribute"
                xmlns="http://relaxng.org/ns/structure/1.0">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <data type="string">
        <param name="pattern">[1-9][0-9]*:[1-9][0-9]*-[1-9][0-9]*:(0|[1-9][0-9]*)</param>
      </data>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="rng:define[@name='ANY']"/>
  <xsl:template match="rng:element"
                xmlns="http://relaxng.org/ns/structure/1.0">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <ref name="attlist.ANY"/>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
