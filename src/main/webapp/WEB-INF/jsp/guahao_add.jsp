<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <% request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    %>
    <script language="JavaScript">
        $(document).ready(function () {
            $("#registeredProject").change(function () {
                var val = $('#registeredProject option:selected').val();//获取当前选中的值
                $("#doctor option:not(:first)").remove();//清空doctor

                $.ajax({
                    url: "/doctor/getDocByDep?department=" + encodeURI(encodeURI(val)),//传值到后台出现中文乱码，需要这样处理
                    async: true,
                    type: 'GET',
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (data) {
                        $.each(data.data, function (k, p) {
                            $('#doctor').append('<option value="' + p.name + '">' + p.name + '</option>');
                        });
                    },
                    error: function () {
                        layer.msg("异常！");
                    }
                });
            });
        });
    </script>
    <script type="text/javascript">
        function check() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/register/insert",//url
                data: $('#form1').serialize(),
                success: function (result) {
                    if (result.success == 1) {
                        layer.msg("预约成功", {time: 1000}, function () {
                            window.location.href = "/";
                        });
                    } else if (result.success == 0) {
                        layer.msg(result.comment, {time: 2000});
                        return;
                    }
                },
                error: function () {
                    layer.msg("异常！");
                }
            });
        }

    </script>
</head>

<body onLoad="clockon(bgclock)">
<%@include file="banner2.jsp" %>
<%@include file="navigation2.jsp" %>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="527" valign="top" bgcolor="#FFFFFF">
            <table width="100%" height="444" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：预约挂号 &gt;</td>
                </tr>
                <tr>
                    <td height="417" align="center" valign="top" style="padding:5px;">

                        <form name="form1" id="form1" method="post" action="">
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
                                                            <td align="center">挂号科室：</td>
                                                            <td height="39">
                                                                <select name="registeredProject" id="registeredProject">
                                                                    <option value="">--请选择挂号科室--</option>
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
                                                            <td align="center">医师姓名：</td>
                                                            <td height="39">
                                                                <select name="doctor" id="doctor">
                                                                    <option value="">--请选择医师--</option>
                                                                    <%--<c:forEach items="${doctors}" var="doctor">
                                                                        <option value="${doctor.name}" >${doctor.name}</option>
                                                                    </c:forEach>--%>
                                                                </select>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">挂号费：</td>
                                                            <td height="39"><input name="cost" type="text"
                                                                                   readonly="readonly" id="cost"
                                                                                   value="5.00" size="8">
                                                                (元)<input name="m_yishiid" id="m_yishiid" type="hidden"
                                                                          value=""/></td>

                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td><input name="Submit" type="button" class="btn_grey"
                                                                       value="保存" onclick="check()">
                                                                &nbsp;
                                                                <input name="Submit2" type="button" class="btn_grey"
                                                                       value="返回" onClick="history.back()">

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