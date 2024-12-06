<!--#include file="connection.asp"-->
<%
    ' Lấy danh sách các danh mục từ bảng Categories
    rsCategories.open "SELECT * FROM 0209266_categories_57", conn 

    ' Lấy danh sách các nhà cung cấp từ bảng 0209266_supplier_57
    rsSuppliers.open "SELECT * FROM 0209266_supplier_57", conn

    ' Lấy danh sách các kích thước từ bảng 0209266_size_57
    rsSizes.open "SELECT * FROM 0209266_size_57", conn
%>

<html>
<head>
    <meta charset="utf-8">
    <title>Thêm mới một sản phẩm</title>
</head>
<body>
    <h1 align="center">Thêm mới một sản phẩm</h1>
    <center><font color="red"><%=Session("product_add_error")%></font></center>
    <form method="POST" action="product_add_action.asp">
        <table border="0" align="center" width="400">
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input style="width:180px" type="text" name="txtPname"></td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td><textarea cols="20" style="width:180px" rows="6" name="taPdesc"></textarea></td>
            </tr>
            <tr>
                <td>Ảnh:</td>
                <td><input type="text" style="width:180px" name="txtPimage"></td>
            </tr>
            <tr>
                <td>Giá:</td>
                <td><input type="text" style="width:180px" name="txtPprice"></td>
            </tr>
            <tr>
                <td>Số lượng:</td>
                <td><input type="text" style="width:180px" name="txtPquantity"></td>
            </tr>
            <tr>
                <td>Danh mục:</td>
                <td>
                    <select name="slCid">
                        <% 
                        while not rsCategories.eof 
                        %>
                            <option value="<%=rsCategories("cid")%>"><%=rsCategories("cname")%></option>
                        <%
                            rsCategories.movenext
                        wend
                        rsCategories.close
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Nhà cung cấp:</td>
                <td>
                    <select name="slSid">
                        <% 
                        while not rsSuppliers.eof 
                        %>
                            <option value="<%=rsSuppliers("sid")%>"><%=rsSuppliers("sname")%></option>
                        <%
                            rsSuppliers.movenext
                        wend
                        rsSuppliers.close
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Kích thước:</td>
                <td>
                    <select name="slSizeid">
                        <% 
                        while not rsSizes.eof 
                        %>
                            <option value="<%=rsSizes("sizeid")%>"><%=rsSizes("sizename")%></option>
                        <%
                            rsSizes.movenext
                        wend
                        rsSizes.close
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td>
                    <input type="radio" checked name="rdPstatus" value="1">Hoạt động
                    <input type="radio" name="rdPstatus" value="0">Ngừng Hoạt động
                </td>
            </tr>
            <tr>
                <td align="right"><input type="submit" value="Thêm mới"></td>
                <td><input type="reset" value="Làm lại"></td>
            </tr>
        </table>
    </form>
</body>
</html>
