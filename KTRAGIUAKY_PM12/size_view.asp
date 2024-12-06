<!--#include file="connection.asp"-->
<%
    sql = "SELECT * FROM 0209266_size_57 ORDER BY sizeid ASC"
    rs.open sql, conn 
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Xem kích thước</title>
</head>
<body>
    <h1 align="center">Danh sách kích thước</h1>
    <center>
        <font color="red">
            <%=Session("size_error")%>
        </font>
        <br>
        <a href="size_add.asp">Thêm mới kích thước</a>
    </center>
    <table border="1" cellspacing="5" cellpadding="5" align="center">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Trạng thái</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        <%
            if (rs.eof) then
                response.write("<tr><td colspan='5'>Bảng không có dữ liệu!</td></tr>")
            else 
                while not rs.eof 
        %>
        <tr>
            <td><%=rs("sizeid")%></td>
            <td><%=rs("sizename")%></td>
            <td>
                <% 
                    if (rs("sizestatus")=1) then
                        response.write("Hoạt động")
                    else 
                        response.write("Ngừng hoạt động")
                    end if 
                %>
            </td>
            <td>
                <a href="size_edit.asp?sizeid=<%=rs("sizeid")%>">
                    <img src="images/b_edit.png" border="0">
                </a>
            </td>
            <td>
                <a href="size_delete.asp?sizeid=<%=rs("sizeid")%>">
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
        <a href="size_add.asp">Thêm mới kích thước</a>
    </center>
</body>
</html>
