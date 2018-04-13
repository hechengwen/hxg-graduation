<%@ page contentType="text/html; charset=UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/js/onclock.JS"></script>
<script src="/js/menu.JS"></script>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/layer/layer.js"></script>
<div class=menuskin id=popmenu
     onmouseover="clearhidemenu();highlightmenu(event,'on')"
     onmouseout="highlightmenu(event,'off');dynamichide(event)" style="Z-index:100;position:absolute;"></div>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#0000FF">
    <tr bgcolor="#B0690B">
        <td width="3%" height="27">&nbsp;</td>
        <td width="20%">
            <div id="bgclock" class="word_white"></div>
        </td>
        <script language="javascript">
            function quit() {
                layer.confirm("确定要退出系统吗?", {btn: ['确定', '取消']},function () {
                    window.location.href = "/admin/logout";
                });
            }
        </script>
        <td width="79%" align="right" bgcolor="#B0690B" class="word_white"><a href="/admin/sysMain" class="word_white">医务室简介</a> | <a
                onmouseover=showmenu(event,xitongmenu) onmouseout=delayhidemenu() class="word_white"
                style="CURSOR:hand">意见反馈管理</a> |
            <a onmouseover=showmenu(event,menzhenmenu) onmouseout=delayhidemenu() class="word_white"
               style="CURSOR:hand">门诊管理</a> | <a onmouseover=showmenu(event,bingrenmenu) onmouseout=delayhidemenu()
                                                 style="CURSOR:hand" class="word_white">学生管理</a> | <a
                    onmouseover=showmenu(event,yaopinmenu) onmouseout=delayhidemenu() class="word_white"
                    style="CURSOR:hand">药品管理</a> | <a onmouseover=showmenu(event,yishimenu) onmouseout=delayhidemenu()
                                                      class="word_white" style="CURSOR:hand">医师管理</a> | <a
                    onmouseover=showmenu(event,querymenu) onmouseout=delayhidemenu() class="word_white"
                    style="CURSOR:hand">系统管理</a> | <a onmouseover=showmenu(event,gerenzhongxin) onmouseout=delayhidemenu()
                                                      class="word_white" style="CURSOR:hand">个人中心</a> | <a href="#" onClick="quit()" class="word_white">注销登录</a></td>
        <td width="2%" bgcolor="#B0690B">&nbsp;</td>
    </tr>
    <tr bgcolor="#B0690B">
        <td height="9" colspan="4" background="/Images/navigation_bg_bottom.gif"></td>
    </tr>
</table>
