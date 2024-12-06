<%
	set conn = Server.CreateObject("ADODB.Connection")
	set rs = Server.CreateObject("ADODB.Recordset")
	set rsSizes = Server.CreateObject("ADODB.Recordset")
	set rs1 = Server.CreateObject("ADODB.Recordset")
	set rsCategories = Server.CreateObject("ADODB.Recordset")
	set rsSuppliers = Server.CreateObject("ADODB.Recordset")
	strconn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.Mappath("dbKtra.mdb")
	conn.open strconn  'Mở kết nối	
%>