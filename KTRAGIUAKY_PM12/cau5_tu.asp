<!--#include file="connection.asp"-->
<%
    Dim hiddenKey
    hiddenKey = "66PM1_51"
    rs.open "SELECT * FROM 0209266_categories_57", conn
    rsSuppliers.open "SELECT * FROM 0209266_supplier_57", conn
    rsSizes.open "SELECT * FROM 0209266_size_57", conn
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Tìm kiếm sản phẩm</title>
</head>
<body>
    <h1 align=center>Tìm kiếm sản phẩm</h1>
    <form method="POST" action="search_results_tu.asp">
        <table border=0 align=center width=400>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input style="width:180px" type=text name=txtProductName></td>
            </tr>
            <tr>
                <td>Danh mục:</td>
                <td>
                    <select name=slCategory>
                        <% Do While Not rs.EOF %>
                            <option value="<%= rs("cid") %>"><%= rs("cname") %></option>
                            <% rs.MoveNext
                        Loop
                        rs.Close
                    %>
                </select>
                </td>
            </tr>
            <tr>
                <td>Nhà cung cấp:</td>
                <td>
                    <select name=slSupplier>
                        <% Do While Not rsSuppliers.EOF %>
                            <option value="<%= rsSuppliers("sid") %>"><%= rsSuppliers("sname") %></option>
                            <% rsSuppliers.MoveNext
                        Loop
                        rsSuppliers.Close
                    %>
                </select>
                </td>
            </tr>
            <tr>
                <td>Kích thước:</td>
                <td>
                    <select name=slSize>
                        <% Do While Not rsSizes.EOF %>
                            <option value="<%= rsSizes("sizeid") %>"><%= rsSizes("sizename") %></option>
                            <% rsSizes.MoveNext
                        Loop
                        rsSizes.Close
                    %>
                </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="hidden" name="hiddenKey" value="<%= hiddenKey %>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Tìm kiếm"></td>
            </tr>
        </table>
    </form>
</body>
</html>
