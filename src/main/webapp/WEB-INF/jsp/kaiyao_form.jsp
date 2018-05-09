<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/layer/layer.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <title></title>
    <link href="/CSS/style.css" rel="stylesheet">
</head>
<body>
<form id="form1" name="form1" method="post" action="">
    <textarea id="description" name="description" class="textarea-pop" validate="required maxlength[500]"
              msg="required:please enter remark;"></textarea>
    <input type="hidden" id="stuName" name="stuName" value="${name}">
    <input type="hidden" id="serialNumber" name="serialNumber" value="${serialNumber}">
    <input type="button" value="确认" onclick="confirm()">
    <input type="reset" value="重置">
</form>

<style type="text/css">
    .textarea-pop{
        padding:10px;
        height: 150px;
        width: 500px;
        font-size: 12px;
        border: 1px solid #dedede;
    }
</style>

<script type="text/javascript">
    function confirm() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/medicalRecords/insert",
            data: $('#form1').serialize(),
            success: function (result) {
                if (result.success == 1) {
                    layer.msg("开药成功", {time:1000},function () {
                        parent.location = "/register/getRegisterList";
                        window.layer.closeAll();
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
</body>
</html>