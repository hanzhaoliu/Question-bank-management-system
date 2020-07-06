<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/3
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理页面</title>
    <style type="text/css">
        td{
            text-align: center;
        }
        button{
            font-size: 22px;
        }
    </style>
</head>
<body background="img/4.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;">
<%
    String adminID = (String)session.getAttribute("adminID");
    if(adminID == null)
    {
%>
<script type="text/javascript">
    window.location.href = "admin?a=Login";
</script>
<%
    }
%>

<h1>管理页面</h1>
<div style="float: left; border-collapse: separate; border-spacing:20px 0px; width: 100%">
    <input id="checkButton" style="font-size: 18px;" type="button" value="审核题目"/>
    <input id="uploadButton" style="font-size: 18px;" type="button" value="上传题目"/>
    <input id="updateButton" style="font-size: 18px;" type="button" disabled="true" value="修改题目"/>
    <input id="deleteButton" style="font-size: 18px;" type="button" value="删除题目"/>
</div>
<div style="height: 20px; width: 100%"></div>
<div style="width: 100%; margin: 0 auto;">
    <table style="margin: 0 auto; border-collapse:separate; border-spacing:0px 10px;">
        <tr>
            <th style="width: 80px;"></th>
            <th style="width: 500px;"></th>
        </tr>
        <tr>
            <td>题目</td>
            <td><textarea style="width: 500px; font-size: 22px;" rows="3" id="qtext"></textarea></td>
        </tr>
        <tr>
            <td>A</td>
            <td><input id="qa" style="width: 500px; height: 40px; font-size: 22px;" type="text"/></td>
        </tr>
        <tr>
            <td>B</td>
            <td><input id="qb" style="width: 500px; height: 40px; font-size: 22px;" type="text"/></td>
        </tr>
        <tr>
            <td>C</td>
            <td><input id="qc" style="width: 500px; height: 40px; font-size: 22px;" type="text"/></td>
        </tr>
        <tr>
            <td>D</td>
            <td><input id="qd" style="width: 500px; height: 40px; font-size: 22px;" type="text"/></td>
        </tr>
        <tr>
            <td>答案</td>
            <td><input id="qanswer" style="width: 500px; height: 40px; font-size: 22px;" placeholder="请输入数字，A:1、B:2、C:3、D:4" type="text"/></td>
        </tr>
        <tr>
            <td>题解</td>
            <td><textarea style="width: 500px; font-size: 22px;" rows="3" id="qexplain"></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input id="qButton0" style="font-size: 18px;" type="button" value="上一道"/>
                &nbsp;&nbsp;&nbsp;
                <input id="qButton1" style="font-size: 18px;" type="button" value="修改"/>
                &nbsp;&nbsp;&nbsp;
                <input id="qButton2" style="font-size: 18px;" type="button" value="下一道"/>
            </td>
        </tr>
    </table>
</div>
</body>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script>

    var qid = 0x7fffffff;
    var flag = 0;


    $("#checkButton").mousedown(function () {
        window.location.href = "admin?a=Index";
    });

    $("#uploadButton").mousedown(function () {
        window.location.href = "admin?a=Upload";
    });

    $("#updateButton").mousedown(function () {
        window.location.href = "admin?a=Update";
    });

    $("#deleteButton").mousedown(function () {
        window.location.href = "admin?a=Delete";
    });

    function clearText(){
        $("#qtext").val("");
        $("#qa").val("");
        $("#qb").val("");
        $("#qc").val("");
        $("#qd").val("");
        $("#qanswer").val("");
        $("#qexplain").val("");
    }

    $("#qButton1").mousedown(function () {
        var qtext = $("#qtext").val();
        var qa = $("#qa").val();
        var qb = $("#qb").val();
        var qc = $("#qc").val();
        var qd = $("#qd").val();
        var qanswer = $("#qanswer").val();
        var qexplain = $("#qexplain").val();
        if(qtext == null || qtext == ""){
            alert("题目不能为空");
        }
        else if(qa == null || qa =="" || qb == null || qb =="" || qc == null || qc =="" || qd == null || qd ==""){
            alert("选项不能为空");
        }
        else if(qanswer == null || qanswer == ""){
            alert("答案不能为空");
        }
        else{
            var url = "qid="+qid+"&qtext="+qtext+"&qa="+qa+"&qb="+qb+"&qc="+qc+"&qd="+qd+"&qanswer="+qanswer+"&qstate=1&qexplain="+qexplain;
            $.ajax({
                url : "${pageContext.request.contextPath }/updateQuestion?"+url,
                type : "post",
                success : function(data) {
                }
            });
            alert("修改成功！");
            clearText();
            getQuestion0();
        }
    });

    $("#qButton0").mousedown(function () {
        if(qid >= flag){
            alert('这已经是第一道题了！');
        }
        else {
            clearText();
            getQuestion();
        }
    });

    $("#qButton2").mousedown(function () {
        clearText();
        getQuestion0();
    });

    function getQuestion() {
        var lsg = qid;
        $.ajax({
            url : "${pageContext.request.contextPath }/getEffectiveQuestion?num="+qid,
            type : "post",
            async: false,
            success : function (data) {
                qid = data.qid;
                $("#qtext").val(data.qtext);
                $("#qa").val(data.qa);
                $("#qb").val(data.qb);
                $("#qc").val(data.qc);
                $("#qd").val(data.qd);
                $("#qanswer").val(data.qanswer);
                $("#qexplain").val(data.qexplain);
            }
        });
        if(!(qid > lsg))
            qid = lsg;
        //alert(qid);
    }

    function getQuestion0() {
            $.ajax({
                url : "${pageContext.request.contextPath }/getEffectiveUpQuestion?num="+qid,
                type : "post",
                async: false,
                success : function (data) {
                    qid = data.qid;
                    $("#qtext").val(data.qtext);
                    $("#qa").val(data.qa);
                    $("#qb").val(data.qb);
                    $("#qc").val(data.qc);
                    $("#qd").val(data.qd);
                    $("#qanswer").val(data.qanswer);
                    $("#qexplain").val(data.qexplain);
                }
            });

    }

    window.onload = function(){
        getQuestion0();
        flag = qid;
    };
</script>

</html>
