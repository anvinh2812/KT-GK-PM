<!--#include file="connection.asp"-->
<%
	pid=Request.QueryString("pid")
	sql = "delete from 0209266_product_57 where pid=" & pid
	conn.execute sql 
	conn.close
	Session("product_error")="Xóa thành công"
	Response.Redirect("product_view.asp")
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Product_delete</title>
	</head>
	<body>
	
	</body>
</html>
