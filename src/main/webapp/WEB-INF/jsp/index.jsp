<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
<head>
<title>��ӭʹ��ҽԺҽ�����ϵͳ</title>
<link href="CSS/style.css" rel="stylesheet">
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="142" valign="top">&nbsp;</td>
  </tr>
</table>
	</td>
  </tr>
	<td>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td valign="top"><table width="100%" height="525"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="523" align="center" valign="top"><table width="100%" height="271"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="271" align="right" valign="top">
        <table width="100%" height="255"  border="0" cellpadding="0" cellspacing="0" background="/Images/commhospital.jpg"  class="tableBorder">
          <tr>
            <td height="57">&nbsp;</td>
            </tr>
          <tr>
            <td height="179" valign="top"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                  <td width="97%" align="center" valign="top">
                    <form name="form1" method="post" action="##" id="form1">
                      <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
                          <td height="57"><span class="STYLE1"></span></td>
                            <td width="9%">�û����ͣ�</td>
						 <td width="15%"> <select name="userType" id="type" >
						 <option value="0" id="guanliyuan" >����Ա </option>
						  <option value="1" id="yishi">ѧ��
						  </option>
						  </select>
						  </td>

                          <td height="57" colspan="2" align="center">&nbsp;</td>

                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="75%" height="37">&nbsp;</td>
                      <td >��&nbsp;��&nbsp;����</td>
                      <td >
                        <input name="username" type="text" class="logininput" id="username" size="20">                        </td>

                    </tr>
                        <tr>
                          <td height="37">&nbsp;</td>
                      <td>��&nbsp;&nbsp;�룺</td>
                      <td><input name="password" type="password" class="logininput" id="password" size="20"></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
                          <td colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="ȷ��" onClick="check()"/>
                            &nbsp;
                            <input name="Submit3" type="reset" class="btn_grey" value="����">&nbsp;
                            <input name="Submit2" type="button" class="btn_grey" value="�ر�" onClick="window.close();"></td><td>&nbsp;</td>
                    </tr>
                        </table>
			  </form>				   </td>
                  <td width="1%">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          <tr>
            <td height="19">&nbsp;</td>
            </tr>
        </table></td>
      </tr>

    </table>
      <table width="100%" height="27"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" class="word_login"></td>

        </tr>
        <tr>
        <td align="center"><h5>��Ȩ���У���¼�ؾ�</h5></td>
        </tr>
      </table></td>
  </tr>
</table></td>
  </tr>
</table>
</td>
</table>
</body>

<script language="javascript">
    function check(){
        var sUserName = $("#username").val();
        var sPassword = $("#password").val();
        if (sUserName ==""){
            alert("�������û���!");
            form1.name.focus();
            return false ;
        }

        if (sPassword ==""){
            alert("����������!");
            form1.password.focus();
            return false ;
        }

        $.ajax({
            //����������Ҫע��һ��
            type: "POST",//��������
            dataType: "json",//Ԥ�ڷ��������ص���������
            url: "/admin/login" ,//url
            data: $('#form1').serialize(),
            success: function (result) {
                // ����Ա
                if (result.success == 1 && result.data == 0) {
                    window.location="/admin/sysMain";
                    // ѧ��
                } else if (result.success == 1 && result.data == 1) {
                    window.location="/admin/stuMain";
                }else if (result.success == 0) {
                    alert(result.comment);
                }
            },
            error : function() {
                alert("�쳣��");
            }
        });
    }

</script>
</html>
