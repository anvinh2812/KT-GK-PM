<!--#include file="connection.asp"-->
<%
	pid=Request.QueryString("pid")
	sql = "select * from product_0201366_6 where pid=" & pid
	rs.open sql, conn 
	rs1.open "select * from categories_0201366_6", conn 
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Product_edit</title>
	</head>
	<body>
		<h1 align=center>Sửa thông tin sản phẩm</h1>
		<center><font color=red><%=Session("product_edit_error")%></font></center>
		<form method=POST action="product_edit_action.asp">
		<table border=0 align=center width=400>
		<tr>
		<td>Tên sản phẩm:</td>
		<td><input style="width:180px" type=text name=txtPname value="<%=rs("pname")%>"></td>
		</tr>
		<tr>
		<td>Mô tả:</td>
		<td><textarea cols=20 style="width:180px" rows=6 name=taPdesc><%=rs("pdesc")%></textarea></td>
		</tr>
		<tr>
		<td>Ảnh:</td>
		<td><input type=text  style="width:180px" name=txtPimage value="<%=rs("pimage")%>"></td>
		</tr>
		<tr>
		<td>Giá:</td>
		<td><input type=text style="width:180px" name=txtPprice value="<%=rs("pprice")%>"></td>
		</tr>

		<tr>

		<td>Số lượng:</td>

		<td><input type=text style="width:180px" name=txtPquantity value="<%=rs("pquantity")%>"></td>

		</tr>

		<tr>

		<td>Danh mục:</td>

		<td>

		<select name=slCid>

		<% while not rs1.eof 

		if (rs("cid")=rs1("cid")) then

		%>

		<option value="<%=rs1("cid")%>" selected><%=rs1("cname")%></option>

		<%

		else 

		%>

		<option value="<%=rs1("cid")%>"><%=rs1("cname")%></option>

		<%

		end if

		rs1.movenext

		wend

		rs1.close

		%>

		</select>
		</td>
		</tr>
		<tr>
		<td>Trạng thái:</td>
		<td><%

		if (rs("pstatus")=1) then

		%>

		<input type=radio checked name=rdPstatus value=1>Hoạt động
		<input type=radio name=rdPstatus value=0>Ngừng Hoạt động

		<%

		else 

		%>

		<input type=radio name=rdPstatus value=1>Hoạt động
		<input type=radio checked name=rdPstatus value=0>Ngừng Hoạt động

		<%

		end if 

		%>

		</td>

		</tr>
		<tr>
		<td align=right><input type=submit value="Cập nhật"></td>
		<td><input type=reset value="Làm lại">
		</tr>
		</table>
		<input type=hidden name="pid" value="<%=pid%>">

		<%

		rs.close

		conn.close 

		%>
		</form>
	</body>
</html>
