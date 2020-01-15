/* 
var color = window.document.querySelector('#box-one-color').value;

$(document).ready(function(){
    $("#change-color-button").click(function(){
        $("#first-div").css("background", 'color');
    });
});
*/

$(document).ready(function(){
    $("#fade-button").click(function(){
        if ($("#third-div").is(":visible")) {
            $("#third-div").fadeOut(1000);        
        } else {
            $("#third-div").fadeIn(1000);
            
        }
    });
});

var clickButton = window.document.querySelector('#click-me');

function clicked() {
    alert("Clicked!");    
}

clickButton.addEventListener("click", clicked);