<%-- 
    Document   : login
    Created on : 10 Sep, 2020, 11:09:58 AM
    Author     : harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/util.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <title>Login</title>
  <script>
    
        function student(){
          var btn = document.getElementById("btn");
            btn.style.left="110px";
            var user = document.getElementById("user");
            user.value="student";
          }
        function teacher(){
          var btn = document.getElementById("btn");
            btn.style.left="0";
            var user = document.getElementById("user");
            user.value="teacher";
        }
    
    </script> 
</head>
<body>
  
  <div id="container">
    <nav>
      <span class="nav-heading">Class On Click</span>
      <ul style="display:contents">
        <li><a href="#"><span class="glyphicon glyphicon-home" style="font-size: 24px;"></span> Home</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-out" style="font-size: 24px;"></span> Login</a></li>
      </ul>
    </nav>
      <div align="center">
    <div class="wrap-login100" >
        <form class="login100-form validate-form" method="post" action="UserVerify.jsp">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
                  
  <div class="button-box">
      <div id="btn"></div>
    <div  style="white-space:nowrap">
    <button type="button" class="toggle-btn" value="teacher" onclick=teacher()>Teacher</button>
    <button type="button" class="toggle-btn" onclick=student()>Student</button>
    </div>
</div>

  <span style="color:red">
      <%
      String message = (String)session.getAttribute("message");
      if(message != null){
        out.print(message);
        session.removeAttribute("message");
      }
      %>
  </span>
            <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                <input class="input100" type="text" name="userid" autofocus>
                    <span class="focus-input100" data-placeholder="UserId"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <span class="btn-show-pass">
                            <i class="zmdi zmdi-eye"></i>
                    </span>
                    <input class="input100" type="password" name="password">
                    <span class="focus-input100" data-placeholder="Password"></span>
            </div>

            <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button type="submit" name="user" value="teacher" id="user" class="login100-form-btn">
                                    Login
                            </button>
                    </div>
            </div>

				</form>
			</div>
    
    </div>
    
    
    
    
  </div>
  
</body>
</html>