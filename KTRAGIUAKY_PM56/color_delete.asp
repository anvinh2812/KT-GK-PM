<!--#include file="connection.asp"-->
<%
colorid = Request.QueryString("colorid")
sql = "delete from color_0201366_6 where colorid=" & colorid 
conn.execute sql 
conn.close
session("color_error")="Xóa thành công!"
Response.Redirect("color_view.asp")
%>
