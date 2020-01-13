var color = $("#box-one-color").text();

$(document).ready(function(){
    $("#change-color-button").click(function(){
        $("#first-div").css("background", color);
    });
});


$('#third-div').fadeIn("slow");

var clickButton = window.document.querySelector('#click-me');

function clicked() {
    alert("Clicked!");    
}

clickButton.addEventListener("click", clicked);