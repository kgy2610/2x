// 모달 열기 및 닫기 함수
   function openUpdateModal() {
      document.getElementById('updateModal').style.display = 'flex';
   }

   function closeUpdateModal() {
      document.getElementById('updateModal').style.display = 'none';
   }

   // 정보 수정 폼에서 비밀번호 수정 폼으로 전환
   function switchToPwdForm() {
      document.getElementById('infoForm').style.display = 'none';
      document.getElementById('pwdForm').style.display = 'block';
      document.getElementById('modalTitle').textContent = "비밀번호 수정";
   }

   // 비밀번호 수정 폼에서 정보 수정 폼으로 전환
   function switchToInfoForm() {
      document.getElementById('pwdForm').style.display = 'none';
      document.getElementById('infoForm').style.display = 'block';
      document.getElementById('modalTitle').textContent = "정보 수정";
   }

   // 외부 클릭 시 모달 닫기
   window.onclick = function (event) {
      const updateModal = document.getElementById('updateModal');
      const imageSelectModal = document.getElementById('imageSelectModal');

      // 정보 수정 모달 외부 클릭 시 닫기
      if (event.target == updateModal) {
         closeUpdateModal();
      }

      // 이미지 선택 모달 외부 클릭 시 닫기
      if (event.target == imageSelectModal) {
         closeImageSelectModal();
      }
   }

   // 이미지 선택 모달 열기 및 닫기 함수
   function openImageSelectModal() {
      document.getElementById('imageSelectModal').style.display = 'flex';
   }

   function closeImageSelectModal() {
      document.getElementById('imageSelectModal').style.display = 'none';
   }

   // 이미지 선택 함수
   let selectedImage = null;

   function selectImage(img) {
      if (selectedImage) {
          selectedImage.classList.remove('selected');
      }
      selectedImage = img;
      selectedImage.classList.add('selected');
   }

   // 이미지 변경 함수
   function applyImageChange() {
      if (selectedImage) {
          const mainImage = document.querySelector('.student_myPage img');
          mainImage.src = selectedImage.src; 
          closeImageSelectModal();
      } else {
          alert("이미지를 선택하세요!");
      }
   }