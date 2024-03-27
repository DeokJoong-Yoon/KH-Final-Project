$(function() {
    $("#loginBtn").on("click", function() {      
        if (!chkData("#personalId","아이디를")) return;
        else if (!chkData("#personalPasswd","비밀번호를")) return;      
        else {          
            $("#loginForm").attr({
                "method":"post", 
                "action":"/personal/login"      
            });                     
            $("#loginForm").submit();      
        } 
    }); 
    
   $(document).ready(function() {
    $("#logoutBtn").on("click", function() {
        $.post("/personal/logout", function() {
            window.location.href = "/loginselect"; 
        });
    });
});
}); 