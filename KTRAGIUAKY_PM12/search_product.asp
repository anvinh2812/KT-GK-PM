<!--#include file="connection.asp"-->
<%
Dim rsCategory, rsSupplier, rsSize
Dim categoryName, productName, supplierName, sizeName, hiddenKey

' Lấy danh sách danh mục từ cơ sở dữ liệu
Set rsCategory = conn.Execute("SELECT * FROM 0209266_categories_57")
Set rsSupplier = conn.Execute("SELECT * FROM 0209266_supplier_57")
Set rsSize = conn.Execute("SELECT * FROM 0209266_size_57")

' Khởi tạo các biến
categoryName = Request.Form("ddlCategory")
supplierName = Request.Form("ddlSupplier")
sizeName = Request.Form("ddlSize")
hiddenKey = "66pm1_57"  ' Generating hidden key as per your formula

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
                <td>Kích thước:</td>
                <td>
                    <select name="ddlSize">
                        <% Do While Not rsSize.EOF %>
                            <option value="<%=rsSize("sizename")%>" <% If sizeName = rsSize("sizename") Then Response.Write("selected") %>><%=rsSize("sizename")%></option>
                            <% rsSize.MoveNext
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
