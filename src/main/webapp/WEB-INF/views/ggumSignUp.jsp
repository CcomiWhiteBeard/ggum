<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 회원가입 </title>
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
	#inputdiv2 {
	  position: relative;
	  width: 300px;
	  margin-left: 105px;
	  margin-bottom: 0px;
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
		width: 90px;
	    height: 35px;    
	    margin-right: 125px;	
	    margin-top: 25px;     
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
	
	input[type=reset] {		
		width: 60px;
	    height: 35px;     
	    padding-top: 8px;
	    border: 0px; 
	    margin-top: 25px;
	    margin-right: 10px;
		display: inline-block;
		float: right;
		color: #5f85a5;
		text-align: center;
		font-family: "Jua", sans-serif;
		
	}
	
	input[type=submit]:hover, input[type=reset]:hover {
		cursor: pointer;
	}
	
	#profileImg {
		display: block;
	  	color: #aaa;
	  	font-size: 20px;
	  	margin-left: 10px;
	}
	  
	 
	.filebox {
	  position: relative;
	  display: inline-block;
	  width: 300px; 
	}
	
	.upload-name {
	  display: inline-block;
	  width: 170px; 
	  height: 30px;
	  margin-top: 10px;
	  margin-bottom: 25px;
	  padding: 5px 10px;
	  border: 1px solid #dddddd;
	  font-size: 15px;
	  color: #aaa;
	}
	
	 
	label[for="file"] {
	  display: inline-block;
	  width: 80px; 
	  height: 35px;
	  padding-top: 3px;
	  margin-left: 200px;
	  color: #fff;
	  text-align: center;
	  cursor: pointer;
	}

	input[type="file"] {
	  position: absolute;
	  opacity: 0; 
	  width: 0; /* 라벨과 같은 너비로 */
	  height: 0;
	  top: 0;
	  left: 0;
	}
	
	#preview {
		display:inline-block;
		float: left; 
		width: 100px;
		margin-top: 0;
		margin-left: 110px;
	}
	
	#checkId {
		width: 60px;
	    height: 35px;     
	    padding-top: 8px;
	    border: 0px; 
		display: inline-block;
		float: right;
		color: #5f85a5;
		text-align: center;
		font-family: "Jua", sans-serif;
	}
	#checkId:hover {
		cursor: pointer;
	}
	
</style>


</head>

<body>
<header>
	<span id="logo">
		<a href="ggumList.do"> ggum </a>
	</span>
</header>
	<div id="body">	
	<form name=signupform action="ggumSignUpCommit.do" method="post" enctype="multipart/form-data">
		<div id="inputdiv">
	    	<input type="text" id="id" name="id" required>
	    	<label>ID</label>
	    	<span  id="login"></span>
		</div>
		<div id="inputdiv">
	    	<input type="password" id="pw" name="pw" required>
	    	<label>PW</label>
	    	<span  id="login"></span>
		</div>
		<div id="inputdiv2">
	    	<span id="profileImg">PROFILE IMAGE</span>	
	    	<div class="filebox">
			    <input class="upload-name" id="fileNameDisplay" placeholder="프로필 이미지">
			    <label for="file"><br>파일찾기</label>
			    <input type="file" id="file" name="uploadFile" onchange="previewImage(event)">
			</div>	    	    		    	
		</div>		
		<img id="preview" src="#"  onerror="this.style.display='none'" alt='' />			
		<input type="submit" value="회원가입">
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