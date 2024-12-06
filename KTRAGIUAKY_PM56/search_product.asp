<!--#include file="connection.asp"-->
<%
Dim rsCategory, rsSupplier, rsColor
Dim categoryName, productName, supplierName, colorName, hiddenKey

' Lấy danh sách danh mục từ cơ sở dữ liệu
Set rsCategory = conn.Execute("SELECT * FROM categories_0201366_6")
Set rsSupplier = conn.Execute("SELECT * FROM supplier_0201366_6")
Set rsColor = conn.Execute("SELECT * FROM color_0201366_6")

' Khởi tạo các biến
categoryName = Request.Form("txtCname")
productName = Request.Form("txtPname")
supplierName = Request.Form("txtSname")
colorName = Request.Form("txtColorname")
hiddenKey = "66pm6_6"  ' Generating hidden key as per your formula

%>

<html>
<head>
    <meta charset="utf-8">
    <title>Tìm kiếm sản phẩm</title>
</head>
<body>
    <h1 align="center">Tìm kiếm sản phẩm</h1>
    <form action="search_result.asp" method="post">
        <table border="0" cellspacing="5" cellpadding="5" align="center">
            <tr>
                <td>Danh mục:</td>
                <td>
                    <select name="ddlCategory">
                        <% Do While Not rsCategory.EOF %>
                            <option value="<%=rsCategory("cname")%>" <% If categoryName = rsCategory("cname") Then Response.Write("selected") %>><%=rsCategory("cname")%></option>
                            <% rsCategory.MoveNext
                        Loop %>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td>Nhà cung cấp:</td>
                <td>
                    <select name="ddlSupplier">
                        <% Do While Not rsSupplier.EOF %>
                            <option value="<%=rsSupplier("sname")%>" <% If supplierName = rsSupplier("sname") Then Response.Write("selected") %>><%=rsSupplier("sname")%></option>
                            <% rsSupplier.MoveNext
                        Loop %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Màu sắc:</td>
                <td>
                    <select name="ddlColor">
                        <% Do While Not rsColor.EOF %>
                            <option value="<%=rsColor("colorname")%>" <% If colorName = rsColor("colorname") Then Response.Write("selected") %>><%=rsColor("colorname")%></option>
                            <% rsColor.MoveNext
                        Loop %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="hidden" name="hiddenKey" value="<%= hiddenKey %>">
                    <input type="submit" value="Tìm kiếm">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
