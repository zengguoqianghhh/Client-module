<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        table{
            margin: 200px auto;
        }
        tr,td{
            padding:9px;
            background:#FFFFFF;
        }
        a{
            text-decoration: none;
        }
    </style>
</head>
    <form method="post" action="http://localhost:8080/saveFile" enctype="multipart/form-data" >
        <table  width="400px" border="9" cellspacing="0" bordercolor="silver" align="center">
            <tr align="center"><td><input size="100px" type="file" name="file" /></td></tr>
            <tr align="center"><td><input size="200px" type="submit" value="上传" /></td></tr>
        </table>
    </form>
</body>
</html>