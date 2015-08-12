<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <order>
            <xsl:for-each select="PurchaseOrder/Items/Item">
                <item>
                    <partNumber>
                        <xsl:value-of select="@PartNumber" />
                    </partNumber>
                    <productName>
                        <xsl:value-of select="ProductName" />
                    </productName>
                    <totalPrice>
                        <xsl:value-of select="USPrice*Quantity" />
                    </totalPrice>
                    <delivery>
                        <name>
                            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Name" />
                        </name>
                        <street>
                            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Street" />
                        </street>
                        <city>
                            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/City" />
                        </city>
                        <state>
                            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/State" />
                        </state>
                        <zip>
                            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Zip" />
                        </zip>
                        <country>
                            <xsl:value-of select="/PurchaseOrder/Address[@Type='Shipping']/Country" />
                        </country>
                    </delivery>
                </item>
            </xsl:for-each>
        </order>
    </xsl:template>
</xsl:stylesheet>
