<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<html>

<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script type="text/javascript">
        function $(id) {
            return document.getElementById(id);
        }

        function checky_name() {
            var div = document.getElementById("div1");
            div.innerHTML = "";
            var y_name = $("drugName").value;
            var ve = /^[a-zA-z]\w{2,}$/gi;
            /*if(ve.test(y_name)){
            div.innerHTML="<img src='Images/right.jpg' width='25' height='25'/>输入的药品名有效！";
            return true;
            }else*/
            if (y_name.length == 0) {
                div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入药品名!";
                document.getElementById("drugName").focus();
                return false;
            } else {
                div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
                return true;
            }
        }
    </script>
    <sx:head/>

    <% request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    %>
</head>
<body onLoad="clockon(bgclock)">
=
<%@include file="banner.jsp" %>
<%@include file="navigation.jsp" %>
<table width="778" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="527" valign="top" bgcolor="#FFFFFF">
            <table width="100%" height="444" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"
                   class="tableBorder_gray">
                <tr>
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：药品管理 &gt; 药品信息录入&gt;&gt;&gt;</td>
                </tr>
                <tr>
                    <td height="417" align="center" valign="top" style="padding:5px;">
                        <form name="form1" method="post" action="/medicine/insert">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="47" background="/Images/main_hospital.jpg">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="72" align="center" valign="top" background="Images/main_booksort_1.gif"
                                        bgcolor="#F8BF73">
                                        <table width="96%" border="0" cellpadding="1" cellspacing="0"
                                               bordercolor="#FFFFFF" bgcolor="#F8BF73">

                                            <tr>
                                                <td valign="top" bgcolor="#FCEC9A" style="padding:5px">
                                                    <table width="99%" border="1" cellpadding="0" cellspacing="0"
                                                           bordercolor="#FFFFFF" bordercolorlight="#FFFFFF"
                                                           bordercolordark="#F6B83B" bgcolor="#FFFFFF">


                                                        <tr>
                                                            <td align="center">药品名称：</td>
                                                            <td width="427" height="39"><input name="drugName"
                                                                                               type="text" id="drugName"
                                                                                               onBlur="checky_name()">
                                                                *
                                                                <div id="div1" style="display: inline"></div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">药品类型：</td>
                                                            <td height="39" width="10"><select name="drugType"
                                                                                               id="drugType">
                                                                <option value="中药">中药</option>
                                                                <option value="西药">西药</option>
                                                                <option value="中成药">中成药</option>
                                                                <option value="处方药">处方药</option>
                                                                <option value="非处方药">非处方药</option>
                                                                <option value="甲类OTC">甲类OTC</option>
                                                                <option value="乙类OTC">乙类OTC</option>
                                                            </select></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">生产日期：</td>
                                                            <td height="39" width="40"><input name="productionDate"
                                                                                              type="text"
                                                                                              id="productionDate"
                                                                                              size="20">(格式:yyyy-MM-dd)
                                                            </td>
                                                            <%--<td height="39"><sx:datetimepicker name="productionDate" id="productionDate" displayFormat="yyyy-MM-dd" />--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">生产企业：</td>
                                                            <td height="39" width="40"><input
                                                                    name="productionEnterprise" type="text"
                                                                    id="productionEnterprise" size="40"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">有效期限：</td>
                                                            <td height="39"><input name="effectiveDate" type="text"
                                                                                   id="effectiveDate">
                                                                (月)
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">进货价格：</td>
                                                            <td height="39"><input name="buyPrice" type="text"
                                                                                   id="buyPrice" size="20">
                                                                (元)
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">进货数量：</td>
                                                            <td height="39"><input name="number" type="text"
                                                                                   id="number">
                                                                (盒\瓶\袋)
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">销售价格：</td>
                                                            <td height="39"><input name="sellerPrice" type="text"
                                                                                   id="sellerPrice">(元)
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">进货单位：</td>
                                                            <td height="39"><input name="stockUnits" id="stockUnits"
                                                                                   type="text" size="40"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">经手人名：</td>
                                                            <td height="39"><input name="contactPerson" type="text"
                                                                                   id="contactPerson"></td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td><input name="Submit" type="submit" class="btn_grey"
                                                                       value="保存">
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
</html>