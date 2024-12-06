<!--#include file="connection.asp"-->
<%
Dim productName, category, supplier, size, hiddenKey
productName = Request.Form("txtProductName")
category = Request.Form("slCategory")
supplier = Request.Form("slSupplier")
size = Request.Form("slSize")
hiddenKey = Request.Form("hiddenKey")
sql = "SELECT * FROM 0209266_product_57 WHERE pname LIKE '%" & productName & "%'"
If category <> "" Then
    sql = sql & " AND cid = " & category
End If

If supplier <> "" Then
    sql = sql & " AND sid = " & supplier
End If

If size <> "" Then
    sql = sql & " AND sizeid = " & size
End If

rs.open sql, conn
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Kết quả tìm kiếm sản phẩm</title>
</head>
<body>
    <h1 align=center>Kết quả tìm kiếm sản phẩm</h1>
    <p>Thông tin tìm kiếm:</p>
    <p>Tên sản phẩm: <%= productName %></p>
    <p>Danh mục: <%= category %></p>
    <p>Nhà cung cấp: <%= supplier %></p>
    <p>Kích thước: <%= size %></p>
    <p>Hidden Key: <%= hiddenKey %></p>

    <table border="1" width="800" align="center">
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Mô tả</th>
            <th>Ảnh</th>
            <th>Mã danh mục</th>
            <th>Mã nhà cung cấp</th>
            <th>Mã kích thước</th>
            <th>Trạng thái</th>
        </tr>
        <%
        If Not rs.EOF Then
            Do While Not rs.EOF
        %>
                <tr>
                    <td><%= rs("pid") %></td>
                    <td><%= rs("pname") %></td>
                    <td><%= rs("pdesc") %></td>
                    <td><img src="<%= rs("pimage") %>" width="100"></td>
                    <td><%= rs("cid") %></td>
                    <td><%= rs("sid") %></td>
                    <td><%= rs("sizeid") %></td>
                    <td><%= rs("pstatus") %></td>
                </tr>
        <%
                rs.MoveNext
            Loop
        Else
        %>
            <tr>
                <td colspan="8">Không tìm thấy sản phẩm nào thỏa mãn điều kiện tìm kiếm.</td>
            </tr>
        <%
        End If
        rs.Close
        conn.Close
        %>
    </table>
</body>
</html>
