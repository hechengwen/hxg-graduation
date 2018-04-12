<%@ page contentType="text/html; charset=UTF-8" %>
<% String error=(String)session.getAttribute("error"); %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%=error %>
<input type="button" value="返回" onClick="window.location.href='index.jsp'">
</body>
</html>
