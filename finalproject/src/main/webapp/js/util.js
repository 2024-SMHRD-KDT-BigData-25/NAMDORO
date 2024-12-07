function search(event) {
    event.preventDefault(); // 폼 기본 동작(새로고침) 방지

    // 검색어 가져오기
    const query = document.getElementById("searchInput").value.trim().toLowerCase();

    // 모든 .gallary-detail 요소 가져오기
    const galleryItems = document.querySelectorAll(".gallary-detail");

    // 검색어 포함 여부 확인 및 표시/숨기기
    galleryItems.forEach(item => {
        const title = item.querySelector(".title").textContent.toLowerCase(); // getTL_NAME 값
        if (title.includes(query)) {
            item.style.display = "block"; // 검색어가 포함된 경우 표시
        } else {
            item.style.display = "none"; // 검색어가 포함되지 않은 경우 숨김
        }
    });
}