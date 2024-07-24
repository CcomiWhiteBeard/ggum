<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 로그인 </title>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');    
    
    header {
    	width: 500px;
    	margin: 0 auto;
    	align: center;
    }
    
    a {
		text-decoration: none;	
	}
	
	a:visited, a:active {
		color: #5f85a5;
	}
	
	#logo{
		margin-left: 170px;
		display: inline-block;
		text-align: center;
		color: #5f85a5;
		font-size: 80px;
		font-family: "Brush Script MT", cursive;
	}
	
	#logInfo {
		display: inline-block;
		float: right;
		margin-top: 85px;		
		font-family: "Jua", sans-serif;
	}
	
	#logInfo a {
		color: #3d3d3d;
	}
	
	#logInfo a:hover {
		color: #7ca4ed;
	}
    
     body {
    	font-family: "Jua", sans-serif;
    }
    #body {
    	width: 530px;
    	height: 700px;
    	margin: 0 auto;
    	margin-top: 50px;
    	padding-top: 50px;
    	align: center;  	
    	overflow: auto;
    }
	
	
	#inputdiv {
	  position: relative;
	  width: 300px;
	  margin-left: 105px;
	  margin-bottom: 50px;
	}
    input::placeholder { color: #aaaaaa; }
	input:focus { outline: none; }
	input {
	  font-size: 18px;
	  font-family: "Jua", sans-serif;
	  color: #222222;
	  width: 288px;
	  border: none;
	  border-bottom: solid #aaaaaa 1px;
	  padding-bottom: 5px;
	  padding-left: 10px;
	  position: relative;
	  background: none;
	  z-index: 5;
	}	
	#login {
	  display: block;
	  position: absolute;
	  bottom: 0;
	  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
	  background-color: #666;
	  width: 0;
	  height: 2px;
	  border-radius: 2px;
	  transition: 0.5s;
	}	
	label {
	  position: absolute;
	  color: #aaa;
	  left: 10px;
	  font-size: 20px;
	  bottom: 8px;
	  transition: all .2s;
	}	
	input:focus ~ label, input:valid ~ label {
	  font-size: 16px;
	  bottom: 40px;
	  color: #666;
	  font-weight: bold;
	}	
	input:focus ~ #login, input:valid ~ #login {
	  width: 100%;
	}
	
	input[type=submit] {
		width: 80px;
	    height: 35px; 
	    margin-right: 125px;
	    padding-top: 8px;
	    border: 0px; 
	    border-radius: 2px;	
	    box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		display: inline-block;
		float: right;
		background-color: #5f85a5;
		color: white;
		text-align: center;
		font-family: "Jua", sans-serif;
	}
	
	input[type=submit]:hover {
		cursor: pointer;
	}
	
	#signup {
		margin-top: 60px;
		margin-left: 245px;
	}
    
</style>

<script>
	var urlParams = new URLSearchParams(window.location.search);
	if (urlParams.has('loginFail')) {
	    alert("존재하지 않는 아이디 혹은 비밀번호입니다!");
	}
</script>

</head>

<body>
<header>
	<span id="logo">
		<a href="ggumList.do"> ggum </a>
	</span>
</header>
	
	<div id="body">
	<form name=loginform action="ggumLogInCommit.do" method="post">
		<div id="inputdiv">
	    	<input type="text" name="id" required>
	    	<label>ID</label>
	    	<span  id="login"></span>
		</div>
		<div id="inputdiv">
	    	<input type="password" name="pw" required>
	    	<label>PW</label>
	    	<span  id="login"></span>
		</div>
		<input type="submit" value="로그인">
	</form>
	
	<div id="signup">
		<a href="ggumSignUp.do"> 회원가입 </a>
	</div>
	</div>
	
 
</body>
</html>











