<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> Welcome </title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	
	@-webkit-keyframes fadein {
        from { opacity: 0; }
        to { opacity: 1; }
    }
	
	a {
		text-decoration: none;
		color: #5f85a5;
	}
	
	a:hover {
		color: #7ca4ed;
	}
	
	#welcome {
		width: 500px;
		margin: auto;
		margin-top: 150px;		
		text-align: center;
		font-size: 100px;
		font-family: "Brush Script MT", cursive;
		-webkit-animation: fadein 2s;
	}
	
	#link {
		width: 200px;
		margin: auto;
		margin-top: 10px;		
		text-align: center;
		font-size: 17px;
		font-family: "Jua", sans-serif;
		-webkit-animation: fadein 2s;
	}
	
	
</style>
</head> 

<body>
	
	<div id="welcome">
		welcome!
	</div>
	
	<div id="link">
		<span>
			<a href="ggumList.do"> 둘러보기 </a>
		</span>
		&nbsp; &nbsp;
		<span>
			<a href="ggumLogIn.do"> 로그인 </a>
		</span>
	</div>
	
</body>
</html>
