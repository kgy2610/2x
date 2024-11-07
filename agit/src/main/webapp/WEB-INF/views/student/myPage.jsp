<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>agit</title>
   <link rel="stylesheet" href="<c:url value='/resources/css/student/student_myPage.css'/>">
</head>

<body>
   <jsp:include page="../common/student_munubar.jsp" />
   
   <div class="wrap">
      <div class="banner">
         <img src="<c:url value='/resources/img/student/myPageBanner.png'/>"">
         <table>
            <thead>
               <tr>
                  <td></td>
                  <td>오늘의 수업</td>
                  <td>내일의 수업</td>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>1교시</td>
                  <td>오늘1</td>
                  <td>내일1</td>
               </tr>
               <tr>
                  <td>2교시</td>
                  <td>오늘2</td>
                  <td>내일2</td>
               </tr>
               <tr>
                  <td>3교시</td>
                  <td>오늘3</td>
                  <td>내일3</td>
               </tr>
               <tr>
                  <td>4교시</td>
                  <td>오늘4</td>
                  <td>내일4</td>
               </tr>
               <tr>
                  <td>5교시</td>
                  <td>오늘5</td>
                  <td>내일5</td>
               </tr>
               <tr>
                  <td>6교시</td>
                  <td>오늘6</td>
                  <td>내일6</td>
               </tr>

            </tbody>
         </table>
      </div>

      <div class="student_myPage">
         <!-- 이미지 전체를 클릭하면 모달 열기 -->
         <div onclick="openImageSelectModal()">
           <img src="<c:url value='/resources/img/student/myPageImg.png'/>"">
         </div>
         <h4>푸른초등학교</h4>
         <p>1학년 5반 신서희</p>
         <p>담임선생님 : 김가영 선생님</p>
     </div>

      <div class="food">
         <img src="<c:url value='/resources/img/student/studentBook.png'/>"">
         <div class="food_left">
            <h4>오늘의 급식</h4>
            <p>자장면*메추리알</p>
            <p>미니밥</p>
            <p>계란실파국</p>
            <p>반달단무지</p>
            <p>찹살탕수육*후르츠소스</p>
            <p>배추김치</p>
            <p>방울토마토</p>
         </div>
         <div class="food_right">
            <h4>내일의 급식</h4>
            <p>자장면*메추리알</p>
            <p>미니밥</p>
            <p>계란실파국</p>
            <p>반달단무지</p>
            <p>찹살탕수육*후르츠소스</p>
            <p>배추김치</p>
            <p>방울토마토</p>
         </div>
      </div>

   </div>

   <!-- 정보수정모달 -->
   <!-- 정보수정 모달 -->
   <div id="updateModal" class="modal2">
      <div class="modal-content2">
         <h2 id="modalTitle">정보 수정</h2>
         <span class="close" onclick="closeUpdateModal()">&times;</span>
         <div id="modalForm">
            <!-- 기본 정보 수정 폼 -->
            <form id="infoForm">
               <table>
                  <tr>
                     <td>코드</td>
                     <td><input type="text" placeholder="102580102" readonly></td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <div>
                           <input type="text" placeholder="1"> 학년
                           <input type="text" placeholder="2"> 반
                           <input type="text" placeholder="15"> 번
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td>아이디</td>
                     <td><input type="text" placeholder="아이디"></td>
                  </tr>
               </table>
               <button type="button">수정하기</button>
               <button type="button" onclick="switchToPwdForm()">비밀번호 수정</button>
            </form>
            <!-- 비밀번호 수정 폼 (기본적으로 숨김) -->
            <form id="pwdForm" style="display: none;">
               <table>
                  <tr>
                     <td>기존 비밀번호</td>
                     <td><input type="password" placeholder="기존 비밀번호를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>수정 비밀번호</td>
                     <td><input type="password" placeholder="수정할 비밀번호를 입력하세요"></td>
                  </tr>
                  <tr>
                     <td>비밀번호 확인</td>
                     <td><input type="password"></td>
                  </tr>
               </table>
               <button type="button">비밀번호 수정하기</button>
               <button type="button" onclick="switchToInfoForm()">뒤로가기</button>
            </form>
         </div>
      </div>
   </div>

   <!-- 이미지 선택 모달 -->
   <div id="imageSelectModal" class="modal3">
      <div class="modal-content3">
         <span class="close" onclick="closeImageSelectModal()">&times;</span>
          <h2>이미지 선택</h2>
          
          <div class="image-grid">
              <img src="<c:url value='/resources/img/student/myPageImg1.png'/>" alt="이미지1" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg2.png'/>" alt="이미지2" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg3.png'/>" alt="이미지3" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg4.png'/>" alt="이미지4" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg5.png'/>" alt="이미지5" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg6.png'/>" alt="이미지6" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg7.png'/>" alt="이미지7" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg8.png'/>" alt="이미지8" onclick="selectImage(this)">
              <img src="<c:url value='/resources/img/student/myPageImg9.png'/>" alt="이미지9" onclick="selectImage(this)">
          </div>
          <button onclick="applyImageChange()">변경하기</button>
      </div>
  </div>

  <script src="<c:url value='/resources/js/student/myPage.js'/>"></script>
</body>

</html>