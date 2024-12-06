<!--#include file="connection.asp"-->
<%
	sql = "select product_0201366_6.*,categories_0201366_6.cname from product_0201366_6, categories_0201366_6 where product_0201366_6.cid = categories_0201366_6.cid"
	rs.open sql, conn  
%>
<html>
	<head>
		<title>Product_view</title>
		<meta charset="utf-8">
	</head>
	<body>
			<h1 align=center>Danh sách các sản phẩm trong hệ thống</h1>
			<center><font color=red><%=Session("product_error")%></center>
			<br>
			<center><a href="product_add.asp">Thêm mới một sản phẩm</a></center>
			<table border=1 width=800 align=center>
				<tr>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm </th>
					<th>Mô tả</th>
					<th>Ảnh</th>
					<th>Nhóm sản phẩm</th>
					<th>Trạng thái</th>
					<th>Mã nhà cung cấp</th>
					<th>Mã màu</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
				%>
					<tr>
						<td><%=rs("pid")%></td>
						<td><%=rs("pname")%></td>
						<td><%=rs("pdesc")%></td>
						<td><img src="images/<%=rs("pimage")%>" width=200></td>
						<td><%=rs("cname")%></td>
						<td><%
								if (rs("pstatus")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
						%></td>
						<td><%=rs("sid")%></td>
						<td><%=rs("colorid")%></td>
						<td><a href="product_edit.asp?pid=<%=rs("pid")%>">Sửa</a></td>
						<td><a confirm= href="product_delete.asp?pid=<%=rs("pid")%>">Xóa</a></td>
					</tr>
				<%
					rs.movenext
					wend
					rs.close
					conn.close 
				%>
				<%
					end if
					%>
			</table>
			<center><a href="product_add.asp">Thêm mới một sản phẩm</a></center>			
			
	</body>
</html>
