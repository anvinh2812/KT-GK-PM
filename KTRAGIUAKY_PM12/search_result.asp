<!--#include file="connection.asp"-->
<!--#include file="connection.asp"-->
<%
Dim categoryName, supplierName, sizeName, hiddenKey

' Nhận các thông tin từ form trước đó
categoryName = Request.Form("ddlCategory")
supplierName = Request.Form("ddlSupplier")
sizeName = Request.Form("ddlSize")
hiddenKey = Request.Form("hiddenKey")

' Tìm sản phẩm phù hợp
Dim sql
sql = "SELECT p.*, c.cname AS category_name, s.sname AS supplier_name, si.sizename AS size_name " & _
      "FROM 0209266_product_57 p, 0209266_categories_57 c, 0209266_supplier_57 s, 0209266_size_57 si " & _
      "WHERE p.cid = c.cid AND p.sid = s.sid AND p.sizeid = si.sizeid " & _
      "  AND c.cname = '" & categoryName & "' " & _
      "  AND s.sname = '" & supplierName & "' " & _
      "  AND si.sizename = '" & sizeName & "'"

Dim rsProducts
Set rsProducts = conn.Execute(sql)
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Kết quả tìm kiếm</title>
</head>
<body>
    <h1 align="center">Kết quả tìm kiếm</h1>

    <!-- Hiển thị hidden key -->
    <p align=center>Hidden Key: <%= hiddenKey %></p>

    <!-- Hiển thị danh sách sản phẩm -->
    <% If rsProducts.EOF Then %>
        <p align=center>Không có sản phẩm phù hợp.</p>
    <% Else %>
        <table border="1" cellspacing="5" cellpadding="5" align="center">
            <tr>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Mô tả</th>
                <th>Ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Danh mục</th>
                <th>Nhà cung cấp</th>
                <th>Kích thước</th>
                <th>Trạng thái</th>
            </tr>
            <% 
            Do While Not rsProducts.EOF
            %>
            <tr>
                <td><%= rsProducts("pid") %></td>
                <td><%= rsProducts("pname") %></td>
                <td><%= rsProducts("pdesc") %></td>
                <td><%= rsProducts("pimage") %></td>
                <td><%= rsProducts("pprice") %></td>
                <td><%= rsProducts("pquantity") %></td>
                <td><%= rsProducts("category_name") %></td>
                <td><%= rsProducts("supplier_name") %></td>
                <td><%= rsProducts("size_name") %></td>
                <td><%= rsProducts("pstatus") %></td>
            </tr>
            <% 
                rsProducts.MoveNext
            Loop
            rsProducts.Close
            Set rsProducts = Nothing
            %>
        </table>
    <% End If %>
</body>
</html>
