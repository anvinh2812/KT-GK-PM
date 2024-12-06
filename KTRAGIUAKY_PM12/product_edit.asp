<!--#include file="connection.asp"-->
<%
    pid = Request.Querystring("pid")
    ' Lấy dữ liệu cũ ra để điền vào form
    sql = "SELECT * FROM 0209266_product_57 WHERE pid=" & pid 
    rs.open sql, conn 

    if (rs.eof) then
        session("product_0209266_1_error")="Dữ liệu không tồn tại!"
        Response.Redirect("product_view.asp")
    else
%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Sửa thông tin sản phẩm</title>
    </head>
    <body>
        <h1 align=center>Sửa thông tin sản phẩm</h1>
        <center>
            <font color=red>
                <%=Session("product_edit_error")%>
            </font>
        </center>
        <form action="product_edit_action.asp" method=POST>
            <table border=0 cellspacing=5 cellpadding=5 align=center>
                <tr>
                    <td>Tên sản phẩm:</td>
                    <td><input type=text name=txtPname value="<%=rs("pname")%>"></td>
                </tr>
                <tr>
                    <td>Mô tả:</td>
                    <td><textarea cols=20 rows=6 name=taPdesc><%=rs("pdesc")%></textarea></td>
                </tr>
                <tr>
                    <td>Ảnh:</td>
                    <td>
                        <input type=text name=txtPimage value="<%=rs("pimage")%>">
                        <br>
                        <% 
                        ' Kiểm tra xem trường pimage có dữ liệu hay không
                        If Trim(rs("pimage")) <> "" Then
                        %>
                            <img src="<%=rs("pimage")%>" width=120>
                        <%
                        Else
                        %>
                            Không có ảnh
                        <%
                        End If
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Giá:</td>
                    <td><input type=text name=txtPprice value="<%=rs("pprice")%>"></td>
                </tr>
                <tr>
                    <td>Số lượng:</td>
                    <td><input type=text name=txtPquantity value="<%=rs("pquantity")%>"></td>
                </tr>
                <tr>
                    <tr>
                    <td>Danh mục:</td>
                    <td>
                        <select name="slCid">
                            <% 
                            rsCategories.open "SELECT * FROM 0209266_categories_57", conn 

                            while not rsCategories.eof 
                            %>
                                <% 
                                Dim cid_from_db
                                Dim cid_from_rs

                                ' Chuyển đổi giá trị cid từ cơ sở dữ liệu sang kiểu integer
                                cid_from_db = CInt(rsCategories("cid"))

                                ' Chuyển đổi giá trị cid từ Recordset sang kiểu integer
                                cid_from_rs = CInt(rs("cid"))

                                ' So sánh hai giá trị cid sau khi đã chuyển đổi sang cùng một kiểu
                                If cid_from_db = cid_from_rs Then
                                %>
                                    <option value="<%=cid_from_db%>" selected><%=rsCategories("cname")%></option>
                                <%
                                Else
                                %>
                                    <option value="<%=cid_from_db%>"><%=rsCategories("cname")%></option>
                                <%
                                End If
                                %>
                            <%
                                rsCategories.movenext
                            wend
                            rsCategories.close
                            set rsCategories = Nothing
                            %>
                        </select>
                    </td>
                </tr>
                </tr>
                <tr>
                    <td>Trạng thái:</td>
                    <td>
                        <input type=radio name=rdPstatus value=1 <% if (rs("pstatus")=1) then response.write(" checked")%>>Hoạt động
                        <Input type=radio name=rdPstatus value=0 <% if (rs("pstatus")=0) then response.write(" checked")%>>Ngừng hoạt động
                    </td>
                </tr>
                <tr>
                    <td align=right>
                        <input type=submit value="Cập nhật">
                        <input type=hidden value="<%=rs("pid")%>" name="pid">
                    </td>
                    <td><input type=reset value="Hủy bỏ"></td>
                </tr>
            </table>
        </form>
    </body>
    <%
        end if 
        rs.close
        conn.close 
    %>
</html>
