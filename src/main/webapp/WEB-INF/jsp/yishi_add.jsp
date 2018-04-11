<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>

<script type="text/javascript">
 /*   function $(id) {
        return document.getElementById(id);
    }*/

    function checkname() {
        var div = document.getElementById("div1");
        div.innerHTML = "";
        var name = $("name").value;
        if (name.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入医师姓名!";
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
        var phone = $("tel").value;
        var ve = /^1[34578]\d{9}$/;
        if (ve.test(phone)) {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25' />";
            return true;
        }
        else if (phone.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />请输入电话号码！";
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
        var email = $("email").value;
        var ve = /^\w+@\w+\.\w+/;
        if (ve.test(email)) {
            div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25' />";
            return true;
        }
        else if (email.length == 0) {
            div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25' />请输入电子邮件！";
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
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：医师管理 &gt; 医师信息录入&gt;&gt;&gt;</td>
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
                                                            <td align="center">医师姓名：</td>
                                                            <td width="427" height="39"><input name="name" type="text"
                                                                                               id="name"
                                                                                               onBlur="checkname()">
                                                                &nbsp; *
                                                                <div id="div1" style="display: inline"></div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">医师性别：</td>
                                                            <td height="39" width="10"><select name="sex" id="sex">
                                                                <option value="男">男</option>
                                                                <option value="女">女</option>
                                                            </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">出生日期：</td>
                                                            <td height="39"><input name="birth" type="text"
                                                                                   id="birth">(格式：yyyy-MM-dd)
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td align="center">从业年份：</td>
                                                            <td height="39"><input name="cynf" type="text"
                                                                                           id="cynf">(格式：yyyy-MM-dd)
                                                            </td>

                                                            <td height="39"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">职称：</td>
                                                            <td height="39"><select name="positionalTitles">
                                                                <option value="主治医师">主任医师</option>
                                                                <option value="副主治医师">副主任医师</option>
                                                            </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">联系电话：</td>
                                                            <td height="39"><input name="tel" type="text"
                                                                                   id="tel" size="30"
                                                                                   onBlur="checktel()"> &nbsp;*
                                                                <div id="div2" style="display: inline"></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">所属科室：</td>
                                                            <td height="39"><select name="department">
                                                                <option value="消化内科">消化内科</option>
                                                                <option value="西医内科">西医内科</option>
                                                                <option value="呼吸内科">呼吸内科</option>
                                                                <option value="感染科">感染科</option>
                                                                <option value="神经科">神经科</option>
                                                                <option value="心脏内科">心脏内科</option>
                                                                <option value="内分泌科">内分泌科</option>
                                                                <option value="干部病房">干部病房</option>
                                                                <option value="肾内科">肾内科</option>
                                                                <option value="风湿免疫科">风湿免疫科</option>
                                                                <option value="肿瘤血液科">肿瘤血液科</option>
                                                                <option value="普外科">普外科</option>
                                                                <option value="骨科">骨科</option>
                                                                <option value="心胸外科">心胸外科</option>
                                                                <option value="耳鼻喉科">耳鼻喉科</option>
                                                                <option value="眼科">眼科</option>
                                                                <option value="肛肠斜科">肛肠斜科</option>
                                                                <option value="生殖妇科">生殖妇科</option>
                                                                <option value="儿科">儿科</option>
                                                            </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">电子邮箱：</td>
                                                            <td height="39"><input name="email" type="text"
                                                                                   id="email" onBlur="checkemail()">如:(username@sina.com)
                                                                <div id="div3" style="display: inline"></div>
                                                            </td>
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

<script type="text/javascript">
    function check() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/doctor/insert",//url
            data: $('#form1').serialize(),
            success: function (result) {
                if (result.success == 1 ) {
                    window.location.href = "/doctor/getListDoctor";
                } else if (result.success == 0) {
                    alert(result.comment);
                    return;
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    }

</script>
</html>