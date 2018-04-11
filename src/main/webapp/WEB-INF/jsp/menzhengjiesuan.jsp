<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>

<html>

<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<script language="JavaScript" type="text/javascript">
    function search() {
        if (document.all.form1.mj_id.value == "") {
            alert('请输入门诊号！');
            return false;
        }
        else {
            document.all.form1.action = "menzhencx.action";
            document.all.form1.method = "post";
            document.all.form1.submit();
        }
    }

    function jiesuan() {
        if (document.all.form1.mj_id.value == "") {
            alert('请输入门诊号！');
            return false;
        }
        else {
            document.all.form1.action = "menzhenjiesuan.action";
            document.all.form1.method = "post";
            document.all.form1.submit();
        }
    }
</script>

<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td valign="top" bgcolor="#FFFFFF">
            <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="510" valign="top" style="padding:5px;">
                        <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="22" valign="top" class="word_orange">当前位置：门诊管理 &gt; 门诊结算 &gt;&gt;&gt;
                                    <table width="739" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td><img src="/Images/main_hospital.jpg" width="764" height="57"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <form action="" name="form1">
                                        <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">
                                            <tr>
                                                <td align="center" bgcolor="#F9D16B">

                                                    &nbsp;<img src="/Images/search.gif" width="45" height="28"></td>
                                                <td bgcolor="#F9D16B">请输入门诊号：
                                                    <input name="mj_id" type="text" id="mj_id" size="20">
                                                    <input name="jine" type="hidden" id="jine" value="asd ">
                                                    <input name="Submit" type="submit" class="btn_grey" value="查询"
                                                           onclick="search()">
                                                </td>
                                                <td bgcolor="#F9D16B" align="left">结算类型：
                                                    <select name="type" id="type">
                                                        <option value="现金支付">现金支付</option>
                                                        <option value="医保支付">医保支付</option>
                                                    </select>
                                                    <input name="Submit" type="submit" class="btn_grey" value="结算"
                                                           onclick="jiesuan()">
                                                </td>
                                            </tr>
                                        </table>


                                        <table width="98%" border="1" cellpadding="0" cellspacing="0"
                                               bordercolor="#FFFFFF" bordercolordark="#F6B83B"
                                               bordercolorlight="#FFFFFF">
                                            <tr align="center" bgcolor="#e3F4F7">
                                                <td width="10%" bgcolor="#F9D16B">门诊号</td>
                                                <td width="6%" bgcolor="#F9D16B">姓名</td>
                                                <td width="12%" bgcolor="#F9D16B">医保卡号</td>
                                                <td width="13%" bgcolor="#F9D16B">药品名</td>
                                                <td width="10%" bgcolor="#F9D16B">检查费</td>
                                                <td width="10%" bgcolor="#F9D16B">诊疗费</td>
                                                <td width="12%" bgcolor="#F9D16B">药费</td>

                                                <td width="15%" bgcolor="#F9D16B">是否结算</td>
                                                <td width="13%" bgcolor="#F9D16B">应付金额</td>
                                            </tr>

                                            <tr>

                                                <td>
                                                </td>
                                            </tr>

                                        </table>

                                        <table width="98%" height="38" border="0" cellpadding="0" cellspacing="0"
                                               bgcolor="#E3F4F7" class="tableBorder_gray">


                                        </table>
                                    </form>
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
