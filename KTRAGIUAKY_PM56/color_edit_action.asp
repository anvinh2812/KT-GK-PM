<!--#include file="connection.asp"-->
<%
colorid = Request.Form("colorid")
colorname = Request.Form("txtColorname")
colorstatus = Request.Form("rdColorstatus")

sql = "update color_0201366_6 set colorname='" & colorname & "', colorstatus=" & colorstatus & " where colorid = " & colorid 
conn.execute sql 
conn.close
session("color_error") = "Cập nhật thành công!"
Response.Redirect("color_view.asp")
%>
