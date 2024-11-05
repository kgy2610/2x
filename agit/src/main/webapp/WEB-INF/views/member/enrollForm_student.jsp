<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AGIT</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/enrollForm.css'/>">
</head>
<body>
    <div id="enrollForm-box">
        <div id="enroll-logo" onclick="redirectToLogin()" style="cursor: pointer;">
            <img src="<c:url value='/resources/img/logo.png'/>"">
        </div>
        <div id="enroll-bar">
            학생 회원가입
        </div>

        <div id="enrollForm-form">
            <form action="">
                <div id="enroll-name">
                    <p>이름</p>
                    <input type="text" placeholder="이름을 입력하세요." autofocus>
                </div>
                <div id="enroll-id">
                    <p>아이디</p>
                    <input type="text" placeholder="아이디를 입력하세요." autofocus>
                    <input type="button" value="중복확인">
                </div>
                <div id="enroll-pwd">
                    <p id="enroll-pwd-p">비밀번호</p>
                    <input type="text" placeholder="비밀번호를 입력하세요." autofocus>
                </div>
                <div id="enroll-pwd">
                    <p>비밀번호 확인</p>
                    <input type="text" placeholder="이름을 입력하세요." autofocus>
                </div>
                <div id="enroll-phone">
                    <p>전화번호</p>
                    <input type="text" placeholder="(-)제외하고 입력 ex)01011112222" autofocus>
                </div>
                <div id="enroll-Q">
                    <p>본인 확인 질문</p>
                    <select>
                        <option value="subject">내가 가장 좋아하는 과목은?</option>
                        <option value="area">내가 태어난 도시는?</option>
                        <option value="travel">가장 기억에 남는 여행 장소는?</option>
                        <option value="animal">가장 좋아하는 동물 이름은?</option>
                        <option value="character">가장 좋아하는 캐릭터는?</option>
                    </select>
                </div>
                <div id="enroll-A">
                    <p>답변</p>
                    <input type="text" placeholder="비밀번호 찾기에 사용됩니다. 잘 기억해주세요!">
                </div>
                <div id="enroll-btn">
                    <input type="button" value="회원가입">
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function redirectToLogin() {
            window.location.href = '<c:url value="/login"/>'; // login 컨트롤러로 이동
        }
    </script>
</body>
</html>