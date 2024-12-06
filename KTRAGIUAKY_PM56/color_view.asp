<!--#include file="connection.asp"-->
<%
sql = "select * from color_0201366_6 order by colorid asc"
rs.open sql, conn 
%>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách màu sắc</title>
</head>
<body>
<h1 align=center>Danh sách màu sắc</h1>
<center>
<font color=red>
<%=Session("color_error")%>
</font>
<br>
<a href="color_add.asp">Thêm mới màu sắc</a>
</center>
<table border=1 cellspacing=5 cellpadding=5 align=center>
<tr>
<th>Mã</th>
<th>Tên</th>
<th>Trạng thái</th>
<th>Sửa</th>
<th>Xóa</th>
</tr>
<%
if (rs.eof) then
response.write("<tr><td colspan=6>Bảng không có dữ liệu!</td></tr>")
else 
while not rs.eof 
%>
<tr>
<td><%=rs("colorid")%></td>
<td><%=rs("colorname")%></td>
<td>
<% if (rs("colorstatus")=1) then
response.write("Hoạt động")
else 
response.write("Ngừng hoạt động")
end if 
%>
</td>
<td><a href="color_edit.asp?colorid=<%=rs("colorid")%>">
<img src="images/b_edit.png" border=0>
</a>
</td>
<td><a href="color_delete.asp?colorid=<%=rs("colorid")%>">
<img src="images/b_drop.png" border=0>
</a>
</td>
<%		
rs.movenext
wend 
end if
rs.close 
conn.close 
%>
</table>
<center>
<a href="color_add.asp">Thêm mới màu sắc</a>
</center>
</body>
</html>
