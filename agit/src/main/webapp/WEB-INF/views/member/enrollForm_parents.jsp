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
    <link rel="stylesheet" href="<c:url value='/resources/css/enrollForm_parents-modal.css'/>">
</head>
<body>
    <div id="enrollForm-box">
        <div id="enroll-logo" onclick="redirectToLogin()" style="cursor: pointer;">
            <img src="<c:url value='/resources/img/logo.png'/>">
        </div>
        <div id="enroll-bar">
            부모님 회원가입
        </div>

        <div id="enrollForm-form">
            <form action="">
                <div id="enroll-name">
                    <p>이름</p>
                    <input type="text" placeholder="이름을 입력하세요." autofocus>
                </div>
                <div id="enroll-nickname">
                    <p>닉네임</p>
                    <input type="text" placeholder="이름을 입력하세요." autofocus>
                </div>
                <div id="enroll-id">
                    <p>아이디</p>
                    <input type="text" placeholder="자녀아이디 입력" autofocus>
                    <input type="button" value="자녀아이디 검색" onclick="openChildIdModal()">
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
                        <option value="entrance">아이가 입학할 때 기억에 남던 순간은?</option>
                        <option value="travel">가장 기억에 남는 여행지는?</option>
                        <option value="subject">가장 좋아했던 과목은?</option>
                        <option value="weather">결혼식날 날씨는 어땠나요??</option>
                        <option value="pet">키웠던 반려동물의 이름은?</option>
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

    <!-- 모달 -->
    <div id="noticeModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div id="kid-search">
                <div id="kid-info">
                    <div id="kid-name">
                        <p>자녀 이름</p>
                        <input type="text">
                    </div>
                    <div id="kid-phone">
                        <p>전화번호</p>
                        <input type="text" placeholder="(-)제외한 자녀 전화번호 입력">
                    </div>
                </div>
                <div id="kidSearch-btn">
                    <input type="button" value="검 색">
                </div>
            </div>
            <div id="kid-list">
                <table>
                    <tr>
                        <th>자녀 이름</th>
                        <th>반 / 번호</th>
                        <th>아이디 선택</th>
                    </tr>
                    <tr>
                        <td>신서희</td>
                        <td>매화반</td>
                        <td><a href="">tjgml1210</a></td>
                    </tr>
                    <tr>
                        <td>신서희</td>
                        <td>매화반</td>
                        <td><a href="">tjgml1210</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script>
        // 자녀 아이디 검색 모달 열기
        function openChildIdModal() {
            document.getElementById('noticeModal').style.display = 'block';
        }

        // 모달 닫기
        function closeModal() {
            document.getElementById('noticeModal').style.display = 'none';
        }

        // 모달 밖 클릭 시 닫기
        window.onclick = function(event) {
            var modal = document.getElementById('noticeModal');
            if (event.target == modal) {
                closeModal();
            }
        }
    </script>
    <script>
        function redirectToLogin() {
            window.location.href = '<c:url value="/login"/>'; // login 컨트롤러로 이동
        }
    </script>
</body>
</html>