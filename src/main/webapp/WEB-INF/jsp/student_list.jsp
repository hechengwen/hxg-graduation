<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script>
        function delete_id(id) {
            var status = confirm("你确定要删除该条记录么？");
            if (!status) {
                return false;
            }
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/student/delete" ,
                data: {"sno":id},
                success: function (result) {
                    if (result.success == 1 ) {
                        alert("删除成功");
                        window.location.href="/student/getListStudent";
                    } else if (result.success == 0) {
                        alert(result.comment);
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
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
                                <td height="22" valign="top" class="word_orange">当前位置：学生管理&gt; 学生信息列表 &gt;&gt;&gt;
                                    <table width="739" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td><img src="/Images/main_hospital.jpg" width="764" height="57"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <form action="/student/getListStudent" name="form1" method="post">
                                        <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">
                                            <tr>
                                                <td align="center" bgcolor="#F9D16B">

                                                    &nbsp;<img src="/Images/search.gif" width="45" height="28"></td>
                                                <td bgcolor="#F9D16B">请输入学生学号或姓名：
                                                    <input name="data" type="text" id="y_id" size="20">
                                                    <input name="Submit" type="submit" class="btn_grey" value="查询">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <table width="98%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="10%" bgcolor="#F9D16B">学号</td>
                                            <td width="10%" bgcolor="#F9D16B">姓名</td>
                                            <td width="10%" bgcolor="#F9D16B">性别</td>
                                            <td width="15%" bgcolor="#F9D16B">出生日期</td>
                                            <td width="15%" bgcolor="#F9D16B">入学时间</td>
                                            <td width="10%" bgcolor="#F9D16B">学制</td>
                                            <td width="18%" bgcolor="#F9D16B">系部</td>
                                            <td width="10%" bgcolor="#F9D16B">班级</td>
                                            <td width="13%" bgcolor="#F9D16B">宿舍</td>
                                            <td width="18%" bgcolor="#F9D16B">联系电话</td>
                                            <td width="13%" bgcolor="#F9D16B">邮箱</td>
                                            <td width="13%" bgcolor="#F9D16B">操作</td>
                                        </tr>

                                        <tr align="center" bgcolor="#e3F4F7">
                                            <c:forEach items="${students}" var="student">
                                        <tr align="center">
                                            <td>${student.sno}</td>
                                            <td>${student.name}</td>
                                            <td>${student.sex}</td>
                                            <td>${student.birth}</td>
                                            <td>${student.rxsj}</td>
                                            <td>${student.xz}</td>
                                            <td>${student.xb}</td>
                                            <td>${student.bj}</td>
                                            <td>${student.room}</td>
                                            <td>${student.tel}</td>
                                            <td>${student.email}</td>
                                            <td><input type="button" name="btn" value="删除" onclick="delete_id(${student.sno})">
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

