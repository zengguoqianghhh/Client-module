<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://passport.cnblogs.com/scripts/jsencrypt.min.js"></script>
    <script>
        var chars =['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G'];
        function generateMixed(n) {
            var res = "";
            for(var i = 0; i < n ; i++) {
                var id = Math.ceil(Math.random()*16);
                res += chars[id];
            }
            return res;
        }

        $(document).ready(function(){
            //$("#prikey").hide();
           // $("#signature").hide();
            //var sid = generateMixed(20);
            var sid = "1111111111";
            var encrypt = new JSEncrypt();
            encrypt.setPrivateKey($('#prikey').val());
            var encrypted = encrypt.encrypt(sid);
            console.log($('#prikey').val());
            $("#signature").val(encrypted);
            $("#sid").val(sid);

        });


    </script>
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
    <form method="post" action="http://localhost:9090/saveFile" enctype="multipart/form-data" >
        <table  width="400px" border="9" cellspacing="0" bordercolor="silver" align="center">
            <tr align="center"><td><input size="100px" type="file" name="file" /></td></tr>
            <input id="signature" type="text" name="signature" value="123"/>
            <input id="sid" type="text" name="sid" value="123"/>
            <tr align="center"><td><input size="200px" type="submit" value="上传" /></td></tr>
        </table>
    </form>
<textarea id="prikey" >MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAIQYQ2d/et2I7bSKygtCp7PDXYWhZcgj0UHDydHUxZDdfQJXM6ypjWE6bEP9gj04HtZUhpVrHm2PWX7CToDS/zlng6kZarPgHkvd8JSUHB/8zoNceVI3U5m229AXc55a9zqC8keKFHumnXzNzgp8InHRHLoisYf/ZI05UTUAiC9FAgMBAAECgYAGNcHNds/G5G4QY8n1149cwx19b8YCL7Thu5ucUr1q/w6mcoUKY/oyjPWUCLH7wMyqVNTy51NJ4UhazjW0lrbK4ZbPDHFij9CiZ7QFASiQ/TQWaL+KSIWnE6/rK9IdouwFKxk+cvvLteZoAXP6mFcrsa7LzfkENiIMu7mjpTNHAQJBANXv9U5JWOAVhWHDQcEWKn7YKpAVRleXdeUeJrXcdkqBDI+P6suA9j+ahDREfu+x65wUsrJotPHUXgJG0TarJIUCQQCeEPLrv6Qvi5+nbn2Eifn/fjsmIdI0U2WZKDHWJEnLsRUuGDNYxVE/SPDNDedA2OHeFB6j0Kk/ECdsWnUq6zvBAkAgUGViFMwa1MVX1fFZo+p5TFdpef0s/9Cr8djxAULQ0BtAmAFkCa+oPcOYTXxK4jnvUmUHc69ZE7W7bEzvj/wtAkB50X4mClAzBFxK4XCC0QOG0HYtcStbgFpwqvWdn+Hvxc4Y9DW+WHPBXimXHvv2ki+gw8jJX2rQW1bGvwBFz30BAkASPkORJxVWv91StjI2f/HXDO5eG5/su/XIb3eajaLUSEdaQlcs3ywLrrJ0o3VAR0J9aq59cmp6em017AMnmbF7
</textarea><br/>
</body>
</html>