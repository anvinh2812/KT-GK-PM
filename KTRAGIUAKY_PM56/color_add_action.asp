<!--#include file="connection.asp"-->
<%
colorname = Request.Form("txtColorname")
colorstatus = Request.Form("rdColorstatus")

' Kiểm tra xem màu đã tồn tại hay chưa
sql = "select * from color_0201366_6 where colorname like '" & colorname & "'"
rs.open sql, conn 
if (not rs.eof) then
    session("color_add_error") = "Màu " & colorname & " đã tồn tại!"
    Response.Redirect("color_add.asp")
else
    ' Chèn vào CSDL
    sql = "insert into color_0201366_6(colorname, colorstatus) values ('" & colorname & "'," & colorstatus & ")"
    conn.execute sql 
    session("color_error") = "Thêm mới thành công!"
    response.redirect("color_view.asp")
end if 
rs.close
conn.close
%>
