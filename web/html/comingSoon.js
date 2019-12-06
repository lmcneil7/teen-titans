window.addEventListener('DOMContentLoaded',init,false);
            
function init() {
    alert('This page is under construction but if you click the button, you can change the background of the coming soon text on the page!');

var buttons = document.getElementsByTagName("button")
buttons[0].addEventListener('click', colorChange,false)
}

function colorChange() {
var h1 = document.getElementById("colorChange")
{h1.style.backgroundColor = "MediumTurquoise";}
} 

