<%@ page contentType="text/html; charset=UTF-8" %>
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
<!-- 查看医生的个人信息展示页面 -->
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="527" valign="top" bgcolor="#FFFFFF">
            <table width="100%" height="444" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：个人中心 &gt; 查看个人信息&gt;&gt;&gt;</td>
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
                                                            <td align="center" >姓名：</td>
                                                            <td width="15" height="20">
                                                                ${doctor.name}
                                                                <div id="div1" style="display: inline"></div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">性别：</td>
                                                            <td height="39" width="10">
                                                                ${doctor.sex}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">出生日期：</td>
                                                            <td height="39" width="10">
                                                                ${doctor.birth}
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td align="center">从业年份：</td>

                                                            <td height="39" width="10">
                                                                ${doctor.cynf}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">职称：</td>
                                                            <td height="39" width="10">
                                                                ${doctor.positionalTitles}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">联系电话：</td>
                                                            <td height="39" width="10">
                                                                ${doctor.tel}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">所属科室：</td>
                                                            <td height="39" width="10">
                                                                ${doctor.department}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">电子邮箱：</td>
                                                            <td height="39" width="10">
                                                                ${doctor.email}
                                                            </td>

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