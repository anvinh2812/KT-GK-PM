<html>
<head>
    <meta charset="utf-8">
    <title>Thêm mới Nhà cung cấp</title>
</head>
<body>
    <h1 align="center">Thêm mới Nhà cung cấp</h1>
    <center>
        <font color="red">
            <%=Session("supplier_add_error")%>
        </font>
    </center>
    <form action="supplier_add_action.asp" method="POST">
        <table border="0" cellspacing="5" cellpadding="5" align="center">
            <tr>
                <td>Tên nhà cung cấp:</td>
                <td><input type="text" name="txtSname"></td>
            </tr>
            <tr>
                <td>Địa chỉ:</td>
                <td><input type="text" name="txtSaddress"></td>
            </tr>
            <tr>
                <td>Điện thoại:</td>
                <td><input type="text" name="txtSphone"></td>
            </tr>
            <tr>
                <td>Mã số thuế:</td>
                <td><input type="text" name="txtStax"></td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td>
                    <input type="radio" name="rdSstatus" value="1" checked>Hoạt động
                    <input type="radio" name="rdSstatus" value="0">Ngừng hoạt động
                </td>
            </tr>
            <tr>
                <td align="right"><input type="submit" value="Gửi đi"></td>
                <td><input type="reset" value="Hủy bỏ"></td>
            </tr>
        </table>
    </form>
</body>
</html>
