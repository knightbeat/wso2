<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:for-each select="PurchaseOrder/Items/Item">
            <xsl:value-of select="@PartNumber" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="ProductName" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="USPrice*Quantity" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Name" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Street" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/City" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/State" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Zip" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Country" />
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
