<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/layer/layer.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%  request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    %>
    <script type="text/javascript">
        function check() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/feedback/insert",
                data: $('#form1').serialize(),
                success: function (result) {
                    if (result.success == 1) {
                        layer.alert("意见反馈成功", {icon: 1},function () {
                            window.location.href = "/";
                        });

                    } else if (result.success == 0) {
                        layer.alert(result.comment,{icon: 2});
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
                    <td height="27" valign="top" style="padding:5px;" class="word_orange">当前位置：意见反馈 &gt; </td>
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
                                                            <td align="center">意见反馈：</td>
                                                            <td height="100">
                                                            <textarea id="desc" name="desc" style="margin: 0px; width: 507px; height: 213px;" maxlength="200" validate="required" msg="required:请填写操作流程;"></textarea>
                                                                <br>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                        <tr>
                                                            <td align="center">&nbsp;</td>
                                                            <td><input name="Submit" type="button" class="btn_grey"
                                                                       value="保存" onclick="check()">
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
