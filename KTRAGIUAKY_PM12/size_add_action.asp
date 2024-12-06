<!--#include file="connection.asp"-->
<%
sizename = Request.Form("txtSizename")
sizestatus = Request.Form("rdSizestatus")

' Kiểm tra xem kích thước đã tồn tại hay chưa
sql = "select * from 0209266_size_57 where sizename like '" & sizename & "'"
rs.open sql, conn 
if (not rs.eof) then
    session("size_add_error") = "Kích thước " & sizename & " đã tồn tại!"
    Response.Redirect("size_add.asp")
else
    ' Chèn vào CSDL
    sql = "insert into 0209266_size_57(sizename, sizestatus) values ('" & sizename & "'," & sizestatus & ")"
    conn.execute sql 
    session("size_error") = "Thêm mới thành công!"
    response.redirect("size_view.asp")
end if 
rs.close
conn.close
%>
