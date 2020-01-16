// Function to change the color of first div according to user input
$(document).ready(function(){
    $("#change-color-button").click(function(){        
        $("#first-div").css("background", $("#box-one-color").val());
    });
});

// Functioin to turn third div visibility on and off
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