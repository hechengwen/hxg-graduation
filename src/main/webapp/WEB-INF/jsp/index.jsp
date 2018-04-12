<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title>医院医务管理系统</title>
    <link href="/CSS/style.css" rel="stylesheet">
    <link href="/CSS/login.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h2 style="color:#674545">医务管理系统</h2>
            <form class="form" id="form">
                <input type="text" placeholder="用户名" name="username" id="username">
                <input type="password" placeholder="密码" name="password" id="password">

                <div style="margin:11px 0; font:normal 16px/24px 'MicroSoft YaHei';color:#674545">用户类型：
                <select name="userType" id="type">
                    <option value="0" id="guanliyuan" style="text-align:center;color:#674545">管理员</option>
                    <option value="1" id="yishi" style="text-align:center;color:#674545">学生</option>
                </select>
                </div>
                <button type="submit" id="login-button" onclick="check()">Login</button>
            </form>
        </div>
    </div>
</div>

</body>

<script language="javascript">
    function check() {
        var sUserName = $("#username").val();
        var sPassword = $("#password").val();
        if (sUserName == "") {
            alert("请输入用户名!");
            return false;
        }

        if (sPassword == "") {
            alert("请输入密码!");
            return false;
        }

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/admin/login",//url
            data: $('#form').serialize(),
            success: function (result) {
                // 管理员
                if (result.success == 1 && result.data == 0) {
                    window.location.href = "/admin/sysMain";
                    // 学生
                } else if (result.success == 1 && result.data == 1) {
                    window.location.href = "/admin/stuMain";
                } else if (result.success == 0) {
                    alert(result.comment);
                }
            },
            error: function () {
                alert("异常！");
            }
        });
    }

</script>
</html>
