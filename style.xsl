<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>

<xsl:template match="/">
<html>
<body>
<h1>Activity Badges</h1>

<!-- 只筛选 activity 类型，并按 name 排序 -->
<xsl:apply-templates select="badges/badge[@type='activity']">
<xsl:sort select="name" order="ascending"/>
</xsl:apply-templates>

<!-- 版权信息 -->
<p><i>&#xA9; College Productions Ltd</i></p>
</body>
</html>
</xsl:template>

<xsl:template match="badge">
<h2><xsl:value-of select="name"/></h2>
<p><xsl:value-of select="description"/></p>
<xsl:apply-templates select="levels"/>
</xsl:template>

<xsl:template match="levels">
<xsl:apply-templates select="availability"/>
</xsl:template>

<xsl:template match="availability">
<xsl:choose>
<xsl:when test="@level='beaver'">Beaver: </xsl:when>
<xsl:when test="@level='scout'">Scout: </xsl:when>
<xsl:otherwise>Cub: </xsl:otherwise>
</xsl:choose>
<xsl:value-of select="."/>
<br/>
</xsl:template>

</xsl:stylesheet>