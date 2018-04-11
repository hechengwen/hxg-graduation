var menuOffX=0	//菜单距连接文字最左端距离
var menuOffY=18	//菜单距连接文字顶端距离
var fo_shadows=new Array()
var linkset=new Array()
var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1
var ns6=document.getElementById&&!document.all
var ns4=document.layers
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no' );
}
function showmenu(e,vmenu,mod){
	if (!document.all&&!document.getElementById&&!document.layers)
		return
	which=vmenu
	clearhidemenu()
	ie_clearshadow()
	menuobj=ie4? document.all.popmenu : ns6? document.getElementById("popmenu") : ns4? document.popmenu : ""
	menuobj.thestyle=(ie4||ns6)? menuobj.style : menuobj
	
	if (ie4||ns6)
		menuobj.innerHTML=which
	else{
		menuobj.document.write('<layer name=gui bgColor=#E6E6E6 width=165 onmouseover="clearhidemenu()" onmouseout="hidemenu()">'+which+'</layer>')
		menuobj.document.close()
	}
	menuobj.contentwidth=(ie4||ns6)? menuobj.offsetWidth : menuobj.document.gui.document.width
	menuobj.contentheight=(ie4||ns6)? menuobj.offsetHeight : menuobj.document.gui.document.height
	
	eventX=ie4? event.clientX : ns6? e.clientX : e.x
	eventY=ie4? event.clientY : ns6? e.clientY : e.y
	
	var rightedge=ie4? document.body.clientWidth-eventX : window.innerWidth-eventX
	var bottomedge=ie4? document.body.clientHeight-eventY : window.innerHeight-eventY
		if (rightedge<menuobj.contentwidth)
			menuobj.thestyle.left=ie4? document.body.scrollLeft+eventX-menuobj.contentwidth+menuOffX : ns6? window.pageXOffset+eventX-menuobj.contentwidth : eventX-menuobj.contentwidth
		else
			menuobj.thestyle.left=ie4? ie_x(event.srcElement)+menuOffX : ns6? window.pageXOffset+eventX : eventX
		
		if (bottomedge<menuobj.contentheight&&mod!=0)
			menuobj.thestyle.top=ie4? document.body.scrollTop+eventY-menuobj.contentheight-event.offsetY+menuOffY-23 : ns6? window.pageYOffset+eventY-menuobj.contentheight-10 : eventY-menuobj.contentheight
		else
			menuobj.thestyle.top=ie4? ie_y(event.srcElement)+menuOffY : ns6? window.pageYOffset+eventY+10 : eventY
	menuobj.thestyle.visibility="visible"
	ie_dropshadow(menuobj,"#999999",3)
	return false
}

function ie_y(e){  
	var t=e.offsetTop;  
	while(e=e.offsetParent){  
		t+=e.offsetTop;  
	}  
	return t;  
}  
function ie_x(e){  
	var l=e.offsetLeft;  
	while(e=e.offsetParent){  
		l+=e.offsetLeft;  
	}  
	return l;  
}  
function ie_dropshadow(el, color, size)
{
	var i;
	for (i=size; i>0; i--)
	{
		var rect = document.createElement('div');
		var rs = rect.style
		rs.position = 'absolute';
		rs.left = (el.style.posLeft + i) + 'px';
		rs.top = (el.style.posTop + i) + 'px';
		rs.width = el.offsetWidth + 'px';
		rs.height = el.offsetHeight + 'px';
		rs.zIndex = el.style.zIndex - i;
		rs.backgroundColor = color;
		var opacity = 1 - i / (i + 1);
		rs.filter = 'alpha(opacity=' + (100 * opacity) + ')';
		fo_shadows[fo_shadows.length] = rect;
	}
}
function ie_clearshadow()
{
	for(var i=0;i<fo_shadows.length;i++)
	{
		if (fo_shadows[i])
			fo_shadows[i].style.display="none"
	}
	fo_shadows=new Array();
}


function contains_ns6(a, b) {
	while (b.parentNode)
		if ((b = b.parentNode) == a)
			return true;
	return false;
}

function hidemenu(){
	if (window.menuobj)
		menuobj.thestyle.visibility=(ie4||ns6)? "hidden" : "hide"
	ie_clearshadow()
}

function dynamichide(e){
	if (ie4&&!menuobj.contains(e.toElement))
		hidemenu()
	else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
		hidemenu()
}

function delayhidemenu(){
	if (ie4||ns6||ns4)
		delayhide=setTimeout("hidemenu()",500)
}

function clearhidemenu(){
	if (window.delayhide)
		clearTimeout(delayhide)
}

function highlightmenu(e,state){
	if (document.all)
		source_el=event.srcElement
	else if (document.getElementById)
		source_el=e.target
	if (source_el.className=="menuitems"){
		source_el.id=(state=="on")? "mouseoverstyle" : ""
	}
	else{
		while(source_el.id!="popmenu"){
			source_el=document.getElementById? source_el.parentNode : source_el.parentElement
			if (source_el.className=="menuitems"){
				source_el.id=(state=="on")? "mouseoverstyle" : ""
			}
		}
	}
}

