// 지역별 교육청 데이터
const educationOffices = {
    "서울/경기": ["서울특별시교육청", "경기도교육청"],
    "충청도": ["충청북도교육청", "충청남도교육청", "세종특별자치시교육청", "대전광역시교육청"],
    "경상도": ["부산광역시교육청", "대구광역시교육청", "경상북도교육청", "경상남도교육청", "울산광역시교육청"],
    "전라도": ["광주광역시교육청", "전북특별자치도교육청", "전라남도교육청"],
    "강원도": ["강원도교육청"],
    "제주도": ["제주특별자치도교육청"]
};

// 첫 번째 <select>에 지역 옵션 추가
const regionSelect = document.getElementById("region-select");
Object.keys(educationOffices).forEach(region => {
    const option = document.createElement("option");
    option.value = region;
    option.textContent = region;
    regionSelect.appendChild(option);
});

// 첫 번째 <select>에서 지역 선택 시, 두 번째 <select> 업데이트
regionSelect.addEventListener("change", function() {
    const selectedRegion = this.value;
    const officeSelect = document.getElementById("office-select");

    // 기존 옵션 초기화
    officeSelect.innerHTML = '<option value="">교육청 선택</option>';

    // 선택한 지역에 해당하는 교육청 옵션 추가
    if (selectedRegion && educationOffices[selectedRegion]) {
        educationOffices[selectedRegion].forEach(office => {
            const option = document.createElement("option");
            option.value = office;
            option.textContent = office;
            officeSelect.appendChild(option);
        });
    }
});