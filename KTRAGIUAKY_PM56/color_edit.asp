<!--#include file="connection.asp"-->
<%
colorid = Request.Querystring("colorid")
'lấy dữ liệu cũ ra để điền vào form
sql = "select * from color_0201366_6 where colorid=" & colorid 
rs.open sql, conn 
if (rs.eof) then
    session("color_error") = "Dữ liệu không tồn tại!"
    Response.Redirect("color_view.asp")
else
%>
<html>
<head>
<meta charset="utf-8">
<title>Sửa màu sắc</title>
</head>
<body>
<h1 align=center>Sửa màu sắc</h1>
<center>
<font color=red>
<%=Session("color_edit_error")%>
</font>
</center>
<form action="color_edit_action.asp" method=POST>
<table border=0 cellspacing=5 cellpadding=5 align=center>
<tr>
<td>Tên màu:</td>
<td><input type=text name=txtColorname value="<%=rs("colorname")%>"></td>
</tr>
<tr>
<td>Trạng thái:</td>
<td>
<input type=radio name=rdColorstatus value=1 <% if (rs("colorstatus")=1) then response.write(" checked")%>>Hoạt động
<Input type=radio name=rdColorstatus value=0 <% if (rs("colorstatus")=0) then response.write(" checked")%>>Ngừng hoạt động
</td>
</tr>
<tr>
<td align=right>
<input type=submit value="Cập nhật">
<input type=hidden value="<%=rs("colorid")%>" name="colorid">
</td>
<td><input type=reset value="Hủy bỏ"></td>
</tr>
</table>
</form>
</body>
<%
end if 
rs.close
conn.close 
%>
</html>
