<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> Home </title>
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
    	align: center;  	
    	overflow: auto;
    	-ms-overflow-style: none;
    }
    
    #body::-webkit-scrollbar {
  		display:none;
	}
	
	.toggle:hover {
        cursor: pointer;
        color: #7ca4ed;
    }
		
	#contents {
		border: 1px solid #f5f5f5; 
		width: 470px; 
		margin-bottom: 10px;
		padding: 20px;
		padding-left: 32px;
		border-radius: 2%;
		box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		background-color: #f9f9f9;
	}
	
	#reply {
		color: #5f85a5;
		font-size: 15px;
	}
	
	.postfont {
		font-size: 17px;
		margin-bottom: 3px;
	}

</style>


<script>
	var urlParams = new URLSearchParams(window.location.search);
	if (urlParams.has('logout')) {
	    alert("로그아웃되었습니다.");
	} else if (urlParams.has('upload')) {
		alert("사진이 업로드 되었습니다!");
	}
</script>

</head>

<body>
<header>
	<span id="logo">
		<a href="./index.jsp"> ggum </a>
	</span>
	<span id="logInfo">	
		<c:choose>
			<c:when test="${disp != null}">
				<a href="ggumUpload.do"> 포스팅 | </a>
				<a href="ggumMyPage.do"> 마이페이지 | </a>
				<a href="ggumLogOut.do"> 로그아웃 </a>
			</c:when>
				
			<c:otherwise>
				<a href="ggumLogIn.do"> 로그인 </a>
			</c:otherwise>		
		</c:choose>		
	</span>
</header>	
	
	<div id="body">
	<c:forEach var="dto" items="${GG}">
		<div id="contents">
			<div class="postfont"> <span><img src="./resources/images/${dto.profile_img}" width=17 height=17></span> ${dto.id} </div>
			<div> <img src="./resources/images/${dto.post_img}" width=450> </div>
			<div class="postfont"> ${dto.title} </div> <br>
			<div id="reply"> <span class="toggle"> [댓글] ${dto.rcnt} </span> </div>
			<div id="replybox" style="display: none;">
				<c:import url="/ggumReply.do?idx=${dto.post_idx}" />
 			</div>
		</div> <p>
	</c:forEach>
	</div>
	
	
	<script>
    var commentTriggers = document.querySelectorAll('.toggle');

    commentTriggers.forEach(function(trigger) {
        trigger.addEventListener('click', function() {
            var replyBox = this.parentNode.nextElementSibling;

            if (replyBox.style.display === 'none') {
                replyBox.style.display = 'block';
            } else {
                replyBox.style.display = 'none';
            }
        });
    });
	</script>
	 
 
</body>
</html>