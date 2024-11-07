<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/find_success.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/find_id-pwd.css'/>">
</head>
<body>
    <div id="find-box">
        <div id="find-info">
            <div id="find-logo" onclick="redirectToLogin()" style="cursor: pointer;">
                <img src="<c:url value='/resources/img/logo.png'/>">
            </div>
            <div id="find-memo">
                아이디 / 비밀번호 찾기
            </div>
        </div>
        <div class="tab_content">
            <input type="radio" name="findInfo" id="findId" checked>
            <label for="findId">아이디 찾기</label>
        
            <input type="radio" name="findInfo" id="findPwd">
            <label for="findPwd">비밀번호 찾기</label>
        
            <div class="conbox con1">
                <form action="" id="findId-form">
                	<c:choose>
	            	<c:when test="${empty findId.prId}">
	                    <div id="findId-result-fail">
	                        <b>${findId.prName }</b>님의 아이디는 <br>
	                        <b>존재하지 않습니다</b>
	                    </div>
	                    <div id="successbtn-area">
	                        <input type="button"value="로그인화면으로"  onclick="redirectToLogin()" style="letter-spacing: 5px;">
	                    </div>
	            	</c:when>
	                <c:otherwise>
	                    <div id="findId-result-fail">
	                        <b>${findId.prName}</b>님의 아이디는 <br>
	                        <b>${findId.prId} </b>입니다.
	                    </div>
	                    <div id="successbtn-area">
	                        <input type="button"value="로그인화면으로" onclick="redirectToLogin()" style="letter-spacing: 5px;">
	                    </div>
	                </c:otherwise>
	            </c:choose> 
                </form>
            </div>
            <div class="conbox con2">
                <form action="" id="findPwd-form">
                    <div id="findPwd-id">
                        <p>아이디</p>
                        <input type="text" placeholder="아이디를 입력하세요">
                    </div>
                    <div id="findPwd-question">
                        <p>보안질문</p>
                        <input type="text" value="가장 좋아하는 과목은?">
                    </div>
                    <div id="findPwd-answer">
                        <p>답변</p>
                        <input type="text" placeholder="답변을 입력해주세요">
                    </div>
                    <div id="findPwd-btn">
                        <input type="button" value="비밀번호 찾기">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function redirectToLogin() {
            window.location.href = '<c:url value="/login"/>'; // login 컨트롤러로 이동
        }
        function redirectToLogin() {
            window.location.href = '<c:url value="/login"/>'; // login 컨트롤러로 이동
        }
    </script>
</body>
</html>