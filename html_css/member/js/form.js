//로그인 페이지 로고눌렀을 때 로그인페이지로 돌아가기
function redirectToLogin() {
   window.location.href = '<c:url value="/login"/>';
}

//폼 입력시 모든 input이 채워지지 않았을 때 alert
function validateForm() {
   // 모든 input 요소를 가져옵니다.
   const inputs = document.querySelectorAll('form input');
   
   // 모든 입력 필드가 채워졌는지 확인
   for (let i = 0; i < inputs.length; i++) {
       if (inputs[i].value.trim() === '') {
           alert("모든 내용을 작성해주세요.");
           return false; // 폼 제출을 막고 경고창을 띄운 후 제출하지 않음
       }
   }
   return true; // 모든 필드가 채워지면 폼 제출
}