﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title>Del New Account</title>
<link rel="stylesheet" href="../form_style.css" type="text/css">
<script type="text/javascript" src="../state.js"></script>
<script type="text/javascript">
var selectedAccount = parent.getSelectedAccount();
function initial(){
showtext(document.getElementById("selected_account"), htmlEnDeCode.htmlEncode(decodeURIComponent(selectedAccount)));
document.deleteAccountForm.Cancel.focus();
clickevent();
}
function clickevent(){
document.getElementById("Submit").onclick = function(){
document.getElementById("account").value = decodeURIComponent(selectedAccount);
parent.showLoading();
document.deleteAccountForm.submit();
parent.hidePop("apply");
};
document.getElementById("Cancel").onclick = function(){
parent.hidePop('OverlayMask');
};
}
</script>
</head>
<body onLoad="initial();">
<form method="post" name="deleteAccountForm" action="delete_account.asp" target="hidden_frame">
<input name="account" id="account" type="hidden" value="">
<table width="80%" class="popTable" border="0" align="center" cellpadding="0" cellspacing="0">
<thead>
<tr>
<td><span style="color:#FFF"><#1474#>: </span><span style="color:#FFF" id="selected_account"></span><img src="../images/button-close.gif" onClick="parent.hidePop('OverlayMask');"></td>
</tr>
</thead>
<tbody>
<tr>
<td height="80" class="hint_word"><#1473#></td>
</tr>
</tbody>
<tr>
<td height="30" align="right">
<input id="Submit" type="button" class="button_gen" value="<#1417#>">
<input id="Cancel" type="button" class="button_gen" value="<#186#>">
</td>
</tr>
</table>
</form>
</body>
</html>

