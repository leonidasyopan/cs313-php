var profileImage = document.querySelector('#profile-image');

function zoomIn() {
    profileImage.style.transform = "scale(1.2)";
    profileImage.style.transition = "all 1s";
}

function zoomOut() {
    profileImage.style.transform = "scale(1)";
    profileImage.style.transition = "all 1s";
}

profileImage.addEventListener("mouseover", zoomIn);
profileImage.addEventListener("mouseleave", zoomOut);