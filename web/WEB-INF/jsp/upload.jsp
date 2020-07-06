<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/3
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>习题上传</title>
    <style type="text/css">
        td{
            text-align: center;
        }
        button{
            font-size: 22px;
        }
    </style>
</head>
<body background="img/7.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;">
<h1>习题上传</h1>
<input id="returnButton" style="font-size: 18px;" type="button" value="返回主界面"/>
    <div style="width: 100%; margin: 0 auto;">
        <table style="margin: 0 auto; border-collapse:separate; border-spacing:0px 10px;">
            <tr>
                <th style="width: 80px; height: 80px;"></th>
                <th style="width: 500px;"></th>
            </tr>
            <tr>
                <td>题目</td>
                <td><textarea style="width: 500px; font-size: 22px;" rows="3" id="qtext"></textarea></td>
            </tr>
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td>A</td>
                <td><input id="qa" style="width: 500px; height: 50px; font-size: 22px;" type="text"/></td>
            </tr>
            <tr>
                <td>B</td>
                <td><input id="qb" style="width: 500px; height: 50px; font-size: 22px;" type="text"/></td>
            </tr>
            <tr>
                <td>C</td>
                <td><input id="qc" style="width: 500px; height: 50px; font-size: 22px;" type="text"/></td>
            </tr>
            <tr>
                <td>D</td>
                <td><input id="qd" style="width: 500px; height: 50px; font-size: 22px;" type="text"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input id="qButton" style="font-size: 18px;" type="button" value="上传"/></td>
            </tr>
        </table>
    </div>
</body>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script>
    $("#returnButton").mousedown(function () {
        window.location.href = "index.jsp";
    });

    $("#qButton").mousedown(function () {
        var qtext = $("#qtext").val();
        var qa = $("#qa").val();
        var qb = $("#qb").val();
        var qc = $("#qc").val();
        var qd = $("#qd").val();
        if(qtext == null || qtext == ""){
            alert("题目不能为空");
        }
        else if(qa == null || qa =="" || qb == null || qb =="" || qc == null || qc =="" || qd == null || qd ==""){
            alert("选项不能为空");
        }
        else{
            var url = "qtext="+qtext+"&qa="+qa+"&qb="+qb+"&qc="+qc+"&qd="+qd;
            $.ajax({
                url : "${pageContext.request.contextPath }/insertQuestionFromUser?"+url,
                type : "post",
                success : function(data) {
                    alert("感谢你！题目待管理员审核后，将会给所有人使用！");
                }
            });
            $("#qtext").val("");
            $("#qa").val("");
            $("#qb").val("");
            $("#qc").val("");
            $("#qd").val("");
        }
    });
</script>
</html>
