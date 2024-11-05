<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AGIT</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/enrollForm_teacher.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/enrollForm_teacher-modal.css'/>">
</head>
<body>
    <div id="enrollForm-box">
        <div id="enroll-logo" onclick="redirectToLogin()" style="cursor: pointer;">
            <img src="<c:url value='/resources/img/logo.png'/>">
        </div>
        <div id="enroll-bar">
            선생님 회원가입
        </div>

        <div id="enrollForm-form">
            <form action="">
                <div id="enroll-type">
                    <input type="radio" id="teacher" name="choice" value="teacher" checked onclick="toggleVerification()">
                    <label for="teacher">선생님</label>
                    <input type="radio" id="manager" name="choice" value="manager" onclick="toggleVerification()">
                    <label for="manager">관리자</label>
                </div>
                <div id="enroll-find">
                    <p>학교찾기</p>
                    <input type="text" placeholder="학교코드 입력" autofocus>
                    <input type="button" value="학교찾기" onclick="openSchoolModal()">
                </div>
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
                <!-- 본인 확인 질문 및 답변 (기본적으로 숨김 처리) -->
                <div id="enroll-Q" style="display: none;">
                    <p>본인 확인 질문</p>
                    <select>
                        <option value="event">학교에서 가장 기억에 남는 행사는?</option>
                        <option value="place">학교에서 자주 방문하는 곳은 어디인가요?</option>
                        <option value="bestFood">학교 근처 자주 찾는 식당이나 장소는?</option>
                        <option value="firstBuy">첫 월급으로 산 물건은 무엇인가요?</option>
                        <option value="travel">가장 기억에 남는 여행지는 어디인가요?</option>
                    </select>
                </div>
                <div id="enroll-A" style="display: none;">
                    <p>답변</p>
                    <input type="text" placeholder="비밀번호 찾기에 사용됩니다. 잘 기억해주세요!">
                </div>
                <div id="enroll-btn">
                    <input type="button" value="회원가입">
                </div>
            </form>
        </div>

        <!-- 모달 -->
        <div id="noticeModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <div id="school-con">
                <div id="school-search">
                    <div id="school-info">
                        <div id="school-select">
                            <select id="region-select">
                                <option value="">지역 선택</option>
                            </select>
                            <select id="office-select">
                                <option value="">교육청 선택</option>
                            </select>
                            <div id="schoolName-search">
                                <input type="text" placeholder="학교명을 입력하세요">
                            </div>
                        </div>
                        <script src="./js/school-select.js"></script>
                    </div>
                    <div id="schoolSearch-btn">
                        <input type="button" value="검색">
                    </div>
                </div>
                </div>
                <div id="school-list">
                    <table>
                        <tr>
                            <th>학교명</th>
                            <th>주소</th>
                        </tr>
                        <tr>
                            <td>경기초등학교</td>
                            <td><a href="">서울특별시 서대문구 경기대로9길 10</a></td>
                        </tr>
                        <tr>
                            <td><a href="">경기초등학교</a></td>
                            <td>서울특별시 서대문구 경기대로9길 10</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <script>
            // 학교 검색 모달 열기
            function openSchoolModal() {
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

            function toggleVerification() {
            const teacherSelected = document.getElementById("teacher").checked;
            document.getElementById("enroll-Q").style.display = teacherSelected ? "block" : "none";
            document.getElementById("enroll-A").style.display = teacherSelected ? "block" : "none";
            }

            // 초기 호출
            toggleVerification();
        </script>
        <script>
        function redirectToLogin() {
            window.location.href = '<c:url value="/login"/>'; // login 컨트롤러로 이동
        }
    </script>
    </div>
</body>
</html>