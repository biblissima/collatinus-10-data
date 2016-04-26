<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="html" version="2.0" encoding="Utf-8" omit-xml-declaration="yes" indent="no" />

<!-- Adapté par Philippe Verkerk pour l'affichage du Lewis&Short dans Collatinus.  -->

<!-- Adapted from Andromeda lsteiconv.xsl
https://code.google.com/p/andromeda-mac/
thanks to harry.sc...@gmail.com -->


<!-- La balise entryFree est en principe la première que l'on rencontre.  -->
<!-- Elle déclenche l'entête (header) et le corps (body) du html.  -->
<!-- Je fais apparaître en petits caractères rouges le type de l'entrée, 
(sauf pour le type main) : hapax, spur, greek, etc…  -->

<xsl:template match="/entryFree"> 
<div class="body">
<xsl:choose>
<xsl:when test="@type='main'"></xsl:when>
<xsl:otherwise>
<span style="color:#800000">
<small><xsl:value-of select="@type" /></small>
</span>
</xsl:otherwise>
</xsl:choose>
<xsl:apply-templates />
</div>
</xsl:template>

<!-- La balise orth donne le lemme : comme c'est important, je le mets en gras.  -->
<xsl:template match="orth">
<b><xsl:value-of select="." /></b>
</xsl:template>

<!-- La balise itype complète le lemme avec les formes canoniques : en gras.  -->
<xsl:template match="itype">
<b><xsl:value-of select="." /></b>
</xsl:template>

<!-- La balise gen donne le genre : aucun traitement spécial.  -->
<xsl:template match="gen">
<span class="gen"><xsl:value-of select="." /></span>
</xsl:template>

<!-- La balise pos donne le part-of-speech : aucun traitement spécial.  -->
<xsl:template match="pos">
<xsl:value-of select="." />
</xsl:template>

<!-- La balise etym donne l'étymologie : entre [].  -->
<xsl:template match="etym">
[<xsl:value-of select="." />]
</xsl:template>

<!-- La balise sense donne les sens : la hiérarchie est rendue par l'indentation.  -->
<xsl:template match="sense">
<xsl:choose>
<xsl:when test="substring(@id,string-length(@id) - 1)='.0'">
<!-- Je fais une exception pour le premier sens :   -->
<!-- dans le prolongement et sans puce.  -->
<!-- Justifié en particulier pour les mots avec un seul sens.  -->
<xsl:apply-templates />
</xsl:when>
<xsl:otherwise>
<!-- Les autres sens : avec puce, indentation variable.  -->
<xsl:choose>
<xsl:when test="@level=1">
<br />
<div>
<!-- Premier niveau : saut de ligne avant, pas d'indentation, puce en gras.  -->
<b><xsl:value-of select="@n" />.</b>
<xsl:apply-templates />
</div>
</xsl:when>
<xsl:when test="@level=2">
<!-- Deuxième niveau : petite indentation, puce en gras.  -->
<div style="margin-left:30px">
<b><xsl:value-of select="@n" />.</b>
<xsl:apply-templates />
</div>
</xsl:when>
<xsl:when test="@level=3">
<!-- Troisième niveau : indentation moyenne, puce en gras.  -->
<div style="margin-left:60px">
<b><xsl:value-of select="@n" />.</b>
<xsl:apply-templates />
</div>
</xsl:when>
<xsl:when test="@level=4">
<!-- Quadrième niveau : grande indentation, puce en gras.  -->
<div style="margin-left:90px">
<b><xsl:value-of select="@n" />.</b>
<xsl:apply-templates />
</div>
</xsl:when>
<xsl:otherwise>
<!-- Dernier niveau : très grande indentation, puce en grec.  -->
<div style="margin-left:120px">
<xsl:choose>
<xsl:when test="@n='(a)'">(α)</xsl:when>
<xsl:when test="@n='(b)'">(β)</xsl:when>
<xsl:when test="@n='(g)'">(γ)</xsl:when>
<xsl:when test="@n='(d)'">(δ)</xsl:when>
<xsl:otherwise><xsl:value-of select="@n" /></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates />
</div>
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- La balise hi donne souvent la traduction : en italique.  -->
<xsl:template match="hi">
<xsl:choose>
<xsl:when test="@rend='ital'">
<i><xsl:apply-templates /></i>
</xsl:when>
<!-- Je ne suis pas sûr que cet otherwise soit utile -->
<xsl:otherwise>
<xsl:apply-templates />
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="foreign">
<span>
<xsl:attribute name="class">
<xsl:choose>
<xsl:when test="@lang">
<xsl:value-of select="@lang" />
</xsl:when>
<xsl:otherwise>generic-foreign</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
<xsl:value-of select="." /></span>
</xsl:template>

<xsl:template match="cit">
<!-- <span class="cit"><xsl:apply-templates /></span> -->
<xsl:apply-templates />
</xsl:template>

<!-- La balise quote introduit une citation : en bleu.  -->
<xsl:template match="quote">
<span style="color:#0000FF">
<xsl:value-of select="." />
</span>
</xsl:template>

<!-- La balise bibl introduit une référence bibliographie : vert.  -->
<xsl:template match="bibl">
<span style="color:#008000">
<xsl:value-of select="." />
</span>
</xsl:template>

<xsl:template match="case">
<i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="tr">
<i><xsl:apply-templates /></i>
</xsl:template>
    
</xsl:stylesheet>

