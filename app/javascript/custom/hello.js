console.log("Hello from custom/hello.js");
function showRegister(id){
    for (var i = 1; i <= 3; i++) {
        if (i == id) {
            document.getElementById("register" + i).style.display = "block";
        } else {
            document.getElementById("register" + i).style.display = "none";
        }
    }
}
$("#radio-id1").on("click", function(){
    console.log("radio1 clicked");
    showRegister(1);
});
$("#radio-id2").on("click", function(){
    console.log("radio2 clicked");
    showRegister(2);
});
$("#radio-id3").on("click", function(){
    console.log("radio3 clicked");
    showRegister(3);
});