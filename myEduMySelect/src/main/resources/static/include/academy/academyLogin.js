$(function() {
    $("#loginBtn").on("click", function() {      
        if (!chkData("#academyId","아이디를")) return;
        else if (!chkData("#academyPasswd","비밀번호를")) return;      
        else {          
            $("#loginForm").attr({
                "method":"post", 
                "action":"/useraAcount/login"      
            });                     
            $("#loginForm").submit();      
        }
    });
    
    $("#logoutBtn").on("click", function() {
        location.href = "/userAccount/logout"
    });
});
