<?xml version="1.0" encoding="utf-8"?>
<!--
  Copyright (C) Nginx, Inc.
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml" doctype-system="../../../dtd/article.dtd" encoding="utf-8" indent="yes"/>

<!--
  .. a current directory of a XSLT script is where the script is stored,
  .. but not where XSLT processor has been started to run the script
  -->
<xsl:param select="'../xml'" name="XML"/> 

<xsl:param name="LANG"/>

<xsl:template match="modules">
    <article name="{document(concat($XML, '/i18n.xml'))
                    /i18n/text[@lang = $LANG]/item[@id='dirindex']}" link="/{$LANG}/docs/dirindex.html" lang="{$LANG}">
    <section>
    <para>
    <links>
    <xsl:apply-templates select="module"/>
    </links>
    </para>
    </section>
    </article>
</xsl:template>

<xsl:template match="module">
    <xsl:variable select="@name" name="module"/>
    <xsl:for-each select="document(@name)/module/section/directive">
        <link doc="{$module}" id="{@name}"/>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
