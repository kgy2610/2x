<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AGIT</title>
    <link rel="stylesheet" href="./css/searchTeacher.css">
    <link rel="stylesheet" href="./css/searchTeacher-modal.css">
</head>
<body>
    <div id="searchTeacher-con">
        <div id="top-bar">
            <div class="bar-con searchName">
                <input type="text" placeholder="이름 검색">
                <img src="./img/searchImg.png" alt="검색">
            </div>
            <div class="bar-con btn-con requestList" onclick="requestList()">
                <input type="button" value="승인요청 목록">
                <img src="./img/requestList.png" alt="목록">
            </div>
            <div class="bar-con btn-con teacherInput" onclick="teacherAdd()">
                <input type="button" value="교직원 추가">
                <img src="./img/teacherInput.png" alt="추가">
            </div>
        </div>
        <div id="teacher-list">
            <table>
                <tr>
                    <th>이름</th>
                    <th>고유코드</th>
                    <th>삭제</th>
                </tr>
                <tr>
                    <td>신서희</td>
                    <td>개설된 반이 없습니다</td>
                    <td>
                        <input type="button" value="삭제" onclick="teacherDelete()">
                    </td>
                </tr>
                <tr>
                    <td>신서희</td>
                    <td>개설된 반이 없습니다</td>
                    <td>
                        <input type="button" value="삭제" onclick="teacherDelete()">
                    </td>
                </tr>
            </table>
        </div>

        <!-- 교직원 삭제 모달 -->
        <div id="deleteModal" class="modal">
            <div class="modal-delete">
                <span class="close" onclick="closeModal('deleteModal')">&times;</span>
                <div id="deleteTeacher-con">
                    <p>
                        신서희선생님을 <br>
                        삭제하시겠습니까?
                    </p>
                    <input type="button" value="삭제">
                </div>
            </div>
        </div>

        <!-- 승인 리스트 모달 -->
        <div id="listModal" class="modal">
            <div class="modal-list">
                <span class="close" onclick="closeModal('listModal')">&times;</span>
                <div id="requestList-con">
                    <div id="request-p">
                        <p>승인요청</p>
                    </div>
                    <div id="request-list">
                        <table>
                            <tr>
                                <th>이름</th>
                                <th>전화번호</th>
                                <th>승인</th>
                            </tr>
                            <tr>
                                <td>신서희</td>
                                <td>010-1234-5678</td>
                                <td>
                                    <input type="checkbox" value="request-check">
                                </td>
                            </tr>
                            <tr>
                                <td>신서희</td>
                                <td>010-1234-5678</td>
                                <td>
                                    <input type="checkbox" value="request-check">
                                </td>
                            </tr>
                        </table>
                        <div id="save-btn">
                            <input type="button" value="저장">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 교직원 추가 모달 -->
        <div id="addModal" class="modal">
            <div class="modal-add">
                <span class="close" onclick="closeModal('addModal')">&times;</span>
                <div id="teacherAdd-p">
                    <p>교직원 추가</p>
                </div>
                <div id="teacherAdd-Form">
                    <form action="">
                        <div id="addName">
                            <p>이름</p>
                            <input type="text" placeholder="이름을 입력하세요">
                        </div>
                        <div id="addCode">
                            <p>고유 코드</p>
                            <input type="text" placeholder="고유코드를 입력하세요">
                        </div>
                        <div id="addPhone">
                            <p>전화번호</p>
                            <input type="text" placeholder="전화번호를 입력하세요">
                        </div>
                        <div id="add-btn">
                            <input type="button" value="추가">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // 자녀 아이디 검색 모달 열기
            function teacherDelete() {
                document.getElementById('deleteModal').style.display = 'block';
            }

            // 모달 닫기
            function closeModal(modalId) {
                document.getElementById(modalId).style.display = 'none';
            }

            // 모달 밖 클릭 시 닫기
            window.onclick = function(event) {
                var deleteModal = document.getElementById('deleteModal');
                var listModal = document.getElementById('listModal');
                var addModal = document.getElementById('addModal')

                if (event.target === deleteModal) {
                    closeModal('deleteModal');
                } else if (event.target === listModal) {
                    closeModal('listModal');
                } else if(event.target === addModal){
                    closeModal('addModal');
                }
            }

            // 승인 리스트 모달 열기
            function requestList(){
                document.getElementById('listModal').style.display = 'block';
            }

            // 교직원 추가 모달 열기
            function teacherAdd(){
                document.getElementById('addModal').style.display = 'block';
            }
        </script>
    </div>
</body>
</html>