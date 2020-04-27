function start () {
    scroll();
    init();
}
window.onload = start;
function scroll() {
    window.onscroll = function () {
        myFunction()
    };
    
    var navbar = document.getElementById("navbar");
    var sticky = navbar.offsetTop;
    
    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky")
        } else {
            navbar.classList.remove("sticky");
        }
    }
}
function init() {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "ROBtoggle": {
            var chars = document.getElementsByClassName("robin");
            for (var i = 0; i < chars.length; i++) {
                chars[i].classList.toggle("on")
            }
        };
        break;
        case "BBtoggle": {
            var places = document.getElementsByClassName("beastBoy");
            for (var i = 0; i < places.length; i++) {
                places[i].classList.toggle("on")
            }
        };
        break;
        case "CYtoggle": {
            var objects = document.getElementsByClassName("cyborg");
            for (var i = 0; i < objects.length; i++) {
                objects[i].classList.toggle("on")
            }
        };
        break;
        case "RAVtoggle": {
            var objects = document.getElementsByClassName("raven");
            for (var i = 0; i < objects.length; i++) {
                objects[i].classList.toggle("on")
            }
        };
        break;
        case "STARtoggle": {
            var objects = document.getElementsByClassName("starfire");
            for (var i = 0; i < objects.length; i++) {
                objects[i].classList.toggle("on")
            }
        };
        break;
    }
  }