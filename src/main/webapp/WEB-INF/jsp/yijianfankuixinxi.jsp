<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script>
        function delete_id(id) {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "" ,//url
                data: {"drugNum":id},
                success: function (result) {
                    if (result.success == 1 ) {
                        alert("删除成功");
                        window.location.href="/medicine/select";
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
                                <td height="22" valign="top" class="word_orange">当前位置：意见反馈管理 &gt; 意见反馈列表 &gt;&gt;
                                    <table width="739" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td><img src="/Images/main_hospital.jpg" width="764" height="57"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <form action="/feedback/getList" name="form1" method="post">
                                        <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">
                                            <tr>
                                                <td align="center" bgcolor="#F9D16B">

                                                    &nbsp;<img src="/Images/search.gif" width="45" height="28"></td>
                                                <td bgcolor="#F9D16B">请输入编号：
                                                    <input name="id" type="text" id="y_id" size="20">
                                                    <input name="Submit" type="submit" class="btn_grey" value="查询">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <table width="98%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                                           bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                        <tr align="center" bgcolor="#e3F4F7">
                                            <td width="5%">编号</td>
                                            <td width="17%">反馈人</td>
                                            <td width="52%">反馈内容</td>
                                            <td width="21%">反馈时间</td>
                                            <%--<td width="5%">操作</td>--%>
                                        </tr>

                                        <tr align="center" bgcolor="#e3F4F7">
                                            <c:forEach items="${feedbacks}" var="feedback">
                                        <tr align="center">
                                            <td>${feedback.id}</td>
                                            <td>${feedback.stuName}</td>
                                            <td>${feedback.desc}</td>
                                            <td>${feedback.feedTimeStr}</td>
                                            <%--<td><input type="button" name="btn" value="删除" onclick="delete_id(${medicine.drugNum})">--%>
                                                <%--</td>--%>
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

