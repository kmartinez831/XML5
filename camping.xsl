<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

   Cairn Camping Store XSLT Style Sheet
   Author: Kelly Martinez
   Date:   7/7/2024

   Filename:         camping.xsl
   Supporting Files: 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <!-- Root Element Match-->
    <xsl:template match="/">
        <html>
        <head>
            <title>Cairn Camping Store</title>
            <style>
                body { color: #000000; font-family: Arial, sans-serif; }
                h1, h2, h3 { color: #003366; }
                table  {border-collapse: collapse; width: 100%;  }
                th, td {border: 1px solid black; padding: 8px; text-align: left; }
                th { background-color: #32a852; }
            </style>
        </head>
        <body>
            <h1>Cairn Camping Store</h1>
            <xsl:apply-templates select="customers/customer">
                <xsl:sort select="name" order="ascending" />
            </xsl:apply-templates>
        </body>
        </html>
    </xsl:template>
    <!--Match each customer -->
    <xsl:template match="customer">
        <h2>Customer Information</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zip</th>
                <th>ID</th>
            </tr>
            <tr>
                <td><xsl:value-of select="name" /></td>
                <td><xsl:value-of select="street" /></td>
                <td><xsl:value-of select="city" /></td>
                <td><xsl:value-of select="state" /></td>
                <td><xsl:value-of select="zip" /></td>
                <td><xsl:value-of select="@cid" /></td>
            </tr>
        </table>

        <xsl:apply-templates select="orders/order">
            <xsl:sort select="@oid" order="descending" />
        </xsl:apply-templates>
    </xsl:template>

    <!--match each order -->
    <xsl:template match="order">
        <h3>Order Information</h3>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
            </tr>
            <tr>
                <td><xsl:value-of select="@oid" /></td>
                <td><xsl:value-of select="date" /></td>
            </tr>
        </table>
        <h4>Items Purchased</h4>
        <table>
            <tr>
                <th>Item ID</th>
                <th>Description</th>
                <th>Quantity</th>
            </tr>
            <xsl:apply-templates select="item">
                <xsl:sort select="qty" order="descending" />
                <xsl:sort select="@iid" order="ascending" />
            </xsl:apply-templates>
        </table>
    </xsl:template>
    <!-- Match each item-->
    <xsl:template match="item">
        <tr>
            <td><xsl:value-of select="@iid"/></td>
            <td><xsl:value-of select="description"/></td>
            <td><xsl:value-of select="qty"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
