<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" href="css/theme.css">

</head>
<body>
   <form class="loginForm" id="loginForm">
      <h2>Login</h2>
      <div class="idForm">
         <input type="text" id="id" class="id" name="id" placeholder="ID">
      </div>
      <div class="passForm">
         <input type="password" id="pw" class="pw" name="pw" placeholder="PW">
      </div>
      <div class="stateForm">
         <input type="hidden" id="state" name="state" >
         
      </div>
      <div class="nameForm">
         <input type="hidden" id="name" class="name" name="name">
      </div>
      <div class="empnoForm">
         <input type="hidden" id="empno" class ="empno" name="empno">
      </div>
      <div class="deptForm">
         <input type="hidden" id="dept" class="dept" name="dept">
      </div>
      
      <input type="submit" id="login_submit" class="btn" value="LOG IN">
      <hr>
      <br>
      <br>
            <div class="bottomText">
         <p>Don't you have ID? <a href="memberJoinForm">sign up</a>
      </div>
      <br>
      <div>
         <input type="button" onclick="findId()" class="btn idPwFind" style="margin-bottom: 5px; width: 120px; left: 60px;" value="아이디찾기">
         <input type="button" onclick="findPw()" class="btn idPwFind" style="margin-bottom: 5px; width: 120px; left: 60px;" value="비밀번호찾기">
      </div>
   </form>

   <script src="js/login.js"></script>
   <script src="js/jquery-3.5.1.min.js"></script>
</body>

</html>