<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 포스트 수정 </title>
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
    	border: 1px solid #f5f5f5;
    	border-radius: 2%;
		box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		background-color: #f9f9f9;
    	font-size: 18px;
    	width: 470px;
    	margin: 0 auto;
    	margin-top: 50px;
    	margin-bottom: 10px;
    	padding: 20px;
    	padding-left: 32px;
    	align: center;  	
    	overflow: auto;
    	-ms-overflow-style: none;
    }
    input[type=text] {
		 width: 230px;
		 height: 32px;
		 font-size: 15px;
		 border: 0;
		 border-radius: 10px;
		 outline: none;
		 padding-left: 10px;
		 background-color: #f2f2f2;
		 font-family: "Jua", sans-serif;
		 font-size: 16px;
		 color: #3d3d3d;
	}
	input[type=submit] {
		width: 80px;
	    height: 35px; 
	    margin-top: 20px;
	    margin-right: 30px;
	    padding-top: 8px;
	    border: 0px; 
	    border-radius: 2px;	
	    box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		display: inline-block;
		float: right;
		background-color: #5f85a5;
		color: white;
		text-align: center;
		font-size: 18px;
		font-family: "Jua", sans-serif;
	}
	
	input[type=submit]:hover {
		cursor: pointer;
	}
	
	#back {
		margin-top: 30px;
		margin-left: 280px;
		font-size: 17px;
	}
    
</style>
</head>

<body>
<header>
	<div>
		<span id="logo">
			<a href="ggumList.do"> ggum </a>
		</span>
		<span id="logInfo">
			<a href="ggumUpload.do"> 포스팅 | </a>
			<a href="ggumLogOut.do"> 로그아웃 </a>
		</span>		
	</div>
</header>	
	
	<div id="body">
		<img id="pic" src="./resources/images/${po.post_img}" width=450>
		<form name=editform action="ggumEditCommit.do?idx=${po.post_idx}" method="post"> <br>		
			제목 수정 : &nbsp; <input type=text  name="title" value="${po.title}"> <br>			
			<input type="submit" value="수정완료">
		</form>	
		<div id="back">			
			<a href="ggumMyPage.do"> 돌아가기 </a>
		</div>
	</div>
	
 
</body>
</html>

