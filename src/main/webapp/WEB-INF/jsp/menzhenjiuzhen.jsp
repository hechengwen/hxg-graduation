<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation3.jsp" %>

<table width="778" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
       class="tableBorder_gray">
    <tr>
        <td align="center" valign="top" style="padding:5px;">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="20" align="left" valign="middle" class="word_orange">当前位置：门诊管理 &gt;&gt;门诊就诊&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" valign="top">

                        <form action="/register/getRegisterList" name="form1" method="post">
                            <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                   bgcolor="#E3F4F7" class="tableBorder_gray">
                                <tr>
                                    <td align="center" bgcolor="#F9D16B">

                                        &nbsp;<img src="/Images/search.gif" width="45" height="28"></td>
                                    <td bgcolor="#F9D16B">请输入门诊号：
                                        <input name="serialNumber" type="text" id="serialNumber" size="20">
                                        <input name="Submit" type="submit" class="btn_grey" value="查询">
                                    </td>
                                </tr>
                            </table>
                        </form>

                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="57" background="/Images/main_hospital.jpg">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="72" valign="top">
                                    <table width="100%" height="63" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="2%" rowspan="2">&nbsp;</td>
                                            <td width="96%" align="center" valign="top">
                                                <table width="93%" border="1" cellpadding="0" cellspacing="0"
                                                       bordercolor="#FFFFFF" bordercolordark="#B7B6B6"
                                                       bordercolorlight="#FFFFFF">
                                                    <tr align="center">
                                                        <td width="8%" height="25">门诊号</td>
                                                        <td width="8%">姓名</td>
                                                        <td width="8%">性别</td>
                                                        <td width="10%">挂号科室</td>
                                                        <td width="20%">挂号时间</td>
                                                        <td width="8%">挂号费</td>
                                                        <td width="10%">预约医生</td>
                                                        <td width="14%">门诊状态</td>
                                                    </tr>

                                                    <tr align="center" bgcolor="#e3F4F7">
                                                        <c:forEach items="${registerDatas}" var="registerData">
                                                    <tr align="center">
                                                        <td>${registerData.serialNumber}</td>
                                                        <td>${registerData.name}</td>
                                                        <td>${registerData.sex}</td>
                                                        <td>${registerData.registeredProject}</td>
                                                        <td>${registerData.registerTimeStr}</td>
                                                        <td>${registerData.cost}</td>
                                                        <td>${registerData.doctor}</td>

                                                        <c:if test="${registerData.status == '0'}" >
                                                            <td><input type="button" value="开药" onclick=""></td>
                                                        </c:if>
                                                        <c:if test="${registerData.status == '1'}" >
                                                            <td>就诊完成</td>
                                                        </c:if>

                                                            <%--<td><input type="button" name="btn" value="删除" onclick="delete_id(${medicine.drugNum})">--%>
                                                            <%--</td>--%>
                                                    </tr>
                                                    </c:forEach>
                                                    </tr>


                                                    </td>
                                                    <td width="2%" rowspan="2">&nbsp;</td>
                                                    </tr>

                                                    </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>

                        <%@ include file="copyright.jsp" %>
</body>
</html>
