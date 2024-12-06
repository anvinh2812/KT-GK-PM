<!--#include file="connection.asp"-->
<%
	pid=Request.Form("pid")
	pname=Request.Form("txtPname")
	pdesc=Request.Form("taPdesc")
	pimage=Request.Form("txtPimage")
	pprice = Request.Form("txtPprice")
	pquantity = Request.Form("txtPquantity")
	cid=Request.Form("slCid")
	pstatus=Request.Form("rdPstatus")
	sql = "update product_0201366_6 set pname='" & pname & "',pdesc='" & pdesc & "',pimage='" & pimage & "',pprice=" & pprice & ",pquantity=" & pquantity & ",cid=" & cid & ",pstatus=" & pstatus & " where pid = " & pid
	conn.execute sql 
	conn.close
	Session("product_error")="Cập nhật thành công"
	Response.Redirect("product_view.asp")
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	
	</body>
</html>