<?xml version="1.0" encoding="UTF-8"?>
<!-- C:\AL500V20sp3389\Alephcom\files\UPS50\PrintTemplates\eng\loan-receipt.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:template match="text()|@*">
    <xsl:apply-templates/>
</xsl:template>
<xsl:template match="/">
<html>
<head>
<title>Loan Receipt</title>
<style type="text/css">
body, table {
    font-family:Arial, sans-serif;
    font-size:8pt;
}
.header {
    text-align:center;
    width:74mm;
}
.logo {
    margin-bottom:5mm;
}
.address, .date, .formname {
    font-weight:bold;
    margin-bottom:2mm;
}
.patron, .body {
    text-align:left;
    width:74mm;
    border-top:dotted 0.25mm #000;
    padding:2mm 0;
}
td {
    vertical-align:top;
}
td.label {
    float:left;
    width:18mm;
    padding-right:2mm;
    text-align: right;
    overflow:hidden;
}
td.data {
    /*width:40mm;*/
}
.footer {
    text-align:center;
    width:74mm;
    padding:2mm 0;
    border-top:dotted 0.25mm #000;
}
.formname, .tagline {
    font-weight:bold;
    font-size:12pt;
    margin-bottom:2mm;
}
.url {
    font-weight:bold;
    font-size:10pt;
}
.qr {
    margin-bottom:2mm;
}
</style>
</head>
<body style="width:60mm;">
<div class="header">
    <div class="logo">
        <img src="http://hsl.upstate.edu/img/hsl2.png" />
    </div>
    <div class="address">
    766 Irving Ave, Syracuse, NY 13210<br/>
    315-464-7091
    </div>
    <div class="date"><xsl:value-of  select="current-date()"/></div>
    <div class="formname">Loan Receipt</div>
</div>
<div class="patron">
    <table border="0">
		<tr>
			<td class="label">Name</td>
			<td class="data"><xsl:value-of select="printout/section-01/z302-name"/></td>
		</tr>
		<tr>
			<td class="label">Barcode</td>
			<td class="data"><xsl:value-of select="printout/section-01/z302-key-01"/></td>
		</tr>
    </table>
</div>
<xsl:apply-templates/>
<div class="footer">
    <div class="tagline">How did we do?</div>
    <div class="qr">
        <img src="http://hsl.upstate.edu/img/qr_survey.png" />
    </div>
    <div class="url">hsl.upstate.edu/survey</div>
</div>
</body>
</html>
</xsl:template>
<xsl:template match="printout/section-02">
<div class="body">
	<table border="0">
		<tr>
			<td class="label">Title</td>
			<td class="data"><xsl:value-of select="z13-title" /></td>
		</tr>
		<tr>
			<td class="label">Description</td>
			<td class="data"><xsl:value-of select="z30-description" /></td>
		</tr>
		<tr>
			<td class="label">Call Num</td>
			<td class="data"><xsl:value-of select="z13-call-no" /></td>
		</tr>
		<tr>
			<td class="label">Barcode</td>
			<td class="data"><xsl:value-of select="z30-barcode" /></td>
		</tr>
		<tr>
			<td class="label">Loaned</td>
			<td class="data">
			<xsl:value-of select="z36-loan-date"/><xsl:text> </xsl:text>
			<xsl:value-of select="z36-loan-hour" />
			</td>
		</tr>
		<tr>
			<td class="label">Due</td>
			<td class="data">
			<xsl:value-of select="z36-due-date"/><xsl:text> </xsl:text>
			<xsl:value-of select="z36-due-hour" />
			</td>
		</tr>
	</table>
</div>
</xsl:template>
</xsl:stylesheet>
