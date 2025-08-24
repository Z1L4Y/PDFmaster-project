function CodeHeader(header) {
    const Header = document.getElementsByName("CodeHeader");
    const Textarea = document.getElementsByClassName("DisplayCode");
    for (var i = 0; i < Header.length; i++) {
        Header[i].style.background = "none";
        Textarea[i].style.display = "none";
    }
    if (header == 3) {
        Textarea[header].style.width = "100%";
    }
    if (header != 3) {
        Header[header].style.backgroundColor = "#4e4e4ec9";
        Textarea[3].style.display = "none";
    }
    Textarea[header].style.display = "block";
    Textarea[header].style.zIndex = 1;
    
}
function CodeHeaderHover(header) {
    var Header = document.getElementsByName("CodeHeader");
    if (Header[header].style.backgroundColor != "rgba(78, 78, 78, 0.79)") {
        Header[header].style.backgroundColor = "#4e4e4eff";
    }
}
function CodeHeaderHoverOut(header) {
    var Header = document.getElementsByName("CodeHeader");
    if (Header[header].style.backgroundColor != "rgba(78, 78, 78, 0.79)") {
        Header[header].style.background = "none";
    }
}


function ChnageDisplay(number) {
    var buttons = document.getElementsByClassName("SideInformationBG");
    var displays = document.getElementsByClassName("displays");

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].style.color = "#686868";
        buttons[i].style.background = "none";
        displays[i].style.display = "none";
    }

    buttons[number].style.color = "white";
    buttons[number].style.backgroundColor = "#92B4EC";
    displays[number].style.display = "block";
}