function chkData(item, msg) {
    if ($(item).val().trim() === "") {
        alert(msg + " 입력해 주세요.");
        $(item).val("").focus();
        return false;
    }
    return true;
}