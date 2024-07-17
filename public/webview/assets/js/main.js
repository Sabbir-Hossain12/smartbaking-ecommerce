function openLgNav() {
    // document.getElementById("mySidepanel").style.top = "80px";
    // document.getElementById("mySidepanel").style.left = "5%";
    document.getElementById("mySidepanel").style.width = "300px";
    closesideMenu();
}

function openNav() {
    document.getElementById("mySidepanel").style.width = "280px";
    closesideMenu();
}

function closeNav() {
    document.getElementById("mySidepanel").style.width = "0";
}

function closelgNav() {
    document.getElementById("mySidepanel").style.width = "0";
}

function sideMenuOpen() {
    document.getElementById("SideMenu").style.width = "280px";
    closeNav();
}