<!--#include file="connection.asp"-->
<html>
<head>
    <meta charset="utf-8">
    <title>Thêm mới kích thước</title>
</head>
<body>
    <h1 align="center">Thêm mới kích thước</h1>
    <center>
        <font color="red">
            <%=Session("size_add_error")%>
        </font>
    </center>
    <form action="size_add_action.asp" method="POST">
        <table border="0" cellspacing="5" cellpadding="5" align="center">
            <tr>
                <td>Tên kích thước:</td>
                <td><input type="text" name="txtSizename"></td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td>
                    <input type="radio" name="rdSizestatus" value="1" checked>Hoạt động
                    <input type="radio" name="rdSizestatus" value="0">Ngừng hoạt động
                </td>
            </tr>
            <tr>
                <td align="right">
                    <input type="submit" value="Gửi đi">
                </td>
                <td><input type="reset" value="Hủy bỏ"></td>
            </tr>
        </table>
    </form>
</body>
</html>
