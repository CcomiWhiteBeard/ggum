<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 마이 페이지 </title>
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
    
    .grid-container {
    	width: 510px;
    	height: 700px;
    	display: grid;
    	grid-template-columns: repeat(2, 1fr);
    	grid-gap: 10px;
    	margin: 0 auto;
    	margin-top: 50px;
    	align: center;  	
    	overflow: auto;
    	-ms-overflow-style: none;
    }
    
    .grid-container::-webkit-scrollbar {
  		display:none;
	}

    .grid-item {
    	width: 225px;
    	height: 225px;
    	border: 1px solid #f5f5f5;
    	padding: 20px 2px 20px 14px;
    	border-radius: 2%;
		box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		background-color: #f9f9f9;
		overflow: auto;
    	-ms-overflow-style: none;
    }
    
    .grid-item::-webkit-scrollbar {
  		display:none;
	}

    .grid-item img {
    	width: 210px;
    }
    
    .editbox {
    	display: inline-block;
    	float: right;
    	text-align: right;
    	margin-right: 15px;
    	width: 150px;
    }
    
    .edit {
    	color: #5f85a5;
    	font-size: 15px;
    }
    
    
    .editbox a:hover {
		color: #7ca4ed;
		cursor: pointer;
	}
    
</style>

<script>
	function confirmDelete(post_idx) {
		
		if(confirm('삭제하시겠습니까?')) {
            window.location.href='ggumDeleteCommit.do?idx=' + post_idx;
        } else {
            window.location.href='ggumMyPage.do';
        }
	}
</script>

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

  	<div class="grid-container">
	<c:forEach var="dto" items="${my}">
		<div class="grid-item">
			<div style="padding: 0px;"> <img src="./resources/images/${dto.post_img}"> </div>
			<div> ${dto.title} </div>
			<div class="editbox">
				<a class="edit" href="ggumEdit.do?idx=${dto.post_idx}"> 수정 </a>
				<a class="edit" onclick="confirmDelete(${dto.post_idx});"> 삭제 </a>
			</div>
		</div> 
	</c:forEach>
	</div>


</body>
</html>