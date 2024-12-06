<!--#include file="connection.asp"-->
<%
sizeid = Request.QueryString("sizeid")

sql = "DELETE FROM 0209266_size_57 WHERE sizeid=" & sizeid 
conn.execute sql 
conn.close

session("size_error") = "Xóa thành công!"
Response.Redirect("size_view.asp")
%>
