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
    <title>用户登录</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />

</head>
<body background="../../img/2.jpg" style="background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;">

    <div class="page">
        <div class="loginwarrp">
            <a href="index.jsp" style="font-size: 10px;color: green;"><%="<<返回主页面" %></a>
            <div class="logo">账号登陆</div>
            <div class="login_form">
                <form>
                    <li class="login-item">
                        <span>手机号：</span>
                        <input type="text" id="Uid" name="Uid" class="login_input" >
                        <span id="count-msg" class="error"></span>
                    </li>
                    <li class="login-item">
                        <span>密　码：</span>
                        <input type="password" id="Upwd" name="Upwd" class="login_input" >
                        <span id="password-msg" class="error"></span>
                    </li>
                    <br/><br/>
                    <li>
                        <a href="href?a=UserRegister" style="font-size: 10px;color: green;">没有账号？点击注册</a>
                    </li>
                    <li class="login-sub">
                        <input type="button" id="loginButton" name="loginButton" value="登录" />
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
        $("#loginButton").click(function () {
            var Uid = $("#Uid").val();
            var Upwd = $("#Upwd").val();
            var url = "uid="+Uid+"&upwd="+Upwd;
            if(Uid == null || Uid == ""){
                alert("手机号不能为空");
            }
            else if(Upwd == null || Upwd == ""){
                alert("密码不能为空");
            }
            else{
                //ajax
                $.ajax({
                    url: "${pageContext.request.contextPath }/loginValidate?"+url,
                    type: "post",
                    success : function(data){
                        if(data == Uid){
                            alert("登录成功");
                            //跳转页面
                            window.location.href = "index.jsp";
                        }
                        else{
                            alert("账号不存在或者密码错误");
                        }
                    }
                });
            }
        });
    </script>

</body>
</html>
