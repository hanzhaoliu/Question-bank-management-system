<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/13
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body background="../../img/2.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;">
    <div class="page">
        <div class="loginwarrp">
            <a href="index.jsp" style="font-size: 10px;color: green;"><%="<<返回主页面" %></a>
            <div class="logo">注册页面</div>
            <div class="login_form">
                <form>
                    <li class="login-item">
                        <span>用户名：</span>
                        <input type="text" id="Uname" name="Uname" class="login_input" />
                    </li>
                    <li class="login-item">
                        <span>密　码：</span>
                        <input type="password" id="Upwd" name="Upwd" class="login_input" >
                        <span id="password-msg" class="error"></span>
                    </li>
                    <li class="login-item">
                        <span>重复密码：</span>
                        <input type="password" id="Upwd2" name="Upwd2" class="login_input" />
                    </li>
                    <li class="login-item">
                        <span>手机号：</span>
                        <input type="text" id="Uid" name="Uid" class="login_input" >
                        <input type="button" id="yzmButton" name="yzmButton" value="获取验证码"/>
                    </li>
                    <li class="login-item">
                        <span>验证码：</span>
                        <input type="text" id="yzm" name="yzm" class="login_input" />
                    </li>
                    <br/><br/>
                    <li>
                        <a href="href?a=Userlogin" style="font-size: 10px;color: green;">已有账号？点击登录</a>
                    </li>
                    <li class="login-sub">
                        <input type="button" id="registerButton" name="registerButton" value="注册" />
                        <input type="reset" id="Reset" name="Reset" value="重置" />
                    </li>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/canvas-particle.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            var config = {
                vx : 4,
                vy : 4,
                height : 2,
                width : 2,
                count : 300,
                color : "121, 162, 185",
                stroke : "100, 200, 180",
                dist : 6000,
                e_dist : 20000,
                max_conn : 10
            }
            CanvasParticle(config);
        }
        $("#registerButton").click(function () {
            var Uname = $("#Uname").val();
            var Uid = $("#Uid").val();
            var Upwd = $("#Upwd").val();
            var Upwd2 = $("#Upwd2").val();
            var url = "uid="+Uid+"&upwd="+Upwd+"&uname="+Uname;
            if(Uname == null || Uname == ""){
                alert("用户名不能为空");
            }
            else if(Upwd == null || Upwd == ""){
                alert("密码不能为空");
            }
            else if(Upwd != Upwd2){
                alert("两次密码不一致");
            }
            else if(Uid == null || Uid == ""){
                alert("手机号不能为空");
            }
            else{
                //ajax先查询用户是否存在，不存在的话，则插入
                $.ajax({
                    url: "${pageContext.request.contextPath }/validateUser?uid="+Uid,
                    type: "post",
                    success : function(data){
                        if(data == Uid){
                            alert("改手机号已被注册");
                            return;
                        }
                    }
                });
                //alert(123);
                $.ajax({
                    url: "${pageContext.request.contextPath }/insertUser?"+url,
                    type: "post",
                    success : function(data){
                        alert("注册成功！点击确定前往登录页面");
                        window.location.href="href?a=Userlogin";
                    }
                });
            }
        });
    </script>

</body>
</html>
