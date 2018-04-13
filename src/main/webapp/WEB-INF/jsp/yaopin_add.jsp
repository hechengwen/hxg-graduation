<%@ page contentType="text/html; charset=UTF-8" %>
<html>

<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
    <script type="text/javascript">

        function checky_name() {
            var div = document.getElementById("div1");
            var div2 = document.getElementById("div2");
            var div3 = document.getElementById("div3");
            var div4 = document.getElementById("div4");
            var div5 = document.getElementById("div5");
            var div6 = document.getElementById("div6");
            var div7 = document.getElementById("div7");
            var div8 = document.getElementById("div8");
            var div9 = document.getElementById("div9");
            div.innerHTML = "";
            div2.innerHTML = "";
            div3.innerHTML = "";
            div4.innerHTML = "";
            div5.innerHTML = "";
            div6.innerHTML = "";
            div7.innerHTML = "";
            div8.innerHTML = "";
            div9.innerHTML = "";
            var y_name = $("#drugName").val();
            var productionDate = $("#productionDate").val();
            var productionEnterprise = $("#productionEnterprise").val();
            var effectiveDate = $("#effectiveDate").val();
            var buyPrice = $("#buyPrice").val();
            var number = $("#number").val();
            var sellerPrice = $("#sellerPrice").val();
            var stockUnits = $("#stockUnits").val();
            var contactPerson = $("#contactPerson").val();
            if (y_name.length == 0) {
                div.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入药品名!";
                document.getElementById("drugName").focus();
                return false;
            } else {
                div.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (productionDate.length == 0) {
                div2.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入生产日期!";
                document.getElementById("productionDate").focus();
                return false;
            } else {
                div2.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (productionEnterprise.length == 0) {
                div3.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入生产企业!";
                document.getElementById("productionEnterprise").focus();
                return false;
            } else {
                div3.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (effectiveDate.length == 0) {
                div4.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入有效期限!";
                document.getElementById("effectiveDate").focus();
                return false;
            } else {
                div4.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (buyPrice.length == 0) {
                div5.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入进货价格!";
                document.getElementById("buyPrice").focus();
                return false;
            } else {
                div5.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (number.length == 0) {
                div6.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入进货数量!";
                document.getElementById("number").focus();
                return false;
            } else {
                div6.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (sellerPrice.length == 0) {
                div7.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入销售价格!";
                document.getElementById("sellerPrice").focus();
                return false;
            } else {
                div7.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (stockUnits.length == 0) {
                div8.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入药品名!";
                document.getElementById("stockUnits").focus();
                return false;
            } else {
                div8.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
            if (contactPerson.length == 0) {
                div9.innerHTML = "<img src='/Images/wrong.png' width='30' height='25'/>请输入经手人名!";
                document.getElementById("contactPerson").focus();
                return false;
            } else {
                div9.innerHTML = "<img src='/Images/right.jpg' width='30' height='25'/>";
            }
        }

        function check() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/medicine/insert",//url
                data: $('#form1').serialize(),
                success: function (result) {
                    if (result.success == 1) {
                        layer.msg("添加成功", {time: 1000}, function () {
                            window.location.href = "/medicine/select";
                        });
                    } else if (result.success == 0) {
                        layer.msg(result.comment, {time: 1000});
                        return;
                    }
                },
                error: function () {
                    layer.msg("异常！");
                }
            });
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
                        <form id="form1" name="form1" method="post" action="">
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
                                                                                              size="20"
                                                                                              onBlur="checky_name()">(格式:yyyy-MM-dd)
                                                                *
                                                                <div id="div2" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">生产企业：</td>
                                                            <td height="39" width="40"><input
                                                                    name="productionEnterprise" type="text"
                                                                    id="productionEnterprise" size="40"
                                                                    onBlur="checky_name()">*
                                                                <div id="div3" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">有效期限：</td>
                                                            <td height="39"><input name="effectiveDate" type="text"
                                                                                   id="effectiveDate"
                                                                                   onBlur="checky_name()">
                                                                (月)
                                                                *
                                                                <div id="div4" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">进货价格：</td>
                                                            <td height="39"><input name="buyPrice" type="text"
                                                                                   id="buyPrice" size="20"
                                                                                   onBlur="checky_name()">
                                                                (元)
                                                                *
                                                                <div id="div5" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">进货数量：</td>
                                                            <td height="39"><input name="number" type="text"
                                                                                   id="number" onBlur="checky_name()">
                                                                (盒\瓶\袋)
                                                                *
                                                                <div id="div6" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">销售价格：</td>
                                                            <td height="39"><input name="sellerPrice" type="text"
                                                                                   id="sellerPrice"
                                                                                   onBlur="checky_name()">(元)
                                                                *
                                                                <div id="div7" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">进货单位：</td>
                                                            <td height="39"><input name="stockUnits" id="stockUnits"
                                                                                   type="text" size="40"
                                                                                   onBlur="checky_name()">*
                                                                <div id="div8" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">经手人名：</td>
                                                            <td height="39"><input name="contactPerson" type="text"
                                                                                   id="contactPerson"
                                                                                   onBlur="checky_name()">*
                                                                <div id="div9" style="display: inline"></div>
                                                            </td>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td><input name="Submit" type="button" class="btn_grey"
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
</html>