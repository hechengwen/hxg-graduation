<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/layer/layer.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
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

                        <form action="/medicalRecords/getList" name="form1" method="post">
                            <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                   bgcolor="#E3F4F7" class="tableBorder_gray">
                                <tr>
                                    <td align="center" bgcolor="#F9D16B">

                                        &nbsp;<img src="/Images/search.gif" width="45" height="28"></td>
                                    <td bgcolor="#F9D16B">请输入序号：
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
                                                        <td width="8%" height="25">序号</td>
                                                        <td width="8%">患者姓名</td>
                                                        <td width="8%">就诊医生</td>
                                                        <td width="10%">就诊日期</td>
                                                        <td width="20%">病情描述</td>
                                                    </tr>

                                                    <tr align="center" bgcolor="#e3F4F7">
                                                        <c:forEach items="${list}" var="registerData">
                                                    <tr align="center">
                                                        <td>${registerData.id}</td>
                                                        <td>${registerData.stuName}</td>
                                                        <td>${registerData.dcoName}</td>
                                                        <td>${registerData.jzrqStr}</td>
                                                        <td>${registerData.description}</td>
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
