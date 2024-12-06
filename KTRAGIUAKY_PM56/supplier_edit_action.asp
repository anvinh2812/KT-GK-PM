<!--#include file="connection.asp"-->
<%
sid = Request.Form("sid")
sname = Request.Form("txtSname")
saddress = Request.Form("txtSaddress")
sphone = Request.Form("txtSphone")
stax = Request.Form("txtStax")
sstatus = Request.Form("rdSstatus")

sql = "update supplier_0201366_6 set sname='" & sname & "', saddress='" & saddress & "', sphone='" & sphone & "', stax='" & stax & "', sstatus=" & sstatus & " where sid = " & sid 
conn.execute sql 
conn.close
session("supplier_error") = "Cập nhật thành công!"
Response.Redirect("supplier_view.asp")
%>
<html>
<head>
<meta charset="utf-8">
<title>Tiêu đề trang web</title>
</head>
<body>
</body>
</html>
