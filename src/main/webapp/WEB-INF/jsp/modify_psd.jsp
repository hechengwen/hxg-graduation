<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>

<script type="text/javascript">

    function checkOldPassword() {
        var div = document.getElementById("div1");
        div.innerHTML = "";
        var oldPassword = $("#oldPassword").val();
        if (oldPassword.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入原始密码!";
            document.getElementById("oldPassword").focus();
            return false;
        }
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/admin/oldPassword",
            data: {"oldPassword": oldPassword},
            success: function (result) {
                if (result.success == 1) {
                    div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>原始密码正确";
                    return true;
                } else if (result.success == 0) {
                    div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>原始密码错误!";
                    document.getElementById("oldPassword").focus();
                    return false;
                }
            },
            error: function () {
                alert("异常！");
            }
        });

    }

    function checkNewPassword() {
        var div = document.getElementById("div2");
        div.innerHTML = "";
        var newPassword = $("#newPassword").val();
        var ve = /^\d{6}$/;
        if (ve.test(newPassword)) {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25' />";
            return true;
        }
        else if (newPassword.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />请输入新密码！";
            document.getElementById("newPassword").focus();
            return false;
        }
        else {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />新密码必须为6位数字！";
            document.getElementById("newPassword").focus();
            return false;
        }
    }

    function checkAgain() {
        var div = document.getElementById("div3");
        div.innerHTML = "";
        var email = $("#again").val();
        var newPassword = $("#newPassword").val();
        if (email == newPassword) {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25' />";
            return true;
        } else {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />两次密码输入不一致";
            document.getElementById("again").focus();
            return false;
        }
    }

    function check() {
        var div = document.getElementById("div1");
        div.innerHTML = "";
        var oldPassword = $("#oldPassword").val();
        if (oldPassword.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入原始密码!";
            document.getElementById("oldPassword").focus();
            return false;
        }
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/admin/modifyPassword",
            data: $('#form1').serialize(),
            success: function (result) {
                if (result.success == 1) {
                    layer.msg("密码修改成功，请重新登陆",{time:1000},function () {
                        window.location.href = "/";
                    });
                } else if (result.success == 0) {
                    layer.msg(result.comment);
                    return;
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    }

</script>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="527" valign="top" bgcolor="#FFFFFF">
            <table width="100%" height="444" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：个人中心 &gt; 修改密码&gt;&gt;&gt;</td>
                </tr>
                <tr>
                    <td height="417" align="center" valign="top" style="padding:5px;">
                        <form id="form1" name="form1" method="post" action="">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="47" background="/Images/main_hospital.jpg">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="72" align="center" valign="top" background="/Images/main_booksort_1.gif"
                                        bgcolor="#F8BF73">
                                        <table width="96%" border="0" cellpadding="1" cellspacing="0"
                                               bordercolor="#FFFFFF" bgcolor="#F8BF73">

                                            <tr>
                                                <td valign="top" bgcolor="#FCEC9A" style="padding:5px">
                                                    <table width="99%" border="1" cellpadding="0" cellspacing="0"
                                                           bordercolor="#FFFFFF" bordercolorlight="#FFFFFF"
                                                           bordercolordark="#F6B83B" bgcolor="#FFFFFF">


                                                        <tr>
                                                            <td align="center">原始密码：</td>
                                                            <td width="427" height="39"><input name="oldPassword"
                                                                                               type="password"
                                                                                               id="oldPassword"
                                                                                               onBlur="checkOldPassword()">

                                                                <div id="div1" style="display: inline"></div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">新密码：</td>
                                                            <td height="39"><input name="newPassword"
                                                                                   type="password"
                                                                                   id="newPassword"
                                                                                   onBlur="checkNewPassword()">
                                                                <div id="div2" style="display: inline"></div>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td align="center">再次输入：</td>
                                                            <td height="39"><input name="again"
                                                                                   type="password"
                                                                                   id="again"
                                                                                   onBlur="checkAgain()">
                                                                <div id="div3" style="display: inline"></div>
                                                            </td>

                                                            <td height="39"></td>
                                                        </tr>


                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td><input name="button" type="button" class="btn_grey"
                                                                       value="保存" onclick="check()">
                                                                &nbsp;
                                                                <input name="Submit2" type="button" class="btn_grey"
                                                                       value="返回" onClick="history.back()">
                                                                &nbsp;
                                                                <input name="Submit3" type="reset" class="btn_grey"
                                                                       value="重置"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>

                                </tr>
                                <tr>
                                    <td height="19" background="/Images/main_booksort_2.gif">&nbsp;</td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
            <%@ include file="copyright.jsp" %>
        </td>
    </tr>
</table>
</body>
</html>