<!--#include file="connection.asp"-->
<%
' Lấy dữ liệu sắp xếp theo sid tăng dần
sql = "select * from 0209266_supplier_57 order by sid asc"
rs.open sql, conn 
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Danh sách Nhà cung cấp</title>
</head>
<body>
    <h1 align="center">Danh sách Nhà cung cấp</h1>
    <center>
        <font color="red">
            <%=Session("supplier_error")%>
        </font>
        <br>
        <a href="supplier_add.asp">Thêm mới Nhà cung cấp</a>
    </center>
    <table border="1" cellspacing="5" cellpadding="5" align="center">
        <tr>
            <th>SID</th>
            <th>Tên</th>
            <th>Địa chỉ</th>
            <th>Điện thoại</th>
            <th>Mã số thuế</th>
            <th>Trạng thái</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        <%
            if (rs.eof) then
                response.write("<tr><td colspan='8'>Bảng không có dữ liệu!</td></tr>")
            else 
                while not rs.eof 
        %>
        <tr>
            <td><%=rs("sid")%></td>
            <td><%=rs("sname")%></td>
            <td><%=rs("saddress")%></td>
            <td><%=rs("sphone")%></td>
            <td><%=rs("stax")%></td>
            <td>
                <% if (rs("sstatus")=0) then
                    response.write("Ngừng hoạt động")
                else 
                    response.write("Hoạt động")
                end if 
                %>
            </td>
            <td>
                <a href="supplier_edit.asp?sid=<%=rs("sid")%>">
                    <img src="images/b_edit.png" border="0">
                </a>
            </td>
            <td>
                <a href="supplier_delete.asp?sid=<%=rs("sid")%>">
                    <img src="images/b_drop.png" border="0">
                </a>
            </td>
        </tr>
        <%
                rs.movenext
                wend 
            end if
            rs.close 
            conn.close 
        %>
    </table>
    <center>
        <a href="supplier_add.asp">Thêm mới Nhà cung cấp</a>
    </center>
</body>
</html>
