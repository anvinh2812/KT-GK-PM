<!--#include file="connection.asp"-->
<%
Dim ddlCategory, ddlSupplier, ddlColor
ddlCategory = Request.Form("ddlCategory")
ddlSupplier = Request.Form("ddlSupplier")
ddlColor = Request.Form("ddlColor")
hiddenKey = Request.Form("hiddenKey")

' Query Database
Dim rsProducts
Set rsProducts = conn.Execute("SELECT * FROM products WHERE category = '" & ddlCategory & "' AND supplier = '" & ddlSupplier & "' AND color = '" & ddlColor & "'")

' Begin HTML
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Kết quả tìm kiếm</title>
</head>
<body>
    <h1 align="center">Kết quả tìm kiếm</h1>

    <% If rsProducts.EOF Then %>
        <p align="center">Không tìm thấy sản phẩm phù hợp.</p>
    <% Else %>

        <table border="1" cellspacing="5" cellpadding="5" align="center">
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Danh Mục</th>
                <th>Nhà Cung Cấp</th>
                <th>Màu Sắc</th>
            </tr>
            <% Do While Not rsProducts.EOF %>
                <tr>
                    <td><%=rsProducts("productname")%></td>
                    <td><%=rsProducts("category")%></td>
                    <td><%=rsProducts("supplier")%></td>
                    <td><%=rsProducts("color")%></td>
                </tr>
                <% rsProducts.MoveNext
            Loop %>
        </table>

    <% End If %>

    <% rsProducts.Close %>
    Set rsProducts = Nothing

</body>
</html>
