<!--#include file="connection.asp"-->
<%
sid = Request.Querystring("sid")
'lấy dữ liệu cũ ra để điền vào form
sql = "select * from supplier_0201366_6 where sid=" & sid 
rs.open sql, conn 
if (rs.eof) then
    session("supplier_error") = "Dữ liệu không tồn tại!"
    Response.Redirect("supplier_view.asp")
else
%>
<html>
<head>
<meta charset="utf-8">
<title>Sửa Nhà cung cấp</title>
</head>
<body>
<h1 align=center>Sửa Nhà cung cấp</h1>
<center>
<font color=red>
<%=Session("supplier_edit_error")%>
</font>
</center>
<form action="supplier_edit_action.asp" method=POST>
<table border=0 cellspacing=5 cellpadding=5 align=center>
<tr>
<td>Tên Nhà cung cấp:</td>
<td><input type=text name=txtSname value="<%=rs("sname")%>"></td>
</tr>
<tr>
<td>Địa chỉ:</td>
<td><input type=text name=txtSaddress value="<%=rs("saddress")%>"></td>
</tr>
<tr>
<td>Điện thoại:</td>
<td><input type=text name=txtSphone value="<%=rs("sphone")%>"></td>
</tr>
<tr>
<td>Mã số thuế:</td>
<td><input type=text name=txtStax value="<%=rs("stax")%>"></td>
</tr>
<tr>
<td>Trạng thái:</td>
<td>
<input type=radio name=rdSstatus value=1 <% if (rs("sstatus")=1) then response.write(" checked")%>>Hoạt động
<Input type=radio name=rdSstatus value=0 <% if (rs("sstatus")=0) then response.write(" checked")%>>Ngừng hoạt động
</td>
</tr>
<tr>
<td align=right>
<input type=submit value="Cập nhật">
<input type=hidden value="<%=rs("sid")%>" name="sid">
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