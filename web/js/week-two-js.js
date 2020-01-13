var clickButton = window.document.querySelector('#click-me');
var changeColorButton = window.document.querySelector('#change-color-button');

function clicked() {
    alert("Clicked!");    
}

function changeDivColor() {
    var fistDiv = window.document.querySelector('#first-div');
    var inputInfo = window.document.querySelector('#box-one-color').value;

    fistDiv.style.backgroundColor = inputInfo;

}

clickButton.addEventListener("click", clicked);
changeColorButton.addEventListener("click", changeDivColor);