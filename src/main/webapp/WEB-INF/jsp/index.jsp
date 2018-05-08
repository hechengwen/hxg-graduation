<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
    /*body{
        background-image: url(/Images/commhospital.jpg);
        background-size:cover;
    }*/
</style>
<head>
    <title>欢迎使用医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
    <script src="/js/md5.js"></script>
    <script src="/js/sha1.js"></script>
    <script src="/js/base64.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="/CSS/login.css"> -->
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
   <td>
    <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr><td height="142" valign="top">&nbsp;</td></tr>
    </table>
   </td>
 </tr>
   <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr>
       <td valign="top">
        <table width="100%" height="525" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="523" align="center" valign="top">
              <table width="100%" height="271" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="271" align="right" valign="top">
                    <table width="100%" height="255" border="0" cellpadding="0" cellspacing="0" background="/Images/commhospital.jpg" class="tableBorder">
                      <tr> <td height="57">&nbsp;</td> </tr>
                      <tr>
                   	    <td height="179" valign="top">
                         <table width="100%" height="63" border="0" cellpadding="0" cellspacing="0" >
                           <tr>
                             <td width="2%">&nbsp;</td>
                             <td width="97%" align="center" valign="top">
                              <form name="form1" id="form1" action="">
                                 <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                                  <tr><td height="57"><span class="STYLE1"></span></td>
                                      <td width="12%" style="font-size: 13pt;">用户类型：</td>
                                      <td width="15%">
                                      	<select name="userType" id="userType">
                                          <option value="0" id="guanliyuan" > 管理员 </option>
                                          <option value="1" id="yishi">学生 </option>
                                          <option value="2" id="guanliyuan2" > 医生 </option>    
                                        </select>
                                      </td>
									  <td height="57" colspan="2" align="center">&nbsp;&nbsp;</td>
									  <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td width="75%" height="37">&nbsp;</td>
                                      <td style="font-size: 13pt;">用&nbsp;户&nbsp;名：</td>
                                      <td>
                                         <input name="username" type="text" class="logininput"id="username" size="20">
                                  	  </td>
                                  </tr>
                                  <tr>
                                      <td height="37">&nbsp;</td>
                                      <td style="font-size: 13pt;">密&nbsp;&nbsp;码：</td>
                                      <td><input name="password" type="password" class="logininput" id="password" size="20"></td>
                                      <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td height="30">&nbsp;</td>
                                      <td colspan="2" align="center">
                                        <button name="button" type="button" value="登录" onClick="check()">登录</button>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button name="button" type="button" onClick="register()">注册</button>
                                  </tr>
                                </table>
                            </form>
                          </td>
                          <td width="1%">&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td height="19">&nbsp;</td>
                  </tr>
               </table>
            </td>
       	  </tr>
		</table>
        <table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
          <tr>
              <td align="center" class="word_login"></td>
          </tr>
          <tr>
              <td align="center"><h5>版权所有，翻录必究</h5></td>
          </tr>
        </table>
     </td>
   </tr>
 </table>
</td>
</tr>
</table>
</td>
</table>
</body>

<script language="javascript">

    function register() {
        window.location.href="/admin/regIndex";
    }
    function check() {
        var sUserName = $("#username").val();
        var sPassword = $("#password").val();
        var userType = $("#userType").val();
        if (sUserName == "") {
            layer.msg("请输入用户名!",{time:1000});
            return false;
        }

        if (sPassword == "") {
            layer.msg("请输入密码!",{time:1000});
            return false;
        }

        var encryedPassword = hex_md5(sPassword);
//        var b = new Base64();
//        var encryedPassword = b.encode(sPassword);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/admin/login",//url
            data: {"username":sUserName,"password":encryedPassword,"userType":userType},
            success: function (result) {
                // 管理员
                if (result.success == 1 && result.data == 0) {
                    window.location.href = "/admin/sysMain";
                    // 学生
                } else if (result.success == 1 && result.data == 1) {
                    window.location.href = "/admin/stuMain";
                } else if (result.success == 0) {
                    layer.msg(result.comment,{time:1000});
                }
            },
            error: function () {
                layer.msg("异常！");
            }
        });
    }

</script>
</html>
