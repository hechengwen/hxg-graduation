<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="hospitalDAO.GuanliyuanDAO" %>
<%
  float guahao=new GuanliyuanDAO().getguahaofee();
  float dahuo=new GuanliyuanDAO().getdahuofee();
  float chuli=new GuanliyuanDAO().getchuulifee();
  float zhenliaofee=new GuanliyuanDAO().getzhenliaofee();
 %>
<html>

<head>
<title>ҽԺҽ�����ϵͳ</title>
<link href="CSS/style.css" rel="stylesheet">
		
</head>
<body onLoad="clockon(bgclock)">
<%@include file="banner.jsp"%>
<%@include file="navigation.jsp"%>
<table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="527" valign="top" bgcolor="#FFFFFF"><table width="100%" height="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="27" valign="top" style="padding:5px;" class="word_orange">��ǰλ�ã���������&gt; ��������&gt;&gt;&gt;</td>
  </tr>
  <tr>
    <td height="417" align="center" valign="top" style="padding:5px;">
    <form name="form1" method="post" action="parametermodify.action">
     <table width="100%"  border="0" cellspacing="0" cellpadding="0">
	 <tr>
        <td height="47" background="Images/main_hospital.jpg">&nbsp;</td>
      </tr>
      <tr>
       <table width="96%" border="0" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F8BF73">
               
          <tr>
            <td valign="top" bgcolor="#FCEC9A" style="padding:5px"><table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#F6B83B" bgcolor="#FFFFFF">
                  
              
		 <tr>
          <td align="center">�Һŷ����ã�</td>
          <td height="39"><input name="guahaofee" type="text" id="guahaofee" value="<%=guahao%>"> Ԫ           </td>
        </tr>
		
        <tr>
          <td align="center">�������ã�</td>
           <td width="427" height="39"><input name="dahuofee" type="text" id="dahuofee" value="<%=dahuo %>" size="20">Ԫ/��
             <input name="name" type="hidden" id="name" value="zhou"/>
            </td>
        </tr>
        <tr>
          <td align="center">���Ʒ����ã�</td>
           <td width="427" height="39"><input name="zhenliaofee" type="text" id="zhenliaofee" value="<%=zhenliaofee %>" size="20">Ԫ
             
            </td>
        </tr>
        <tr>
          <td align="center">ҽ����е����ѣ�</td>
          <td height="39"><input name="chulifee" type="text" id="chulifee" value="<%=chuli %>" >  Ԫ          </td>
        </tr>
			
        <tr>
          <td align="center">&nbsp;</td>
          <td><input name="Submit" type="submit" class="btn_grey" value="����" >
            &nbsp;
            <input name="Submit2" type="button" class="btn_grey" value="����" onClick="history.back()">
			 &nbsp;
			 			 </td>
        </tr> 
                 </table>			</td>
          </tr>
		 
        </table></td>
		 
      </tr>
      
    </table>
    </form></td>
  </tr>
</table>
    <%@ include file="copyright.jsp"%></td>
  </tr>
</table>
</body>
</html>