if (ie4||ns6)
document.onclick=hidemenu
function doSClick() {
	var targetId, srcElement, targetElement, imageId, imageElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "content";
	targetElement = document.all(targetId);
	imageId = srcElement.id;
	imageId = imageId.charAt(0);
	imageElement = document.all(imageId);
	if (targetElement.style.display == "none") {

		targetElement.style.display = "";
	} else {
		targetElement.style.display = "none";
	}
}
function doClick() {
	var targetId, srcElement, targetElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "_content";
	targetElement = document.all(targetId);
	if (targetElement.style.display == "none") {
		targetElement.style.display = "";
	} else {
		targetElement.style.display = "none";
	}
}
function overbg(tdbg){
tdbg.style.background='url(../Images/item_over.gif)'
tdbg.style.border=' #B0690B 1px solid'
}
function outbg(tdbg){
tdbg.style.background='url(../Images/item_out.gif)'
tdbg.style.border=''
}
var xitongmenu='<table width=80><tr><td id=xitongfee onMouseOver=overbg(xitongfee) onMouseOut=outbg(xitongfee)><a href="/feedback/getList">意见反馈列表</a></td><tr><!--\
	<tr><td id=readerType onMouseOver=overbg(readerType) onMouseOut=outbg(readerType)><a href=addyiliaobuzhu.jsp>医保信息录入</a></td></tr>\
<tr><td id=readerType onMouseOver=overbg(readerType) onMouseOut=outbg(readerType)><a href=yiliaobuzhu.jsp>医疗补助管理</a></td></tr>-->\
</table>'
var menzhenmenu='<table width=80><!--<tr><td id=menzhen onMouseOver=overbg(menzhen) onMouseOut=outbg(menzhen)><a href=guahao_add.jsp>门诊挂号</a></td></tr>-->\
<tr><td id=menzhenjiuzhen onMouseOver=overbg(menzhenjiuzhen) onMouseOut=outbg(menzhenjiuzhen)><a href="/register/getRegisterList">门诊就诊</a></td><tr>\
<tr><td id=menzhenshoufei onMouseOver=overbg(menzhenshoufei) onMouseOut=outbg(menzhenshoufei)><a href="/register/getRegisterSettle">门诊结算</a></td></tr>\
</table>'
var bingrenmenu='<table width=80><tr><td id=bingrendangan onMouseOver=overbg(bingrendangan) onMouseOut=outbg(bingrendangan)><a href="/student/getListStudent">学生信息列表</a></td></tr>\
<tr><td id=chuyuan onMouseOver=overbg(chuyuan) onMouseOut=outbg(chuyuan)><a href="/student/index">学生信息录入</a></td></tr>\
</table>'
var yaopinmenu='<table width=80><tr><td id=yaopinluru onMouseOver=overbg(yaopinluru) onMouseOut=outbg(yaopinluru)><a href="/medicine/index">药品信息录入</a></td></tr>\
<tr><td id=yaopin onMouseOver=overbg(yaopin) onMouseOut=outbg(yaopin)><a href="/medicine/select">药品信息管理</a></td></tr>\
</table>'
var yishimenu='<table width=80><tr><td id=yisi onMouseOver=overbg(yishi) onMouseOut=outbg(yishi)><a href="/doctor/getListDoctor">医师信息列表</a></td></tr>\
<tr><td id=addyishi onMouseOver=overbg(addyishi) onMouseOut=outbg(addyishi)><a href="/doctor/index">医师信息录入</a></td></tr>\
</table>'
var querymenu='<table width=80><tr><td id=bingliQuery onMouseOver=overbg(bingliQuery) onMouseOut=outbg(bingliQuery)><a href=yishichaxun.jsp>医师查询</a></td></tr>\
<tr><td id=bingrenxinxiQuery onMouseOver=overbg(bingrenxinxiQuery) onMouseOut=outbg(bingrenxinxiQuery)><a href=bingrenxinxi.jsp>门诊查询</a></td></tr>\
<tr><td id=bingrenxinxiQuery onMouseOver=overbg(bingrenxinxiQuery) onMouseOut=outbg(bingrenxinxiQuery)><a href=zhuyuanxinxi.jsp>住院查询</a></td></tr>\
<tr><td id=yaopinxinxiQuery onMouseOver=overbg(yaopinxinxiQuery) onMouseOut=outbg(yaopinxinxiQuery)><a href=yaopinxinxi.jsp>药品查询</a></td></tr>\
<tr><td id=yaopinqixianQuery onMouseOver=overbg(yaopinqixianQuery) onMouseOut=outbg(yaopinqixianQuery)><a href=yaopinqixian.jsp>药品过期查询</a></td></tr>\
</table>'
var gerenzhongxin='<table width=80><tr><td id=yisi onMouseOver=overbg(yishi) onMouseOut=outbg(yishi)><a href=gerenzhongxin.jsp>查看个人信息</a></td></tr>\
<tr><td id=addyishi onMouseOver=overbg(addyishi) onMouseOut=outbg(addyishi)><a href=yishi_xiugai.jsp>修改个人信息</a></td></tr>\
</table>'