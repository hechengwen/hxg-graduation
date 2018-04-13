<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
    <script>
        function delete_id(id) {
            layer.confirm("你确定要删除该条记录么？", {btn: ['确定', '取消']},
                function () {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/doctor/delete",
                        data: {"sno": id},
                        success: function (result) {
                            if (result.success == 1) {
                                layer.msg("删除成功", {time: 2000}, function () {
                                    window.location.href = "/doctor/getListDoctor";
                                });
                            } else if (result.success == 0) {
                                layer.msg(result.comment);
                            }
                        },
                        error: function () {
                            layer.msg("异常！");
                        }
                    });
                }, function () {

                }
            );
        }
    </script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>

<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">当前位置：系统查询&gt; 医师信息查询 &gt;&gt;&gt;
                                    <table width="739" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td><img src="/Images/main_hospital.jpg" width="764" height="57"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <form action="/doctor/getListDoctor" name="form1" method="post">
                                        <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">
                                            <tr>
                                                <td align="center" bgcolor="#F9D16B">

                                                    &nbsp;<img src="/Images/search.gif" width="45" height="28"></td>
                                                <td bgcolor="#F9D16B">请输入医师编号或姓名：
                                                    <input name="data" type="text" id="y_id" size="20">
                                                    <input name="Submit" type="submit" class="btn_grey" value="查询">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <table width="98%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="10%" bgcolor="#F9D16B">编号</td>
                                            <td width="7%" bgcolor="#F9D16B">姓名</td>
                                            <td width="6%" bgcolor="#F9D16B">性别</td>
                                            <td width="10%" bgcolor="#F9D16B">出生日期</td>
                                            <td width="10%" bgcolor="#F9D16B">从业年份</td>
                                            <td width="10%" bgcolor="#F9D16B">职称</td>
                                            <td width="10%" bgcolor="#F9D16B">联系电话</td>
                                            <td width="10%" bgcolor="#F9D16B">所属科室</td>
                                            <td width="13%" bgcolor="#F9D16B">电邮</td>
                                            <td width="7%" bgcolor="#F9D16B">操作</td>
                                        </tr>

                                        <tr align="center" bgcolor="#e3F4F7">
                                            <c:forEach items="${doctors}" var="doctor">
                                        <tr align="center">
                                            <td>${doctor.sno}</td>
                                            <td>${doctor.name}</td>
                                            <td>${doctor.sex}</td>
                                            <td>${doctor.birth}</td>
                                            <td>${doctor.cynf}</td>
                                            <td>${doctor.positionalTitles}</td>
                                            <td>${doctor.tel}</td>
                                            <td>${doctor.department}</td>
                                            <td>${doctor.email}</td>
                                            <td><input type="button" name="btn" value="删除"
                                                       onclick="delete_id(${doctor.sno})">
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>

                </tr>

            </table>

            <%@ include file="copyright.jsp" %>
        </td>
    </tr>
</table>
</body>
</html>

