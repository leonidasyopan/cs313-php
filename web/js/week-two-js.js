/* Variables representing both buttons */
var clickButton = window.document.querySelector('#click-me');
var changeColorButton = window.document.querySelector('#change-color-button');

/* Function to alert when button is clicked. */
function clicked() {
    alert("Clicked!");    
}

/* Function to change color of div according to user's input*/
function changeDivColor() {
    var fistDiv = window.document.querySelector('#first-div');
    var inputInfo = window.document.querySelector('#box-one-color').value;

    fistDiv.style.backgroundColor = inputInfo;

}

/* Run functions when buttons are clicled */
clickButton.addEventListener("click", clicked);
changeColorButton.addEventListener("click", changeDivColor);