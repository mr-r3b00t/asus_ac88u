﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:v>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#756#> - <#316#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" language="JavaScript" src="/help.js"></script>
<script type="text/javascript" language="JavaScript" src="/validator.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/httpApi.js"></script>
<script>
var firewall_enable = '<% nvram_get("fw_enable_x"); %>';
var wItem = new Array(new Array("", "", "TCP"),
new Array("FTP", "20,21", "TCP"),
new Array("TELNET", "23", "TCP"),
new Array("SMTP", "25", "TCP"),
new Array("DNS", "53", "UDP"),
new Array("FINGER", "79", "TCP"),
new Array("HTTP", "80", "TCP"),
new Array("POP3", "110", "TCP"),
new Array("SNMP", "161", "UDP"),
new Array("SNMP TRAP", "162", "UDP"));
var ipv6_fw_rulelist_array = "<% nvram_char_to_ascii("","ipv6_fw_rulelist"); %>";
var overlib_str0 = new Array();
var overlib_str1 = new Array();
var overlib_str2 = new Array();
var overlib_str3 = new Array();
function initial(){
show_menu();
httpApi.faqURL("1031610", function(url){document.getElementById("faq").href=url;});
loadAppOptions();
showipv6_fw_rulelist();
change_firewall(firewall_enable);
if(WebDav_support){
hideAll(1);
}
}
function hideAll(_value){
/* not allow user to change HTTP/HTTPS port */
return false;
document.getElementById("st_webdav_mode_tr").style.display = (_value == 0) ? "none" : "";
document.getElementById("webdav_http_port_tr").style.display = (_value == 0) ? "none" : "";
document.getElementById("webdav_https_port_tr").style.display = (_value == 0) ? "none" : "";
if(_value != 0)
showPortItem(document.form.st_webdav_mode.value);
}
function showPortItem(_value){
if(_value == 0){
document.getElementById("webdav_http_port_tr").style.display = "";
document.form.webdav_http_port.disabled = false;
document.getElementById("webdav_https_port_tr").style.display = "none";
document.form.webdav_https_port.disabled = true;
}
else if(_value == 1){
document.getElementById("webdav_http_port_tr").style.display = "none";
document.form.webdav_http_port.disabled = true;
document.getElementById("webdav_https_port_tr").style.display = "";
document.form.webdav_https_port.disabled = false;
}
else{
document.getElementById("webdav_http_port_tr").style.display = "";
document.form.webdav_http_port.disabled = false;
document.getElementById("webdav_https_port_tr").style.display = "";
document.form.webdav_https_port.disabled = false;
}
}
function applyRule(){
inputRCtrl1(document.form.misc_ping_x, 1);
var rule_num = document.getElementById('ipv6_fw_rulelist_table').rows.length;
var item_num = document.getElementById('ipv6_fw_rulelist_table').rows[0].cells.length;
var tmp_value = "";
for(i=0; i<rule_num; i++){
tmp_value += "<"
for(j=0; j<item_num-1; j++){
if(document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[j].innerHTML.lastIndexOf("...")<0){
tmp_value += document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[j].innerHTML;
}else{
tmp_value += document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[j].title;
}
if(j != item_num-2)
tmp_value += ">";
}
}
if(tmp_value == "<"+"<#2027#>" || tmp_value == "<")
tmp_value = "";
document.form.ipv6_fw_rulelist.value = tmp_value;
showLoading();
document.form.submit();
}
function hideport(flag){
document.getElementById("accessfromwan_port").style.display = (flag == 1) ? "" : "none";
}
function done_validating(action){
refreshpage();
}
function loadAppOptions(){
free_options(document.form.KnownApps);
add_option(document.form.KnownApps, "<#646#>", 0, 1);
for(var i = 1; i < wItem.length; i++)
add_option(document.form.KnownApps, wItem[i][0], i, 0);
}
function change_wizard(o, id){
for(var i = 0; i < wItem.length; ++i){
if(wItem[i][0] != null && o.value == i){
if(wItem[i][2] == "TCP")
document.form.ipv6_fw_proto_x_0.options[0].selected = 1;
else if(wItem[i][2] == "UDP")
document.form.ipv6_fw_proto_x_0.options[1].selected = 1;
else if(wItem[i][2] == "BOTH")
document.form.ipv6_fw_proto_x_0.options[2].selected = 1;
else if(wItem[i][2] == "OTHER")
document.form.ipv6_fw_proto_x_0.options[3].selected = 1;
document.form.ipv6_fw_port_x_0.value = wItem[i][1];
document.form.ipv6_fw_desc_x_0.value = wItem[i][0]+" Server";
break;
}
}
}
function addRow(obj, head){
if(head == 1)
ipv6_fw_rulelist_array += "<"
else
ipv6_fw_rulelist_array += ">"
ipv6_fw_rulelist_array += obj.value;
obj.value = "";
}
function validForm(){
if(!Block_chars(document.form.ipv6_fw_desc_x_0, ["<" ,">" ,"'" ,"%"])){
return false;
}
if(!Block_chars(document.form.ipv6_fw_port_x_0, ["<" ,">"])){
return false;
}
if(document.form.ipv6_fw_proto_x_0.value=="OTHER"){
if (!check_multi_range(document.form.ipv6_fw_port_x_0, 1, 255, false))
return false;
}
if(!check_multi_range(document.form.ipv6_fw_port_x_0, 1, 65535, true)){
return false;
}
if(document.form.ipv6_fw_lipaddr_x_0.value==""){
alert("<#260#>");
document.form.ipv6_fw_lipaddr_x_0.focus();
document.form.ipv6_fw_lipaddr_x_0.select();
return false;
}
if(document.form.ipv6_fw_port_x_0.value==""){
alert("<#260#>");
document.form.ipv6_fw_port_x_0.focus();
document.form.ipv6_fw_port_x_0.select();
return false;
}
if(!validate_multi_range(document.form.ipv6_fw_port_x_0, 1, 65535)
|| !ipv6_valid(document.form.ipv6_fw_lipaddr_x_0, 0)
|| (document.form.ipv6_fw_ripaddr_x_0.value != "" && !ipv6_valid(document.form.ipv6_fw_ripaddr_x_0, 1))) {
return false;
}
return true;
}
function addRow_Group(upper){
if(validForm()){
if('<% nvram_get("ipv6_fw_enable"); %>' != "1")
document.form.ipv6_fw_enable[0].checked = true;
var rule_num = document.getElementById('ipv6_fw_rulelist_table').rows.length;
var item_num = document.getElementById('ipv6_fw_rulelist_table').rows[0].cells.length;
if(rule_num >= upper){
alert("<#2086#> " + upper + " <#2087#>");
return;
}
addRow(document.form.ipv6_fw_desc_x_0 ,1);
addRow(document.form.ipv6_fw_ripaddr_x_0, 0);
addRow(document.form.ipv6_fw_lipaddr_x_0, 0);
addRow(document.form.ipv6_fw_port_x_0, 0);
addRow(document.form.ipv6_fw_proto_x_0, 0);
document.form.ipv6_fw_proto_x_0.value="TCP";
showipv6_fw_rulelist();
}
}
function validate_multi_range(val, mini, maxi){
var rangere=new RegExp("^([0-9]{1,5})\:([0-9]{1,5})$", "gi");
if(rangere.test(val)){
if(!validator.eachPort(document.form.ipv6_fw_port_x_0, RegExp.$1, mini, maxi) || !validator.eachPort(document.form.ipv6_fw_port_x_0, RegExp.$2, mini, maxi)){
return false;
}else if(parseInt(RegExp.$1) >= parseInt(RegExp.$2)){
alert("<#273#>");
return false;
}else
return true;
}else{
if(!validate_single_range(val, mini, maxi)){
return false;
}
return true;
}
}
function validate_single_range(val, min, max) {
for(j=0; j<val.length; j++){ //is_number
if (val.charAt(j)<'0' || val.charAt(j)>'9'){
alert('<#275#> ' + min + ' <#276#> ' + max);
return false;
}
}
if(val < min || val > max) { //is_in_range
alert('<#275#> ' + min + ' <#276#> ' + max);
return false;
}else
return true;
}
var parse_port="";
function check_multi_range(obj, mini, maxi, allow_range){
obj.value = document.form.ipv6_fw_port_x_0.value.replace(/[-~]/gi,":"); // "~-" to ":"
var PortSplit = obj.value.split(",");
for(i=0;i<PortSplit.length;i++){
PortSplit[i] = PortSplit[i].replace(/(^\s*)|(\s*$)/g, ""); // "\space" to ""
PortSplit[i] = PortSplit[i].replace(/(^0*)/g, ""); // "^0" to ""
if(PortSplit[i] == "" ||PortSplit[i] == 0){
alert("<#2085#>");
obj.focus();
obj.select();
return false;
}
if(allow_range)
res = validate_multi_range(PortSplit[i], mini, maxi);
else
res = validate_single_range(PortSplit[i], mini, maxi);
if(!res){
obj.focus();
obj.select();
return false;
}
if(i ==PortSplit.length -1)
parse_port = parse_port + PortSplit[i];
else
parse_port = parse_port + PortSplit[i] + ",";
}
document.form.ipv6_fw_port_x_0.value = parse_port;
parse_port ="";
return true;
}
function edit_Row(r){
var i=r.parentNode.parentNode.rowIndex;
document.form.ipv6_fw_desc_x_0.value = document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[0].innerHTML;
document.form.ipv6_fw_ripaddr_x_0.value = document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[1].innerHTML;
document.form.ipv6_fw_lipaddr_x_0.value = document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[2].innerHTML;
document.form.ipv6_fw_port_x_0.value = document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[3].innerHTML;
document.form.ipv6_fw_proto_x_0.value = document.getElementById('ipv6_fw_rulelist_table').rows[i].cells[4].innerHTML;
del_Row(r);
}
function del_Row(r){
var i=r.parentNode.parentNode.rowIndex;
document.getElementById('ipv6_fw_rulelist_table').deleteRow(i);
var ipv6_fw_rulelist_value = "";
for(k=0; k<document.getElementById('ipv6_fw_rulelist_table').rows.length; k++){
for(j=0; j<document.getElementById('ipv6_fw_rulelist_table').rows[k].cells.length-1; j++){
if(j == 0)
ipv6_fw_rulelist_value += "<";
else
ipv6_fw_rulelist_value += ">";
if(document.getElementById('ipv6_fw_rulelist_table').rows[k].cells[j].innerHTML.lastIndexOf("...")<0){
ipv6_fw_rulelist_value += document.getElementById('ipv6_fw_rulelist_table').rows[k].cells[j].innerHTML;
}else{
ipv6_fw_rulelist_value += document.getElementById('ipv6_fw_rulelist_table').rows[k].cells[j].title;
}
}
}
ipv6_fw_rulelist_array = ipv6_fw_rulelist_value;
if(ipv6_fw_rulelist_array == "")
showipv6_fw_rulelist();
}
function showipv6_fw_rulelist(){
var ipv6_fw_rulelist_row = decodeURIComponent(ipv6_fw_rulelist_array).split('<');
var code = "";
code +='<table width="100%" cellspacing="0" cellpadding="4" align="center" class="list_table" id="ipv6_fw_rulelist_table">';
if(ipv6_fw_rulelist_row.length == 1)
code +='<tr><td style="color:#FFCC00;" colspan="6"><#2027#></td></tr>';
else{
for(var i = 1; i < ipv6_fw_rulelist_row.length; i++){
overlib_str0[i] ="";
overlib_str1[i] ="";
overlib_str2[i] ="";
overlib_str3[i] ="";
code +='<tr id="row'+i+'">';
var ipv6_fw_rulelist_col = ipv6_fw_rulelist_row[i].split('>');
var wid=[15, 24, 24, 14, 11];
for(var j = 0; j < ipv6_fw_rulelist_col.length; j++){
if(j==0){
if(ipv6_fw_rulelist_col[0].length >10){
overlib_str0[i] += ipv6_fw_rulelist_col[0];
ipv6_fw_rulelist_col[0]=ipv6_fw_rulelist_col[0].substring(0, 8)+"...";
code +='<td width="'+wid[j]+'%" title="'+overlib_str0[i]+'">'+ ipv6_fw_rulelist_col[0] +'</td>';
}else
code +='<td width="'+wid[j]+'%">'+ ipv6_fw_rulelist_col[j] +'</td>';
}else if(j==1){
if(ipv6_fw_rulelist_col[1].length >22){
overlib_str1[i] += ipv6_fw_rulelist_col[1];
ipv6_fw_rulelist_col[1]=ipv6_fw_rulelist_col[1].substring(0, 20)+"...";
code +='<td width="'+wid[j]+'%" title='+overlib_str1[i]+'>'+ ipv6_fw_rulelist_col[1] +'</td>';
}else
code +='<td width="'+wid[j]+'%">'+ ipv6_fw_rulelist_col[j] +'</td>';
}else if(j==2){
if(ipv6_fw_rulelist_col[2].length >22){
overlib_str2[i] += ipv6_fw_rulelist_col[2];
ipv6_fw_rulelist_col[2]=ipv6_fw_rulelist_col[2].substring(0, 20)+"...";
code +='<td width="'+wid[j]+'%" title='+overlib_str2[i]+'>'+ ipv6_fw_rulelist_col[2] +'</td>';
}else
code +='<td width="'+wid[j]+'%">'+ ipv6_fw_rulelist_col[j] +'</td>';
}else if(j==3){
if(ipv6_fw_rulelist_col[3].length >12){
overlib_str3[i] += ipv6_fw_rulelist_col[3];
ipv6_fw_rulelist_col[3]=ipv6_fw_rulelist_col[3].substring(0, 10)+"...";
code +='<td width="'+wid[j]+'%" title='+overlib_str3[i]+'>'+ ipv6_fw_rulelist_col[3] +'</td>';
}else
code +='<td width="'+wid[j]+'%">'+ ipv6_fw_rulelist_col[j] +'</td>';
}else{
code +='<td width="'+wid[j]+'%">'+ ipv6_fw_rulelist_col[j] +'</td>';
}
}
code +='<td width="12%"><!--input class="edit_btn" onclick="edit_Row(this);" value=""/-->';
code +='<input class="remove_btn" onclick="del_Row(this);" value=""/></td></tr>';
}
}
code +='</table>';
document.getElementById("ipv6_fw_rulelist_Block").innerHTML = code;
}
function ipv6_valid(obj, cidr){
var rangere_cidr=new RegExp("^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*(\/(\d|\d\d|1[0-1]\d|12[0-8]))$", "gi");
var rangere=new RegExp("^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*", "gi");
if((rangere.test(obj.value)) || (cidr == 1 && rangere_cidr.test(obj.value))) {;
return true;
}else{
alert(obj.value+" <#272#>");
obj.focus();
obj.select();
return false;
}
}
</script>
</head>
<body onload="initial();" onunLoad="return unload_body();" class="bg">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_BasicFirewall_Content.asp">
<input type="hidden" name="next_page" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="restart_firewall">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<input type="hidden" name="ipv6_fw_rulelist" value=''>
<table class="content" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="17">&nbsp;</td>
<td valign="top" width="202">
<div id="mainMenu"></div>
<div id="subMenu"></div>
</td>
<td valign="top">
<div id="tabMenu" class="submenuBlock"></div>
<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
<tr>
<td valign="top" >
<table width="760px" border="0" cellpadding="5" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top">
<div>&nbsp;</div>
<div class="formfonttitle"><#337#></div>
<div style="margin:10px 0 10px 5px;" class="splitLine"></div>
<div class="formfontdesc" style="font-size:14px;font-weight:bold;margin-top:10px;"><#316#></div>
<div class="formfontdesc"><#1757#></div>
<div class="formfontdesc" style="margin-top:-10px;">
<a id="faq" href="" target="_blank" style="font-family:Lucida Console;text-decoration:underline;">DoS Protection FAQ</a> </div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,6);"><#1764#></a></th>
<td>
<input type="radio" value="1" name="fw_enable_x" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_enable_x', '1')" <% nvram_match("fw_enable_x", "1", "checked"); %>><#176#>
<input type="radio" value="0" name="fw_enable_x" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_enable_x', '0')" <% nvram_match("fw_enable_x", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,7);"><#1762#></a></th>
<td>
<input type="radio" value="1" name="fw_dos_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_dos_x', '1')" <% nvram_match("fw_dos_x", "1", "checked"); %>><#176#>
<input type="radio" value="0" name="fw_dos_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_dos_x', '0')" <% nvram_match("fw_dos_x", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th align="right"><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,1);"><#1802#></a></th>
<td>
<select name="fw_log_x" class="input_option">
<option value="none" <% nvram_match("fw_log_x", "none","selected"); %>><#761#></option>
<option value="drop" <% nvram_match("fw_log_x", "drop","selected"); %>><#2404#></option>
<option value="accept" <% nvram_match("fw_log_x", "accept","selected"); %>><#2401#></option>
<option value="both" <% nvram_match("fw_log_x", "both","selected"); %>><#2402#></option>
</select>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,5);"><#1806#></a></th>
<td>
<input type="radio" value="1" name="misc_ping_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'misc_ping_x', '1')" <% nvram_match("misc_ping_x", "1", "checked"); %>><#176#>
<input type="radio" value="0" name="misc_ping_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'misc_ping_x', '0')" <% nvram_match("misc_ping_x", "0", "checked"); %>><#175#>
</td>
</tr>
<tr id="st_webdav_mode_tr" style="display:none;">
<th width="40%">Cloud Disk Configure</th>
<td>
<select name="st_webdav_mode" class="input_option" onChange="showPortItem(this.value);">
<option value="0" <% nvram_match("st_webdav_mode", "0", "selected"); %>>HTTP</option>
<option value="1" <% nvram_match("st_webdav_mode", "1", "selected"); %>>HTTPS</option>
<option value="2" <% nvram_match("st_webdav_mode", "2", "selected"); %>>BOTH</option>
</select>
</td>
</tr>
<tr id="webdav_http_port_tr" style="display:none;">
<th width="40%">Cloud Disk Port (HTTP):</th>
<td>
<input type="text" name="webdav_http_port" class="input_6_table" maxlength="5" value="<% nvram_get("webdav_http_port"); %>" onKeyPress="return validator.isNumber(this, event);" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr id="webdav_https_port_tr" style="display:none;">
<th width="40%">Cloud Disk Port (HTTPS):</th>
<td>
<input type="text" name="webdav_https_port" class="input_6_table" maxlength="5" value="<% nvram_get("webdav_https_port"); %>" onKeyPress="return validator.isNumber(this, event);" autocorrect="off" autocapitalize="off">
</td>
</tr>
</table>
<div class="formfontdesc" style="font-size:14px;font-weight:bold;margin-top:10px;"><#342#></div>
<div>
<div class="formfontdesc"><#1813#></div>
<div class="formfontdesc"><#1814#></div>
</div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" class="FormTable">
<thead>
<tr>
<td colspan="4"><#2778#></td>
</tr>
</thead>
<tr>
<th><#1812#></th>
<td>
<input type="radio" value="1" name="ipv6_fw_enable" <% nvram_match("ipv6_fw_enable", "1", "checked"); %>><#176#>
<input type="radio" value="0" name="ipv6_fw_enable" <% nvram_match("ipv6_fw_enable", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th><#2026#></th>
<td id="ipv6_fw_rulelist">
<select name="KnownApps" id="KnownApps" class="input_option" onchange="change_wizard(this, 'KnownApps');"></select>
</td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" class="FormTable_table">
<thead>
<tr>
<td colspan="7"><#1815#>&nbsp;(<#2203#>&nbsp;128)</td>
</tr>
</thead>
<tr>
<th><#1337#></th>
<th><#1816#></th>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,25);"><#2018#></a></th>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,24);"><#1782#></a></th>
<th><#2020#></th>
<th><#2202#></th>
</tr>
<tr>
<td width="15%">
<input type="text" maxlength="30" class="input_12_table" name="ipv6_fw_desc_x_0" onKeyPress="return is_alphanum(this, event)" autocorrect="off" autocapitalize="off"/>
</td>
<td width="24%">
<input type="text" maxlength="45" class="input_18_table" name="ipv6_fw_ripaddr_x_0" align="left" style="float:left;" autocomplete="off" autocorrect="off" autocapitalize="off">
</td>
<td width="24%">
<input type="text" maxlength="45" class="input_18_table" name="ipv6_fw_lipaddr_x_0" align="left" style="float:left;" autocomplete="off" autocorrect="off" autocapitalize="off">
</td>
<td width="14%">
<input type="text" maxlength="" class="input_12_table" name="ipv6_fw_port_x_0" onkeypress="return validator.isPortRange(this, event)" autocorrect="off" autocapitalize="off"/>
</td>
<td width="11%">
<select name="ipv6_fw_proto_x_0" class="input_option">
<option value="TCP">TCP</option>
<option value="UDP">UDP</option>
<option value="BOTH">BOTH</option>
<option value="OTHER">OTHER</option>
</select>
</td>
<td width="12%">
<input type="button" class="add_btn" onClick="addRow_Group(128);" name="ipv6_fw_rulelist2" value="">
</td>
</tr>
</table>
<div id="ipv6_fw_rulelist_Block"></div>
<div class="apply_gen">
<input name="button" type="button" class="button_gen" onclick="applyRule();" value="<#184#>"/>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</form>
</tr>
</table>
</td>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
<div id="footer"></div>
</body>
</html>

