<!--#include file="connection.asp"-->
<%
    pname = Request.Form("txtPname")
    pdesc = Request.Form("taPdesc")
    pimage = Request.Form("txtPimage")
    cid = Request.Form("slCid")
    sid = Request.Form("slSid")
    sizeid = Request.Form("slSizeid")
    pprice = Request.Form("txtPprice")
    pquantity = Request.Form("txtPquantity")
    pstatus = Request.Form("rdPstatus")

    ' Kiểm tra nếu tên sản phẩm đã có thì báo lỗi
    sql = "SELECT * FROM 0209266_product_57 WHERE pname='" & pname & "'"
    rs.open sql, conn 
    if (not rs.eof) then
        Session("product_add_error") = "Tên sản phẩm: " & pname & " đã có rồi!"
        Response.Redirect("product_add.asp")    
    else 
        sql = "INSERT INTO 0209266_product_57 (pname, pdesc, pimage, cid, sid, sizeid, pstatus, pprice, pquantity) " & _
              "VALUES ('" & pname & "','" & pdesc & "','" & pimage & "'," & cid & "," & sid & "," & sizeid & "," & pstatus & "," & pprice & "," & pquantity & ")"
        conn.execute sql 
        conn.close
        Session("product_add_error") = ""
        Session("product_error") = "Thêm mới thành công"
        Response.Redirect("product_view.asp")
    end if        
%>
