<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>  </title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	
    #writer {
        color: #5f85a5;
    }
     
    #rbox {
    	border: 0px;
    	border-radius: 2%;
    	width: 430px;
    	margin-bottom: 5px;
    	padding: 10px;
    	background-color: #f4f4f4;
    	color: #3d3d3d;
		font-size: 15px;
    }
    
    #rbox a {
    	font-size: 15px;
    	color: red;
    }
    
    #replyidx {
    	border: 0px;
    	width: 430px;
    	padding: 10px;
    	color: #3d3d3d;
    	text-align: center;
    	font-size: 15px;
    }
    
    #replyidx a {
    	color: #5f85a5;
    }
    
    #rdelete {
    	float: right;
    }
    
    input[type=text] {
	    width: 320px;
	    height: 25px; 
	    margin-right: 10px;
	    padding: 10px;
	    background-color: white;	
	    border: 0px; 
	    border-radius: 2px;	
		display: inline;
	}
	
	input[type=submit] {
		width: 60px;
	    height: 25px; 
	    border: 0px; 
	    border-radius: 2px;	
	    box-shadow: 0 3px 5px -1px rgba(0, 0, 0, 0.2);
		display: inline;
		background-color: #5f85a5;
		color: white;
		font-family: "Jua", sans-serif;
	}
	
	input[type=submit]:hover {
		cursor: pointer;
	}
</style>
</head>

<body>	
	<div>
	<c:forEach var="dto" items="${rp}">
		<div id="rbox">
			<span id="writer"> ${dto.id} </span>
			<span> : ${dto.content} </span>		
			<span id="rdelete">
				<c:if test="${disp eq dto.id}">					
					<a href="ggumDeleteReply.do?idx=${dto.reply_idx}"> X </a>						
				</c:if>						
			</span>	
		</div> 
	</c:forEach>
	</div>
	
	<div id="replyidx">
	<c:choose>
		<c:when test="${disp != null}">			
			<form name=replyform action="ggumReplyCommit.do?idx=${disp}&pidx=${pidx}" method="post">
				<input type=text name="content" placeholder="댓글을 작성하세요">
				<input type="submit" value="등록">
			</form>			
		</c:when>
			
		<c:otherwise>
			<a href="ggumLogIn.do"> 댓글을 작성하시려면 로그인 하세요 </a>
		</c:otherwise>		
	</c:choose>	
	</div>
	
</body>
</html>