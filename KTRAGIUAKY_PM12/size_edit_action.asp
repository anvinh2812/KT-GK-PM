<!--#include file="connection.asp"-->
<%
sizeid = Request.Form("sizeid")
sizename = Request.Form("txtSizename")
sizestatus = Request.Form("rdSizestatus")

sql = "UPDATE 0209266_size_57 SET sizename='" & sizename & "', sizestatus=" & sizestatus & " WHERE sizeid = " & sizeid 
conn.execute sql 
conn.close

session("size_error") = "Cập nhật thành công!"
Response.Redirect("size_view.asp")
%>
