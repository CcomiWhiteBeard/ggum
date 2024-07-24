<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 사진 업로드 </title>
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
    	width: 530px;
    	margin: 0 auto;
    	margin-top: 50px;
    	margin-bottom: 10px;
    	padding-bottom: 20px;
    	padding-top: 50px;
    	align: center;  	
    	overflow: auto;
    	-ms-overflow-style: none;
    }
    
    input[type=submit] {
		width: 90px;
	    height: 35px;    
	    margin-right: 185px;	
	    margin-top: 10px;     
	    padding-top: 8px;
	    border: 0px; 
	    border-radius: 2px;	
	    box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		display: inline-block;
		float: right;
		background-color: #5f85a5;
		color: white;
		font-size: 18px;
		text-align: center;
		font-family: "Jua", sans-serif;
	}
	
	input[type=reset] {		
		width: 60px;
	    height: 35px;     
	    padding-top: 8px;
	    border: 0px; 
	    border-radius: 2px;	
	    margin-top: 10px;
	    margin-right: 10px;
		display: inline-block;
		float: right;
		color: #5f85a5;
		font-size: 18px;
		text-align: center;
		font-family: "Jua", sans-serif;
		
	}
	
	input[type=submit]:hover, input[type=reset]:hover {
		cursor: pointer;
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
	
	input:focus { outline: none; }
	
	.inputdiv {
		margin-left: 100px;
		margin-bottom: 40px;
	}
	.inputdiv2 {
		margin-left: 100px;
		margin-bottom: 10px;
	}
	
	.filebox {
	  	position: relative;
	  	display: inline-block;
	  	width: 430px; 
	  	margin-left: 100px;
		margin-bottom: 15px;
	}
	
	.upload-name {	
		display: inline-block;
		width: 200px; 
		height: 34px;
		margin-bottom: 0px;
		border: 0;
		border-radius: 10px;
		outline: none;
		padding-left: 10px;
		background-color: #f2f2f2;
		font-family: "Jua", sans-serif;
		font-size: 15px;
		color: #aaa;
	}
	
	label[for="file"] {
		display: inline-block;
		width: 80px; 
		height: 35px;
		margin-left: 15px;
		text-align: center;
		font-size: 16px;
		cursor: pointer;
		color: #3d3d3d;
	}

	input[type="file"] {
	  position: absolute;
	  opacity: 0; 
	  width: 0; /* 라벨과 같은 너비로 */
	  height: 0;
	  top: 0;
	  left: 0;
	}
	
	.prvcontainer {
		width: 350px;
		align: center;
		margin-left: 100px;
		margin-bottom: 10px;
	}
	#preview {
		display:none; 
		width: 300px;
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
	<form name=uploadform action="ggumUploadCommit.do" method="post" enctype="multipart/form-data">		
		<div class="inputdiv">
			제목 : &nbsp;<input type=text name="title"> <br>
		</div>
		<div class="inputdiv2">
			업로드 이미지 : 
		</div>
		<div class="filebox">
		    <input class="upload-name" id="fileNameDisplay" placeholder="이미지 파일">
		    <label for="file">파일찾기</label>
		    <input type="file" id="file" name="uploadFile" onchange="previewImage(event)">
		</div>
		<div class="prvcontainer">
			<img id="preview" src="#" alt="미리보기">
		</div>
		<input type="submit" value="업로드">
		<input type="reset" value="취소">
	</form>
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
		    $("#file").on('change', function(){
		        var fileName = $(this).val();
		        $(".upload-name").val(fileName);
		    });
		});
	</script>
	<script>
	function previewImage(event) {
	    var reader = new FileReader();
	    reader.onload = function(){
	        var preview = document.getElementById('preview');
	        preview.src = reader.result;
	        preview.style.display = "block";
	    };
	    reader.readAsDataURL(event.target.files[0]);
	}
	</script>
  
 
</body>
</html>