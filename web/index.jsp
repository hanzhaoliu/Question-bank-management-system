<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>软考题库管理系统</title>
  <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
  <style type="text/css">
    html,body{height:auto;}
    #provinceDiv select{margin-left:10px; width:100px; height: 40px}
    #login{
      width: auto;
      position: fixed;
      height: 30px;
      top: 10px;
      right: 50px;
    }
    #login table{
      border: 1px solid #FFFFFF;
      text-align: center;
    }
    #login table tr td{
      width: 100px;
      height: 30px;
      cursor: pointer;
      color: #ff2d51;
    }
    #hospitalSelectDiv div{
      float: left;
    }
    #hospitalSelectDiv #provinceDiv{
      width: 30%;
      text-align: left;
    }
    #hospitalSelectDiv #hospitalAll{
      width: 68%;
      margin-left: 20px;
    }
    #hospitalDiv{
      margin-top: 20px;
      width: 100%;
      height: auto;
    }
    #chooseDiv{
      width: 100%;
      height: auto;
      margin: 0 auto;
    }
    #chooseDiv div{
      width: 100%;
      height: 200px;
      margin: 0 auto;
      justify-content: space-between;
    }

    #chooseDiv div div{
      width:300px;
      height:200px;
      font-size: 30px;
      text-align: center;
      line-height: 200px;
      float: left;
      margin-left: 10px;
      color: #FFFFFF;
    }

    .choose{
      width:300px;
      height:200px;
      font-size: 30px;
      text-align: center;
      line-height: 200px;
      float: left;
      margin-left: 10px;
      color: #ff2d51;
      border: 2px solid #ff2d51;
      cursor:pointer;
    }
    .notChoose{
      width:300px;
      height:200px;
      font-size: 30px;
      text-align: center;
      line-height: 200px;
      float: left;
      margin-left: 10px;
      color: #FFFFFF;
      border: 2px solid #FFFFFF;
      cursor:pointer;
    }
  </style>
</head>
<body background="img/2.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;">
<h1 style="color: #FFFFFF;" >软考题库管理系统</h1>
<div id="login">
  <table border="1" cellspacing="1">
    <tr>
      <td onclick="faceJumpIndex()">主页面</td>
      <td onclick="faceJump('Userlogin')">登录</td>
      <td onclick="faceJump('UserRegister')">注册</td>
      <td onclick="getTest()">查询分数</td>
    </tr>
  </table>
</div>
<div style="height: 80px; width: 100%;"></div>
<br/>
<div id="chooseDiv" style="">
  <div style="">
    <div></div>
    <div id="train" style="border: 2px solid #FFFFFF;cursor:pointer;">习题训练</div>
    <div id="simulation" style="border: 2px solid #FFFFFF;cursor:pointer;">全真模拟</div>
    <div></div>
  </div>
  <br/>
  <div style="">
    <div></div>
    <div id="errorSet" style="border: 2px solid #FFFFFF;cursor:pointer;">错题本</div>
    <div id="upload" style="border: 2px solid #FFFFFF;cursor:pointer;">习题上传</div>
    <div></div>
  </div>
</div>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.provincesCity.js"></script>
<script type="text/javascript" src="js/provincesData.js"></script>
<script type="text/javascript">

    function faceJumpIndex() {
        window.location.href = "index.jsp";
    }

    function faceJump(url) {
        window.location.href = "href?a="+url;
    }

    $("#train").mousedown(function () {
        //alert("1");
        window.location.href = "href?a=train";
    });

    $("#simulation").mousedown(function () {
        //alert("2");
        window.location.href = "href?a=simulation";
    });

    $("#errorSet").mousedown(function () {
        //alert("3");
        window.location.href = "href?a=errorSet";
    });

    $("#upload").mousedown(function () {
        //alert("4");
        window.location.href = "href?a=upload";
    });

    function getTest() {
        var uid = '<%=(String)session.getAttribute("userID")%>';
        //alert(uid);
        if(uid == null || uid == ''){
            alert('你还未登录，无法查询！');
        }
        else{
            $.ajax({
                url : "${pageContext.request.contextPath }/getTestsByUid?uid="+uid,
                type : "post",
                async : false,
                //成功响应的结果
                success : function(data) {
                    var s = ' 序号          时间                      分数\n';
                    for(var i=0; i<data.length; ++i){
                        s += (i+1)+'        '+DateTrun(data[i].ttime)+'        '+data[i].tgrade+'\n';
                    }
                    alert(s);
                }
            });
        }

        function DateTrun(ms) {
            var myDate = new Date();
            myDate.setTime(ms);
            return myDate.getFullYear()+'年'+(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 '+myDate.getHours()+':'+(myDate.getMinutes()>9?myDate.getMinutes():'0'+myDate.getMinutes());
        }

    }
</script>
</body>
</html>
