<%@ page contentType="text/html; charset=gb2312"%>

<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script src="/js/onclock.JS"></script>
<script src="/js/menu.JS"></script>
<div class=menuskin id=popmenu
      onmouseover="clearhidemenu();highlightmenu(event,'on')"
      onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
      <tr bgcolor="#DFA40C">
        <td width="3%" height="27">&nbsp;</td>
        <td width="29%"><div id="bgclock" class="word_white"></div></td>
		<script language="javascript">
			function quit(){
				if(confirm("���Ҫ�˳�ϵͳ��?")){
					window.location.href="/admin/logout";
				}
			}
		</script>
        <td width="80%" align="right" bgcolor="#B0690B" class="word_white"><a href="/admin/stuMain" class="word_white">��Ժ���</a> |
       <a href="/register/index" class="word_white" >ԤԼ�Һ�</a> | <a  href="/feedback/index" class="word_white">�������</a> | <a href="#" onClick="quit()" class="word_white">ϵͳ�˳�</a></td>
        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
  </tr>
      <tr bgcolor="#B0690B">
        <td height="9" colspan="4" background="Images/navigation_bg_bottom.gif"></td>
      </tr>
</table>
