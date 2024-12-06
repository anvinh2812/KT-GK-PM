<!--#include file="connection.asp"-->
<%
	cid = Request.QueryString("cid")
	sql = "delete from categories_0201366_6 where cid=" & cid 
	conn.execute sql 
	conn.close
	session("categories_error")="Xóa thành công!"
	Response.Redirect("categories_view.asp")
	
%>