<!--#include file="connection.asp"-->
<html>
<head>
<meta charset="utf-8">
<title>Thêm mới màu sắc</title>
</head>
<body>
<h1 align=center>Thêm mới màu sắc</h1>
<center>
<font color=red>
<%=Session("color_add_error")%>
</font>
</center>
<form action="color_add_action.asp" method=POST>
<table border=0 cellspacing=5 cellpadding=5 align=center>
<tr>
<td>Tên màu:</td>
<td><input type=text name=txtColorname></td>
</tr>
<tr>
<td>Trạng thái:</td>
<td>
<input type=radio name=rdColorstatus value=1 checked>Hoạt động
<Input type=radio name=rdColorstatus value=0>Ngừng hoạt động
</td>
</tr>
<tr>
<td align=right>
<input type=submit value="Gửi đi">
</td>
<td><input type=reset value="Hủy bỏ"></td>
</tr>
</table>
</form>
</body>
</html>
