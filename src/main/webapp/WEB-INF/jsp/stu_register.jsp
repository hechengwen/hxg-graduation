<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <link href="/CSS/common.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
</head>
<body>
<%--<%@include file="banner.jsp" %>--%>
<%--<%@include file="navigation.jsp" %>--%>

<script type="text/javascript">
    /*   function $(id) {
           return document.getElementById(id);
       }*/

    function checkname() {
        var div = document.getElementById("div1");
        div.innerHTML = "";
        var name = $("#name").val();
        if (name.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入学生姓名!";
            document.getElementById("name").focus();
            return false;
        } else {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            return true;
        }
    }

    function checktel() {
        var div = document.getElementById("div2");
        div.innerHTML = "";
        var phone = $("#tel").val();
        var ve = /^1[34578]\d{9}$/;
        if (ve.test(phone)) {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25' />";
            return true;
        }
        else if (phone.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />请输入电话号码！";
            document.getElementById("tel").focus();
            return false;
        }
        else {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />输入有误！";
            return false;
        }
    }

    function checkemail() {
        var div = document.getElementById("div3");
        div.innerHTML = "";
        var email = $("#email").val();
        var ve = /^\w+@\w+\.\w+/;
        if (ve.test(email)) {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25' />";
            return true;
        }
        else if (email.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />请输入电子邮件！";
            document.getElementById("email").focus();
            return false;
        }
        else {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />E-mail无效！";
            // document.form.email.select();
            return false;
        }
    }
</script>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="527" valign="top" bgcolor="#FFFFFF">
            <table width="100%" height="444" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                <tr>
                    <td height="27" valign="top" style="padding:5px;" class="font" align="center"><h1>注&nbsp;&nbsp;&nbsp;&nbsp;册</h1>
                    </td>
                </tr>
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
                                                        <td align="center" style="font-size: 13pt;">学生姓名：</td>
                                                        <td width="427" height="39" style="font-size: 13pt;"><input name="name" type="text"
                                                                                           id="name"
                                                                                           onBlur="checkname()">
                                                            &nbsp; *
                                                            <div id="div1" style="display: inline"></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">学生性别：</td>
                                                        <td height="30" width="10"><select name="sex" id="sex" class="font">
                                                            <option value="男">男</option>
                                                            <option value="女">女</option>
                                                        </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">出生日期：</td>
                                                        <td height="39" style="font-size: 13pt;"><input name="birth" type="text"
                                                                               id="birth">(格式：yyyy-MM-dd)
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">入学时间：</td>
                                                        <td height="39" style="font-size: 13pt;"><input name="rxsj" type="text"
                                                                               id="rxsj">(格式：yyyy-MM-dd)
                                                        </td>

                                                        <td height="39"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">学制：</td>
                                                        <td height="39"><select name="xz" class="font">
                                                            <option value="三年制">三年制</option>
                                                            <option value="四年制">四年制</option>
                                                            <option value="五年制">五年制</option>
                                                        </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">学院：</td>
                                                        <td height="39"><select name="xb" class="font" >
                                                            <option value="机电学院">机电学院</option>
                                                            <option value="光电学院">光电学院</option>
                                                            <option value="自动化学院">自动化学院</option>
                                                            <option value="通信学院">通信学院</option>
                                                            <option value="计算机学院">计算机学院</option>
                                                            <option value="经济管理学院">经济管理学院</option>
                                                            <option value="信息管理学院">信息管理学院</option>
                                                            <option value="马克思主义学院">马克思主义学院</option>
                                                            <option value="公共管理与传媒学院">公共管理与传媒学院</option>
                                                            <option value="外国语学院">外国语学院</option>
                                                            <option value="理学院">理学院</option>
                                                            <option value="国际交流学院">国际交流学院</option>
                                                        </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">班级：</td>
                                                        <td height="39"><input name="bj" type="text"
                                                                               id="bj">
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">宿舍：</td>
                                                        <td height="39"><input name="room" type="text"
                                                                               id="room">
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">联系电话：</td>
                                                        <td height="39" style="font-size: 13pt;"><input name="tel" type="text"
                                                                               id="tel" size="30"
                                                                               onBlur="checktel()"> &nbsp;*
                                                            <div id="div2" style="display: inline"></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center" style="font-size: 13pt;">电子邮箱：</td>
                                                        <td height="39" style="font-size: 13pt;"><input name="email" type="text"
                                                                               id="email" onBlur="checkemail()">如:(username@sina.com)
                                                            <div id="div3" style="display: inline"></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center">&nbsp;</td>
                                                        <td><input name="button" type="button" class="but"
                                                                   value="注册" onclick="check()">
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
        </td>
    </tr>
</table>
</body>

<script type="text/javascript">
    function check() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/admin/register",
            data: $('#form1').serialize(),
            success: function (result) {
                if (result.success == 1) {
                    layer.alert("注册成功", {icon: 1},function () {
                        window.location.href = "/";
                    });

                } else if (result.success == 0) {
                    layer.alert(result.comment,{icon: 2});
                    return;
                }
            },
            error: function () {
                layer.msg("异常！");
            }
        });
    }

</script>
</html>