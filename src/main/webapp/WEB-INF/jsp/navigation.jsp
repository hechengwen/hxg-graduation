<%@ page contentType="text/html; charset=gb2312" %>

<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script src="JS/onclock.JS"></script>
<script src="JS/menu.JS"></script>
<div class=menuskin id=popmenu
     onmouseover="clearhidemenu();highlightmenu(event,'on')"
     onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
    <tr bgcolor="#DFA40C">
        <td width="3%" height="27">&nbsp;</td>
        <td width="29%">
            <div id="bgclock" class="word_white"></div>
        </td>
        <script language="javascript">
            function quit() {
                if (confirm("���Ҫ�˳�ϵͳ��?")) {
                    window.location.href = "/admin/logout";
                }
            }
        </script>
        <td width="66%" align="right" bgcolor="#B0690B" class="word_white"><a href="##" class="word_white">ҽ���Ҽ��</a> | <a
                onmouseover=showmenu(event,xitongmenu) onmouseout=delayhidemenu() class="word_white"
                style="CURSOR:hand">ԤԼ�Һ�</a> |
            <a onmouseover=showmenu(event,menzhenmenu) onmouseout=delayhidemenu() class="word_white"
               style="CURSOR:hand">�������</a> | <a onmouseover=showmenu(event,bingrenmenu) onmouseout=delayhidemenu()
                                                 style="CURSOR:hand" class="word_white">סԺ����</a> | <a
                    onmouseover=showmenu(event,yaopinmenu) onmouseout=delayhidemenu() class="word_white"
                    style="CURSOR:hand">ҩƷ����</a> | <a onmouseover=showmenu(event,yishimenu) onmouseout=delayhidemenu()
                                                      class="word_white" style="CURSOR:hand">ҽʦ����</a> | <a
                    onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu() class="word_white"
                    style="CURSOR:hand">ϵͳ��ѯ</a> | <a href="#" onClick="quit()" class="word_white">ע����¼</a></td>
        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
    </tr>
    <tr bgcolor="#B0690B">
        <td height="9" colspan="4" background="/Images/navigation_bg_bottom.gif"></td>
    </tr>
</table>
