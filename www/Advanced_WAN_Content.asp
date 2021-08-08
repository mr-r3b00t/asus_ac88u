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
<title><#756#> - <#327#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<style>
.FormTable{
margin-top:10px;
}
</style>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script type="text/javascript" src="/validator.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/httpApi.js"></script>
<script>
var wans_dualwan = '<% nvram_get("wans_dualwan"); %>';
var nowWAN = '<% get_parameter("flag"); %>';
var original_switch_wantag = '<% nvram_get("switch_wantag"); %>';
var original_switch_stb_x = '<% nvram_get("switch_stb_x"); %>';
var original_wan_dot1q = '<% nvram_get("wan_dot1q"); %>';
var original_wan_vid = '<% nvram_get("wan_vid"); %>';
if(dualWAN_support && ( wans_dualwan.search("wan") >= 0 || wans_dualwan.search("lan") >= 0)){
var wan_type_name = wans_dualwan.split(" ")[<% nvram_get("wan_unit"); %>].toUpperCase();
switch(wan_type_name){
case "DSL":
location.href = "Advanced_DSL_Content.asp";
break;
case "USB":
if(based_modelid == "4G-AC53U" || based_modelid == "4G-AC55U" || based_modelid == "4G-AC68U")
location.href = "Advanced_MobileBroadband_Content.asp";
else{
if(based_modelid != "BRT-AC828"){
location.href = "Advanced_Modem_Content.asp";
}
}
break;
default:
break;
}
}
<% login_state_hook(); %>
<% wan_get_parameter(); %>
var wan_proto_orig = '<% nvram_get("wan_proto"); %>';
var original_wan_type = wan_proto_orig;
var original_wan_dhcpenable = parseInt('<% nvram_get("wan_dhcpenable_x"); %>');
var original_dnsenable = parseInt('<% nvram_get("wan_dnsenable_x"); %>');
var original_ppp_echo = parseInt('<% nvram_get("wan_ppp_echo"); %>');
var default_ppp_echo = parseInt('<% nvram_default_get("wan_ppp_echo"); %>');
var wan_unit_flag = '<% nvram_get("wan_unit"); %>';
if(yadns_support){
var yadns_enable = '<% nvram_get("yadns_enable_x"); %>';
var yadns_mode = '<% nvram_get("yadns_mode"); %>';
}
if(dnspriv_support){
var dnspriv_rulelist_array = '<% nvram_get("dnspriv_rulelist"); %>';
}
var pppoe_username = decodeURIComponent('<% nvram_char_to_ascii("", "wan_pppoe_username"); %>');
var pppoe_password = decodeURIComponent('<% nvram_char_to_ascii("", "wan_pppoe_passwd"); %>');
function initial(){
if(!dualWAN_support){
if(wan_unit_flag == 1){
document.wanUnit_form.wan_unit.value = 0;
document.wanUnit_form.target = "";
document.wanUnit_form.submit();
}
}else{
if('<% nvram_get("wan_unit"); %>' == usb_index){
change_notusb_unit();
}
}
show_menu();
httpApi.faqURL("1011715", function(url){document.getElementById("faq").href=url;});
change_wan_type(document.form.wan_proto.value, 0);
fixed_change_wan_type(document.form.wan_proto.value);
genWANSoption();
var wan_type = document.form.wan_proto.value;
if(wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp" ||
document.form.wan_auth_x.value != ""){
document.form.wan_pppoe_username.value = pppoe_username;
document.form.wan_pppoe_passwd.value = pppoe_password;
}
if(dnspriv_support){
inputCtrl(document.form.dnspriv_enable, 1);
change_dnspriv_enable(document.form.dnspriv_enable.value);
}
else{
inputCtrl(document.form.dnspriv_enable, 0);
change_dnspriv_enable(0);
}
if(yadns_support){
if(yadns_enable != 0 && yadns_mode != -1){
document.getElementById("yadns_hint").style.display = "";
document.getElementById("yadns_hint").innerHTML = "<span><#3426#></span>";
if(dnspriv_support){
document.getElementById("yadns_hint_dnspriv").style.display = "";
document.getElementById("yadns_hint_dnspriv").innerHTML = "<span><#3426#></span>";
}
}
}
if(gobi_support){
document.getElementById("page_title").innerHTML = "<#3153#>";
document.getElementById("wan_inf_th").innerHTML = "<#3148#>";
}
if(productid == "DSL-AC68U" || productid == "DSL-AC68R") //MODELDEP: DSL-AC68U,DSL-AC68R
showhide("dot1q_setting",1);
else
showhide("dot1q_setting",0);
if(productid == "BRT-AC828" || productid == "RT-AD7200"){ //MODELDEP: BRT-AC828, RT-AD7200
var wan_type_name = wans_dualwan.split(" ")[<% nvram_get("wan_unit"); %>].toUpperCase();
if((original_switch_wantag == "none" && original_switch_stb_x != "0") ||
(original_switch_wantag != "none") || (wan_type_name != "WAN" && wan_type_name != "WAN2")){
document.form.wan_dot1q.value = "0";
showhide("wan_dot1q_setting",0);
}else{
showhide("wan_dot1q_setting",1);
}
}else{
document.form.wan_dot1q.value = "0";
showhide("wan_dot1q_setting",0);
}
}
function change_notusb_unit(){
document.wanUnit_form.wan_unit.value = (usb_index+1)%2;
FormActions("apply.cgi", "change_wan_unit", "", "");
document.wanUnit_form.target = "";
document.wanUnit_form.submit();
location.herf = document.wanUnit_form.current_page.value;
}
var dsltmp_transmode = "<% nvram_get("dsltmp_transmode"); %>";
function change_wan_unit(obj){
if(!dualWAN_support) return;
if(obj.options[obj.selectedIndex].text == "DSL"){
if(dsltmp_transmode == "atm")
document.form.current_page.value = "Advanced_DSL_Content.asp";
else //ptm
document.form.current_page.value = "Advanced_VDSL_Content.asp";
}else if(document.form.dsltmp_transmode){
document.form.dsltmp_transmode.style.display = "none";
}
if(obj.options[obj.selectedIndex].text == "USB") {
document.form.current_page.value = "Advanced_Modem_Content.asp";
}else if(obj.options[obj.selectedIndex].text == "WAN"
|| obj.options[obj.selectedIndex].text == "WAN2"
|| obj.options[obj.selectedIndex].text == "Ethernet LAN"
|| obj.options[obj.selectedIndex].text == "Ethernet WAN"){
if((wans_dualwan == "wan lan" || wans_dualwan == "lan wan")
|| (wans_dualwan == "wan2 wan" || wans_dualwan == "wan wan2")
|| (wans_dualwan == "wan2 lan" || wans_dualwan == "lan wan2")){
if(obj.selectedIndex != wan_unit_flag){
document.form.wan_unit.value = obj.selectedIndex;
}
else{
return false;
}
}
else{
return false;
}
}
else if(obj.options[obj.selectedIndex].text == "<#2308#>"){
document.form.current_page.value = "Advanced_MobileBroadband_Content.asp";
}
FormActions("apply.cgi", "change_wan_unit", "", "");
document.form.target = "";
document.form.submit();
}
function genWANSoption(){
for(i=0; i<wans_dualwan.split(" ").length; i++){
var wans_dualwan_NAME = wans_dualwan.split(" ")[i].toUpperCase();
if(wans_dualwan_NAME == "LAN" &&
(productid == "DSL-N55U" || productid == "DSL-N55U-B" || productid == "DSL-AC68U" || productid == "DSL-AC68R"))
wans_dualwan_NAME = "Ethernet WAN";
else if(wans_dualwan_NAME == "LAN")
wans_dualwan_NAME = "Ethernet LAN";
else if(wans_dualwan_NAME == "USB" && (based_modelid == "4G-AC53U" || based_modelid == "4G-AC55U" || based_modelid == "4G-AC68U"))
wans_dualwan_NAME = "<#2308#>";
document.form.wan_unit.options[i] = new Option(wans_dualwan_NAME, i);
if(based_modelid == "GT-AXY16000" || based_modelid == "RT-AX89U"){
if(wans_dualwan_NAME == "WAN2")
document.form.wan_unit.options[i] = new Option("10G base-T", i);
else if(wans_dualwan_NAME == "SFP+")
document.form.wan_unit.options[i] = new Option("10G SFP+", i);
}
}
document.form.wan_unit.selectedIndex = '<% nvram_get("wan_unit"); %>';
if(wans_dualwan.search(" ") < 0 || wans_dualwan.split(" ")[1] == 'none' || !dualWAN_support)
document.getElementById("WANscap").style.display = "none";
}
function applyRule(){
if(ctf.dhcpToPppoe() && ctf.getLevel() == 2){
if(confirm("<#1407#>")){
document.form.ctf_disable_force.value = 0;
document.form.ctf_fa_mode.value = 0;
FormActions("start_apply.htm", "apply", "reboot", "<% get_default_reboot_time(); %>");
}
else{
return false;
}
}
if(productid != "DSL-AC68U" && productid != "DSL-AC68R"){ //MODELDEP: DSL-AC68U,DSL-AC68R
document.form.ewan_dot1q[0].disabled = true;
document.form.ewan_dot1q[1].disabled = true;
document.form.ewan_vid.disabled = true;
document.form.ewan_dot1p.disabled = true;
}
if(productid == "BRT-AC828" || productid == "RT-AD7200"){ //MODELDEP: BRT-AC828,RT-AD7200
if(original_wan_dot1q != document.form.wan_dot1q.value || original_wan_vid != document.form.wan_vid.value)
FormActions("start_apply.htm", "apply", "reboot", "<% get_default_reboot_time(); %>");
}else{
document.form.wan_dot1q[0].disabled = true;
document.form.wan_dot1q[1].disabled = true;
document.form.wan_vid.disabled = true;
}
if(validForm()){
showLoading();
inputCtrl(document.form.wan_dhcpenable_x[0], 1);
inputCtrl(document.form.wan_dhcpenable_x[1], 1);
if(!document.form.wan_dhcpenable_x[0].checked){
inputCtrl(document.form.wan_ipaddr_x, 1);
inputCtrl(document.form.wan_netmask_x, 1);
inputCtrl(document.form.wan_gateway_x, 1);
}
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
if(!document.form.wan_dnsenable_x[0].checked){
inputCtrl(document.form.wan_dns1_x, 1);
inputCtrl(document.form.wan_dns2_x, 1);
}
if(dnspriv_support){
if(document.form.dnspriv_enable.value == 1){
var dnspriv_rulelist_value = "";
for(k=0; k<document.getElementById('dnspriv_rulelist_table').rows.length; k++){
for(j=0; j<document.getElementById('dnspriv_rulelist_table').rows[k].cells.length-1; j++){
if(j == 0)
dnspriv_rulelist_value += "<";
else
dnspriv_rulelist_value += ">";
dnspriv_rulelist_value += document.getElementById('dnspriv_rulelist_table').rows[k].cells[j].innerHTML;
}
}
document.form.dnspriv_rulelist.disabled = false;
document.form.dnspriv_rulelist.value = dnspriv_rulelist_value;
}
document.form.action_script.value += ";restart_stubby";
}
document.form.submit();
}
}
var ctf = {
disable_force: '<% nvram_get("ctf_disable"); %>',
fa_mode: '<% nvram_get("ctf_fa_mode"); %>',
dhcpToPppoe: function(){
if((document.form.wan_proto.value == 'dhcp' || document.form.wan_proto.value == 'static') &&
(wan_proto_orig == "pppoe" || wan_proto_orig == "pptp" || wan_proto_orig == "l2tp"))
return false;
else if((document.form.wan_proto.value == "pppoe" || document.form.wan_proto.value == "pptp" || document.form.wan_proto.value == "l2tp") &&
(wan_proto_orig == 'dhcp' || wan_proto_orig == 'static'))
return true;
return false;
},
getLevel: function(){
var curVal;
if(ctf.disable_force == '0' && ctf.fa_mode == '0')
curVal = 1;
else if(ctf.disable_force == '0' && ctf.fa_mode == '2')
curVal = 2;
else
curVal = 0;
return curVal;
}
}
function valid_IP(obj_name, obj_flag){
var A_class_start = inet_network("1.0.0.0");
var A_class_end = inet_network("126.255.255.255");
var B_class_start = inet_network("127.0.0.0");
var B_class_end = inet_network("127.255.255.255");
var C_class_start = inet_network("128.0.0.0");
var C_class_end = inet_network("255.255.255.255");
var ip_obj = obj_name;
var ip_num = inet_network(ip_obj.value);
if(obj_flag == "DNS" && ip_num == -1){ //DNS allows to input nothing
return true;
}
if(obj_flag == "GW" && ip_num == -1){ //GW allows to input nothing
return true;
}
if(ip_num > A_class_start && ip_num < A_class_end){
obj_name.value = ipFilterZero(ip_obj.value);
return true;
}
else if(ip_num > B_class_start && ip_num < B_class_end){
alert(ip_obj.value+" <#272#>");
ip_obj.focus();
ip_obj.select();
return false;
}
else if(ip_num > C_class_start && ip_num < C_class_end){
obj_name.value = ipFilterZero(ip_obj.value);
return true;
}
else{
alert(ip_obj.value+" <#272#>");
ip_obj.focus();
ip_obj.select();
return false;
}
}
function validForm(){
var wan_type = document.form.wan_proto.value;
if(!document.form.wan_dhcpenable_x[0].checked){// Set IP address by userself
if(!valid_IP(document.form.wan_ipaddr_x, "")) return false; //WAN IP
if(!valid_IP(document.form.wan_gateway_x, "GW"))return false; //Gateway IP
if(document.form.wan_gateway_x.value == document.form.wan_ipaddr_x.value){
document.form.wan_ipaddr_x.focus();
alert("<#242#>");
return false;
}
var default_netmask = "";
var wrong_netmask = 0;
var netmask_obj = document.form.wan_netmask_x;
var netmask_num = inet_network(netmask_obj.value);
if(netmask_num==0){
var netmask_reverse_num = 0; //Viz 2011.07 : Let netmask 0.0.0.0 pass
}else{
var netmask_reverse_num = ~netmask_num;
}
if(netmask_num < 0) wrong_netmask = 1;
var test_num = netmask_reverse_num;
while(test_num != 0){
if((test_num+1)%2 == 0)
test_num = (test_num+1)/2-1;
else{
wrong_netmask = 1;
break;
}
}
if(wrong_netmask == 1){
alert(netmask_obj.value+" <#272#>");
netmask_obj.value = default_netmask;
netmask_obj.focus();
netmask_obj.select();
return false;
}
}
if(document.form.wan_dnsenable_x[1].checked == true && document.form.wan_proto.value != "dhcp" && document.form.wan_dns1_x.value == "" && document.form.wan_dns2_x.value == ""){
document.form.wan_dns1_x.focus();
alert("<#2038#>");
return false;
}
if(!document.form.wan_dnsenable_x[0].checked){
if(!valid_IP(document.form.wan_dns1_x, "DNS")) return false; //DNS1
if(!valid_IP(document.form.wan_dns2_x, "DNS")) return false; //DNS2
}
if(wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp" ||
document.form.wan_auth_x.value != ""){
if(document.form.wan_pppoe_username.value.length <= 0){
alert("<#702#>");
document.form.wan_pppoe_username.focus();
return false;
}
if(!validator.string(document.form.wan_pppoe_username)){
document.form.wan_pppoe_username.focus();
return false;
}
if(document.form.wan_pppoe_passwd.value.length <= 0){
alert("<#702#>");
document.form.wan_pppoe_passwd.focus();
return false;
}
if(!validator.string(document.form.wan_pppoe_passwd)){
document.form.wan_pppoe_passwd.focus();
return false;
}
}
if(wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp"){
if(!validator.numberRange(document.form.wan_pppoe_idletime, 0, 4294967295))
return false;
}
if(wan_type == "pppoe"){
if(!validator.numberRange(document.form.wan_pppoe_mtu, 576, 1492)
|| !validator.numberRange(document.form.wan_pppoe_mru, 576, 1492))
return false;
if(!validator.string(document.form.wan_pppoe_service)
|| !validator.string(document.form.wan_pppoe_ac))
return false;
if(!validator.hex(document.form.wan_pppoe_hostuniq)) {
alert("Host-uniq should be hexadecimal digits.");
document.form.wan_pppoe_hostuniq.focus();
document.form.wan_pppoe_hostuniq.select();
return false;
}
}
if(productid == "DSL-AC68U" || productid == "DSL-AC68R"){ //MODELDEP: DSL-AC68U,DSL-AC68R
if(document.form.ewan_dot1q.value == 1) {
if(!validator.range(document.form.ewan_vid, 1, 4094)) {
document.form.ewan_vid.focus();
return false;
}
if((document.form.ewan_vid.value >= 1 && document.form.ewan_vid.value <= 3) ||
(document.form.ewan_vid.value >= 3880 && document.form.ewan_vid.value <= 3887)){
alert("VLAN ID " + document.form.ewan_vid.value + " is reserved for internal usage. Please change to another one."); /* untranslated */
document.form.ewan_vid.focus();
return false;
}
if(!validator.range(document.form.ewan_dot1p, 0, 7)) {
document.form.ewan_dot1p.focus();
return false;
}
}
}
if(document.form.wan_hostname.value.length > 0){
var alert_str = validator.domainName(document.form.wan_hostname);
if(alert_str != ""){
showtext(document.getElementById("alert_msg1"), alert_str);
document.getElementById("alert_msg1").style.display = "";
document.form.wan_hostname.focus();
document.form.wan_hostname.select();
return false;
}else{
document.getElementById("alert_msg1").style.display = "none";
}
document.form.wan_hostname.value = trim(document.form.wan_hostname.value);
}
if(document.form.wan_hwaddr_x.value.length > 0)
if(!check_macaddr(document.form.wan_hwaddr_x,check_hwaddr_flag(document.form.wan_hwaddr_x))){
document.form.wan_hwaddr_x.select();
document.form.wan_hwaddr_x.focus();
return false;
}
if(document.form.wan_heartbeat_x.value.length > 0)
if(!validator.string(document.form.wan_heartbeat_x))
return false;
return true;
}
function done_validating(action){
refreshpage();
}
function change_wan_type(wan_type, flag){
if(typeof(flag) != "undefined")
change_wan_dhcp_enable(flag);
else
change_wan_dhcp_enable(1);
if(wan_type == "pppoe"){
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
inputCtrl(document.form.wan_auth_x, 0);
inputCtrl(document.form.wan_pppoe_username, 1);
inputCtrl(document.form.wan_pppoe_passwd, 1);
inputCtrl(document.form.wan_pppoe_idletime, 1);
inputCtrl(document.form.wan_pppoe_idletime_check, 1);
inputCtrl(document.form.wan_pppoe_mtu, 1);
inputCtrl(document.form.wan_pppoe_mru, 1);
inputCtrl(document.form.wan_pppoe_service, 1);
inputCtrl(document.form.wan_pppoe_ac, 1);
inputCtrl(document.form.wan_pppoe_hostuniq, 1);
inputCtrl(document.form.dhcpc_mode, 0);
inputCtrl(document.form.wan_pppoe_options_x, 1);
inputCtrl(document.form.wan_pptp_options_x, 0);
inputCtrl(document.form.wan_heartbeat_x, 0);
document.getElementById("vpn_dhcp").style.display = "";
inputCtrl(document.form.wan_ppp_echo, 1);
ppp_echo_control();
}
else if(wan_type == "pptp"){
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
inputCtrl(document.form.wan_auth_x, 0);
inputCtrl(document.form.wan_pppoe_username, 1);
inputCtrl(document.form.wan_pppoe_passwd, 1);
inputCtrl(document.form.wan_pppoe_idletime, 1);
inputCtrl(document.form.wan_pppoe_idletime_check, 1);
inputCtrl(document.form.wan_pppoe_mtu, 0);
inputCtrl(document.form.wan_pppoe_mru, 0);
inputCtrl(document.form.wan_pppoe_service, 0);
inputCtrl(document.form.wan_pppoe_ac, 0);
inputCtrl(document.form.wan_pppoe_hostuniq, 0);
inputCtrl(document.form.dhcpc_mode, 0);
inputCtrl(document.form.wan_pppoe_options_x, 1);
inputCtrl(document.form.wan_pptp_options_x, 1);
inputCtrl(document.form.wan_heartbeat_x, 1);
document.getElementById("vpn_dhcp").style.display = "none";
inputCtrl(document.form.wan_ppp_echo, 1);
ppp_echo_control();
}
else if(wan_type == "l2tp"){
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
inputCtrl(document.form.wan_auth_x, 0);
inputCtrl(document.form.wan_pppoe_username, 1);
inputCtrl(document.form.wan_pppoe_passwd, 1);
inputCtrl(document.form.wan_pppoe_idletime, 0);
inputCtrl(document.form.wan_pppoe_idletime_check, 0);
inputCtrl(document.form.wan_pppoe_mtu, 0);
inputCtrl(document.form.wan_pppoe_mru, 0);
inputCtrl(document.form.wan_pppoe_service, 0);
inputCtrl(document.form.wan_pppoe_ac, 0);
inputCtrl(document.form.wan_pppoe_hostuniq, 0);
inputCtrl(document.form.dhcpc_mode, 0);
inputCtrl(document.form.wan_pppoe_options_x, 1);
inputCtrl(document.form.wan_pptp_options_x, 0);
inputCtrl(document.form.wan_heartbeat_x, 1);
document.getElementById("vpn_dhcp").style.display = "none";
inputCtrl(document.form.wan_ppp_echo, 1);
ppp_echo_control();
}
else if(wan_type == "static"){
inputCtrl(document.form.wan_dnsenable_x[0], 0);
inputCtrl(document.form.wan_dnsenable_x[1], 0);
inputCtrl(document.form.wan_auth_x, 1);
inputCtrl(document.form.wan_pppoe_username, (document.form.wan_auth_x.value != ""));
inputCtrl(document.form.wan_pppoe_passwd, (document.form.wan_auth_x.value != ""));
inputCtrl(document.form.wan_pppoe_idletime, 0);
inputCtrl(document.form.wan_pppoe_idletime_check, 0);
inputCtrl(document.form.wan_pppoe_mtu, 0);
inputCtrl(document.form.wan_pppoe_mru, 0);
inputCtrl(document.form.wan_pppoe_service, 0);
inputCtrl(document.form.wan_pppoe_ac, 0);
inputCtrl(document.form.wan_pppoe_hostuniq, 0);
inputCtrl(document.form.dhcpc_mode, 0);
inputCtrl(document.form.wan_pppoe_options_x, 0);
inputCtrl(document.form.wan_pptp_options_x, 0);
inputCtrl(document.form.wan_heartbeat_x, 0);
document.getElementById("vpn_dhcp").style.display = "none";
inputCtrl(document.form.wan_ppp_echo, 0);
ppp_echo_control(0);
}
else{ // Automatic IP or 802.11 MD or ""
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
inputCtrl(document.form.wan_auth_x, 1);
inputCtrl(document.form.wan_pppoe_username, (document.form.wan_auth_x.value != ""));
inputCtrl(document.form.wan_pppoe_passwd, (document.form.wan_auth_x.value != ""));
inputCtrl(document.form.wan_pppoe_idletime, 0);
inputCtrl(document.form.wan_pppoe_idletime_check, 0);
inputCtrl(document.form.wan_pppoe_mtu, 0);
inputCtrl(document.form.wan_pppoe_mru, 0);
inputCtrl(document.form.wan_pppoe_service, 0);
inputCtrl(document.form.wan_pppoe_ac, 0);
inputCtrl(document.form.wan_pppoe_hostuniq, 0);
inputCtrl(document.form.dhcpc_mode, 1);
inputCtrl(document.form.wan_pppoe_options_x, 0);
inputCtrl(document.form.wan_pptp_options_x, 0);
inputCtrl(document.form.wan_heartbeat_x, 0);
document.getElementById("vpn_dhcp").style.display = "none";
inputCtrl(document.form.wan_ppp_echo, 0);
ppp_echo_control(0);
}
}
function fixed_change_wan_type(wan_type){
var flag = false;
if(!document.form.wan_dhcpenable_x[0].checked){
if(document.form.wan_ipaddr_x.value.length == 0)
document.form.wan_ipaddr_x.focus();
else if(document.form.wan_netmask_x.value.length == 0)
document.form.wan_netmask_x.focus();
else if(document.form.wan_gateway_x.value.length == 0)
document.form.wan_gateway_x.focus();
else
flag = true;
}else
flag = true;
if(wan_type == "pppoe"){
if(wan_type == original_wan_type){
document.form.wan_dnsenable_x[0].checked = original_dnsenable;
document.form.wan_dnsenable_x[1].checked = !original_dnsenable;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', original_dnsenable);
document.form.wan_ppp_echo.value = original_ppp_echo;
ppp_echo_control();
}
else{
document.form.wan_dnsenable_x[0].checked = 1;
document.form.wan_dnsenable_x[1].checked = 0;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 1);
document.form.wan_ppp_echo.value = default_ppp_echo;
ppp_echo_control();
}
}else if(wan_type == "pptp" || wan_type == "l2tp"){
if(wan_type == original_wan_type){
document.form.wan_dnsenable_x[0].checked = original_dnsenable;
document.form.wan_dnsenable_x[1].checked = !original_dnsenable;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', original_dnsenable);
document.form.wan_ppp_echo.value = original_ppp_echo;
ppp_echo_control();
}
else{
document.form.wan_dnsenable_x[0].checked = 0;
document.form.wan_dnsenable_x[1].checked = 1;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
document.form.wan_ppp_echo.value = default_ppp_echo;
ppp_echo_control();
}
}
else if(wan_type == "static"){
document.form.wan_dnsenable_x[0].checked = 0;
document.form.wan_dnsenable_x[1].checked = 1;
document.form.wan_dnsenable_x[0].disabled = true;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
}
else{ // wan_type == "dhcp"
if(wan_type == original_wan_type){
document.form.wan_dnsenable_x[0].checked = original_dnsenable;
document.form.wan_dnsenable_x[1].checked = !original_dnsenable;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', original_dnsenable);
}
else{
document.form.wan_dnsenable_x[0].checked = 1;
document.form.wan_dnsenable_x[1].checked = 0;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 1);
}
}
if(wan_type != "static"){ // disable DNS server "Yes" when choosing static IP, Jieming add at 2012/12/18
if(document.form.wan_dhcpenable_x[0].checked){
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
}
else{ //wan_dhcpenable_x NO
document.form.wan_dnsenable_x[0].checked = 0;
document.form.wan_dnsenable_x[1].checked = 1;
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
document.form.wan_dnsenable_x[0].disabled = true;
}
}
}
function change_wan_dhcp_enable(flag){
var wan_type = document.form.wan_proto.value;
if(wan_type == "pppoe"){
if(flag == 1){
if(wan_type == original_wan_type){
document.form.wan_dhcpenable_x[0].checked = original_wan_dhcpenable;
document.form.wan_dhcpenable_x[1].checked = !original_wan_dhcpenable;
}
else{
document.form.wan_dhcpenable_x[0].checked = 1;
document.form.wan_dhcpenable_x[1].checked = 0;
}
}
document.getElementById('IPsetting').style.display = "";
inputCtrl(document.form.wan_dhcpenable_x[0], 1);
inputCtrl(document.form.wan_dhcpenable_x[1], 1);
var wan_dhcpenable = document.form.wan_dhcpenable_x[0].checked;
inputCtrl(document.form.wan_ipaddr_x, !wan_dhcpenable);
inputCtrl(document.form.wan_netmask_x, !wan_dhcpenable);
inputCtrl(document.form.wan_gateway_x, !wan_dhcpenable);
}
else if(wan_type == "pptp"|| wan_type == "l2tp"){
if(flag == 1){
if(wan_type == original_wan_type){
document.form.wan_dhcpenable_x[0].checked = original_wan_dhcpenable;
document.form.wan_dhcpenable_x[1].checked = !original_wan_dhcpenable;
}
else{
document.form.wan_dhcpenable_x[0].checked = 0;
document.form.wan_dhcpenable_x[1].checked = 1;
}
}
document.getElementById('IPsetting').style.display = "";
inputCtrl(document.form.wan_dhcpenable_x[0], 1);
inputCtrl(document.form.wan_dhcpenable_x[1], 1);
var wan_dhcpenable = document.form.wan_dhcpenable_x[0].checked;
inputCtrl(document.form.wan_ipaddr_x, !wan_dhcpenable);
inputCtrl(document.form.wan_netmask_x, !wan_dhcpenable);
inputCtrl(document.form.wan_gateway_x, !wan_dhcpenable);
}
else if(wan_type == "static"){
document.form.wan_dhcpenable_x[0].checked = 0;
document.form.wan_dhcpenable_x[1].checked = 1;
inputCtrl(document.form.wan_dhcpenable_x[0], 0);
inputCtrl(document.form.wan_dhcpenable_x[1], 0);
document.getElementById('IPsetting').style.display = "";
inputCtrl(document.form.wan_ipaddr_x, 1);
inputCtrl(document.form.wan_netmask_x, 1);
inputCtrl(document.form.wan_gateway_x, 1);
}
else{ // wan_type == "dhcp"
document.form.wan_dhcpenable_x[0].checked = 1;
document.form.wan_dhcpenable_x[1].checked = 0;
inputCtrl(document.form.wan_dhcpenable_x[0], 0);
inputCtrl(document.form.wan_dhcpenable_x[1], 0);
inputCtrl(document.form.wan_ipaddr_x, 0);
inputCtrl(document.form.wan_netmask_x, 0);
inputCtrl(document.form.wan_gateway_x, 0);
document.getElementById('IPsetting').style.display = "none";
}
if(document.form.wan_dhcpenable_x[0].checked){
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
}
else{ //wan_dhcpenable_x NO
document.form.wan_dnsenable_x[0].checked = 0;
document.form.wan_dnsenable_x[1].checked = 1;
change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
inputCtrl(document.form.wan_dnsenable_x[0], 1);
inputCtrl(document.form.wan_dnsenable_x[1], 1);
document.form.wan_dnsenable_x[0].disabled = true;
}
}
function showMAC(){
var tempMAC = "";
document.form.wan_hwaddr_x.value = login_mac_str();
document.form.wan_hwaddr_x.focus();
}
function check_macaddr(obj,flag){ //control hint of input mac address
if(flag == 1){
var childsel=document.createElement("div");
childsel.setAttribute("id","check_mac");
childsel.style.color="#FFCC00";
obj.parentNode.appendChild(childsel);
document.getElementById("check_mac").innerHTML="<#288#>";
return false;
}else if(flag ==2){
var childsel=document.createElement("div");
childsel.setAttribute("id","check_mac");
childsel.style.color="#FFCC00";
obj.parentNode.appendChild(childsel);
document.getElementById("check_mac").innerHTML="<#253#>";
return false;
}else{
document.getElementById("check_mac") ? document.getElementById("check_mac").style.display="none" : true;
return true;
}
}
/* password item show or not */
function pass_checked(obj){
switchType(obj, document.form.show_pass_1.checked, true);
}
function ppp_echo_control(flag){
if (typeof(flag) == 'undefined')
flag = document.form.wan_ppp_echo.value;
var enable = (flag == 1) ? 1 : 0;
inputCtrl(document.form.wan_ppp_echo_interval, enable);
inputCtrl(document.form.wan_ppp_echo_failure, enable);
enable = (flag == 2) ? 1 : 0;
inputCtrl(document.form.dns_delay_round, enable);
}
function change_dnspriv_enable(flag){
if(flag == 1){
inputCtrl(document.form.dnspriv_profile[0], 1);
inputCtrl(document.form.dnspriv_profile[1], 1);
document.getElementById("DNSPrivacy").style.display = "";
document.getElementById("dnspriv_rulelist_Block").style.display = "";
show_dnspriv_rulelist();
}
else{
inputCtrl(document.form.dnspriv_profile[0], 0);
inputCtrl(document.form.dnspriv_profile[1], 0);
document.getElementById("DNSPrivacy").style.display = "none";
document.getElementById("dnspriv_rulelist_Block").style.display = "none";
}
}
function addRow(obj, head){
if(head == 1)
dnspriv_rulelist_array += "&#60"
else
dnspriv_rulelist_array += "&#62"
dnspriv_rulelist_array += obj.value;
obj.value = "";
}
function addRow_Group(upper){
var rule_num = document.getElementById('dnspriv_rulelist_table').rows.length;
var item_num = document.getElementById('dnspriv_rulelist_table').rows[0].cells.length;
if(rule_num >= upper){
alert("<#2086#> " + upper + " <#2087#>");
return false;
}
if(document.form.dnspriv_server_0.value==""){
alert("<#260#>");
document.form.dnspriv_server_0.focus();
document.form.dnspriv_server_0.select();
return false;
}
else{
addRow(document.form.dnspriv_server_0, 1);
addRow(document.form.dnspriv_port_0, 0);
addRow(document.form.dnspriv_hostname_0, 0);
addRow(document.form.dnspriv_spkipin_0, 0);
show_dnspriv_rulelist();
}
}
function edit_Row(r){
var i=r.parentNode.parentNode.rowIndex;
document.form.dnspriv_server_0.value = document.getElementById('dnspriv_rulelist_table').rows[i].cells[0].innerHTML;
document.form.dnspriv_port_0.value = document.getElementById('dnspriv_rulelist_table').rows[i].cells[1].innerHTML;
document.form.dnspriv_hostname_0.value = document.getElementById('dnspriv_rulelist_table').rows[i].cells[2].innerHTML;
document.form.dnspriv_spkipin_0.value = document.getElementById('dnspriv_rulelist_table').rows[i].cells[3].innerHTML;
del_Row(r);
}
function del_Row(r){
var i=r.parentNode.parentNode.rowIndex;
document.getElementById('dnspriv_rulelist_table').deleteRow(i);
var dnspriv_rulelist_value = "";
for(k=0; k<document.getElementById('dnspriv_rulelist_table').rows.length; k++){
for(j=0; j<document.getElementById('dnspriv_rulelist_table').rows[k].cells.length-1; j++){
if(j == 0)
dnspriv_rulelist_value += "&#60";
else
dnspriv_rulelist_value += "&#62";
dnspriv_rulelist_value += document.getElementById('dnspriv_rulelist_table').rows[k].cells[j].innerHTML;
}
}
dnspriv_rulelist_array = dnspriv_rulelist_value;
if(dnspriv_rulelist_array == "")
show_dnspriv_rulelist();
}
function show_dnspriv_rulelist(){
var dnspriv_rulelist_row = dnspriv_rulelist_array.split('&#60');
var code = "";
code +='<table width="100%" border="1" cellspacing="0" cellpadding="4" align="center" class="list_table" id="dnspriv_rulelist_table">';
if(dnspriv_rulelist_row.length == 1)
code +='<tr><td style="color:#FFCC00;" colspan="5"><#2027#></td></tr>';
else{
for(var i = 1; i < dnspriv_rulelist_row.length; i++){
code +='<tr id="row'+i+'">';
var dnspriv_rulelist_col = dnspriv_rulelist_row[i].split('&#62');
var wid=[27, 10, 27, 27];
for(var j = 0; j < dnspriv_rulelist_col.length; j++){
code +='<td width="'+wid[j]+'%">'+ dnspriv_rulelist_col[j] +'</td>';
}
code +='<td width="9%"><!--input class="edit_btn" onclick="edit_Row(this);" value=""/-->';
code +='<input class="remove_btn" onclick="del_Row(this);" value=""/></td></tr>';
}
}
code +='</table>';
document.getElementById("dnspriv_rulelist_Block").innerHTML = code;
}
</script>
</head>
<body onload="initial();" onunLoad="return unload_body();" class="bg">
<script>
if(sw_mode == 3){
alert("<#398#>");
location.href = "/";
}
</script>
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="wanUnit_form" action="/apply.cgi" target="hidden_frame">
<input type="hidden" name="current_page" value="Advanced_WAN_Content.asp">
<input type="hidden" name="next_page" value="Advanced_WAN_Content.asp">
<input type="hidden" name="action_mode" value="change_wan_unit">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="action_wait" value="">
<input type="hidden" name="wan_unit" value="">
</form>
<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="support_cdma" value="<% nvram_get("support_cdma"); %>">
<input type="hidden" name="current_page" value="Advanced_WAN_Content.asp">
<input type="hidden" name="next_page" value="Advanced_WAN_Content.asp">
<input type="hidden" name="group_id" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="restart_wan_if">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="first_time" value="">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<input type="hidden" name="lan_ipaddr" value="<% nvram_get("lan_ipaddr"); %>">
<input type="hidden" name="lan_netmask" value="<% nvram_get("lan_netmask"); %>">
<input type="hidden" name="ctf_fa_mode" value="<% nvram_get("ctf_fa_mode"); %>">
<input type="hidden" name="ctf_disable_force" value="<% nvram_get("ctf_disable_force"); %>">
<input type="hidden" name="dnspriv_rulelist" value="" disabled>
<table class="content" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="17">&nbsp;</td>
<td valign="top" width="202">
<div id="mainMenu"></div>
<div id="subMenu"></div>
</td>
<td height="430" valign="top">
<div id="tabMenu" class="submenuBlock"></div>
<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
<table width="760px" border="0" cellpadding="5" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top">
<div>&nbsp;</div>
<div class="formfonttitle"><#326#> - <#327#></div>
<div style="margin:10px 0 10px 5px;" class="splitLine"></div>
<div id="page_title" class="formfontdesc" style="margin-bottom:0px;"><#2185#></div>
<table id="WANscap" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#3146#></td>
</tr>
</thead>
<tr>
<th id="wan_inf_th"><#3158#></th>
<td align="left">
<select class="input_option" name="wan_unit" onchange="change_wan_unit(this);"></select>
</td>
</tr>
</table>
<div id="basic_setting_desc" class="formfontdesc" style="margin-bottom:0px; margin-top: 15px;"><#3142#></div>
<table id="t2BC" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#2778#></td>
</tr>
</thead>
<tr>
<th><#294#></th>
<td align="left">
<select id="wan_proto_menu" class="input_option" name="wan_proto" onchange="change_wan_type(this.value);fixed_change_wan_type(this.value);">
<option value="dhcp" <% nvram_match("wan_proto", "dhcp", "selected"); %>><#161#></option>
<option value="static" <% nvram_match("wan_proto", "static", "selected"); %>><#162#></option>
<option value="pppoe" <% nvram_match("wan_proto", "pppoe", "selected"); %>>PPPoE</option>
<option value="pptp" <% nvram_match("wan_proto", "pptp", "selected"); %>>PPTP</option>
<option value="l2tp" <% nvram_match("wan_proto", "l2tp", "selected"); %>>L2TP</option>
</select>
</td>
</tr>
<tr>
<th><#1638#></th>
<td>
<input type="radio" name="wan_enable" class="input" value="1" <% nvram_match("wan_enable", "1", "checked"); %>><#176#>
<input type="radio" name="wan_enable" class="input" value="0" <% nvram_match("wan_enable", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,22);"><#1631#></a></th>
<td>
<input type="radio" name="wan_nat_x" class="input" value="1" <% nvram_match("wan_nat_x", "1", "checked"); %>><#176#>
<input type="radio" name="wan_nat_x" class="input" value="0" <% nvram_match("wan_nat_x", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,23);"><#1272#></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a id="faq" href="" target="_blank" style="font-family:Lucida Console;text-decoration:underline;">UPnP&nbspFAQ</a></th>
<td>
<input type="radio" name="wan_upnp_enable" class="input" value="1" onclick="return change_common_radio(this, 'LANHostConfig', 'wan_upnp_enable', '1')" <% nvram_match("wan_upnp_enable", "1", "checked"); %>><#176#>
<input type="radio" name="wan_upnp_enable" class="input" value="0" onclick="return change_common_radio(this, 'LANHostConfig', 'wan_upnp_enable', '0')" <% nvram_match("wan_upnp_enable", "0", "checked"); %>><#175#>
</td>
</tr>
</table>
<table id="dot1q_setting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead><tr><td colspan="2">802.1Q</td></tr></thead>
<tr>
<th><#3276#></th>
<td>
<input type="radio" name="ewan_dot1q" class="input" value="1" onclick="change_dsl_dhcp_enable();" <% nvram_match("ewan_dot1q", "1", "checked"); %>><#176#>
<input type="radio" name="ewan_dot1q" class="input" value="0" onclick="change_dsl_dhcp_enable();" <% nvram_match("ewan_dot1q", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th>VLAN ID</th>
<td>
<input type="text" name="ewan_vid" maxlength="4" class="input_6_table" value="<% nvram_get("ewan_vid"); %>" onKeyPress="return validator.isNumber(this,event);"> ( 1 ~ 4094 )
</td>
</tr>
<tr>
<th>802.1P</th>
<td>
<input type="text" name="ewan_dot1p" maxlength="4" class="input_6_table" value="<% nvram_get("ewan_dot1p"); %>" onKeyPress="return validator.isNumber(this,event);"> ( 0 ~ 7 )
</td>
</tr>
</table>
<table id="wan_dot1q_setting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead><tr><td colspan="2">802.1Q</td></tr></thead>
<tr>
<th><#3276#></th>
<td>
<input type="radio" name="wan_dot1q" class="input" value="1" onclick="return change_common_radio(this, 'IPConnection', 'wan_dot1q', 1);" <% nvram_match("wan_dot1q", "1", "checked"); %>><#176#>
<input type="radio" name="wan_dot1q" class="input" value="0" onclick="return change_common_radio(this, 'IPConnection', 'wan_dot1q', 0);" <% nvram_match("wan_dot1q", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th>VLAN ID</th>
<td>
<input type="text" name="wan_vid" maxlength="4" class="input_6_table" value="<% nvram_get("wan_vid"); %>" onKeyPress="return validator.isNumber(this,event);"> ( 2 ~ 4094 )
</td>
</tr>
</table>
<table id="IPsetting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#2007#></td>
</tr>
</thead>
<tr>
<th><#2186#></th>
<td>
<input type="radio" name="wan_dhcpenable_x" class="input" value="1" onclick="change_wan_dhcp_enable(0);" <% nvram_match("wan_dhcpenable_x", "1", "checked"); %>><#176#>
<input type="radio" name="wan_dhcpenable_x" class="input" value="0" onclick="change_wan_dhcp_enable(0);" <% nvram_match("wan_dhcpenable_x", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,1);"><#241#></a></th>
<td><input type="text" name="wan_ipaddr_x" maxlength="15" class="input_15_table" value="<% nvram_get("wan_ipaddr_x"); %>" onKeyPress="return validator.isIPAddr(this, event);" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,2);"><#252#></a></th>
<td><input type="text" name="wan_netmask_x" maxlength="15" class="input_15_table" value="<% nvram_get("wan_netmask_x"); %>" onKeyPress="return validator.isIPAddr(this, event);" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,3);"><#250#></a></th>
<td><input type="text" name="wan_gateway_x" maxlength="15" class="input_15_table" value="<% nvram_get("wan_gateway_x"); %>" onKeyPress="return validator.isIPAddr(this, event);" autocorrect="off" autocapitalize="off"></td>
</tr>
</table>
<table id="DNSsetting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#2039#></td>
</tr>
</thead>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,12);"><#248#></a></th>
<td>
<input type="radio" name="wan_dnsenable_x" class="input" value="1" onclick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', 1)" <% nvram_match("wan_dnsenable_x", "1", "checked"); %> /><#176#>
<input type="radio" name="wan_dnsenable_x" class="input" value="0" onclick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', 0)" <% nvram_match("wan_dnsenable_x", "0", "checked"); %> /><#175#>
<div id="yadns_hint" style="display:none;"></div>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,13);"><#244#></a></th>
<td><input type="text" maxlength="15" class="input_15_table" name="wan_dns1_x" value="<% nvram_get("wan_dns1_x"); %>" onkeypress="return validator.isIPAddr(this, event)" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,14);"><#246#></a></th>
<td><input type="text" maxlength="15" class="input_15_table" name="wan_dns2_x" value="<% nvram_get("wan_dns2_x"); %>" onkeypress="return validator.isIPAddr(this, event)" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr style="display:none">
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(-1,-1);">DNS Privacy Protocol</a></th>
<td align="left">
<select id="dnspriv_enable" class="input_option" name="dnspriv_enable" onChange="change_dnspriv_enable(this.value);">
<option value="0" <% nvram_match("dnspriv_enable", "0", "selected"); %>>None</option>
<option value="1" <% nvram_match("dnspriv_enable", "1", "selected"); %>>DNS-over-TLS (DoT)</option>
</select>
<div id="yadns_hint_dnspriv" style="display:none;"></div>
</td>
</tr>
<tr style="display:none">
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(-1,-1);">DNS-over-TLS Profile</a></th>
<td>
<input type="radio" name="dnspriv_profile" class="input" value="1" onclick="return change_common_radio(this, 'IPConnection', 'dnspriv_profile', 1)" <% nvram_match("dnspriv_profile", "1", "checked"); %> />Strict
<input type="radio" name="dnspriv_profile" class="input" value="0" onclick="return change_common_radio(this, 'IPConnection', 'dnspriv_profile', 0)" <% nvram_match("dnspriv_profile", "0", "checked"); %> />Opportunistic
</td>
</tr>
</table>
<table id="DNSPrivacy" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable_table" style="display:none">
<thead>
<tr>
<td colspan="5">DNS-over-TLS Server List</td>
</tr>
</thead>
<tr>
<th><a href="javascript:void(0);" onClick="openHint(-1,-1);"><div class="table_text">Address</div></a></th>
<th><a href="javascript:void(0);" onClick="openHint(-1,-1);"><div class="table_text">TLS Port</div></a></th>
<th><a href="javascript:void(0);" onClick="openHint(-1,-1);"><div class="table_text">TLS Hostname</div></a></th>
<th><a href="javascript:void(0);" onClick="openHint(-1,-1);"><div class="table_text">SPKI Fingerprint</div></a></th>
<th><#2202#></th>
</tr>
<tr>
<td width="27%"><input type="text" class="input_20_table" maxlength="64" name="dnspriv_server_0" onKeyPress="" autocorrect="off" autocapitalize="off"></td>
<td width="10%"><input type="text" class="input_6_table" maxlength="5" name="dnspriv_port_0" onKeyPress="return validator.isNumber(this,event)" autocorrect="off" autocapitalize="off"></td>
<td width="27%"><input type="text" class="input_20_table" maxlength="64" name="dnspriv_hostname_0" onKeyPress="" autocorrect="off" autocapitalize="off"></td>
<td width="27%"><input type="text" class="input_20_table" maxlength="64" name="dnspriv_spkipin_0" onKeyPress="" autocorrect="off" autocapitalize="off"></td>
<td width="9%">
<div>
<input type="button" class="add_btn" onClick="addRow_Group(8);" value="">
</div>
</td>
</tr>
</table>
<div id="dnspriv_rulelist_Block"></div>
<table id="PPPsetting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#413#></td>
</tr>
</thead>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,29);"><#2475#></a></th>
<td align="left">
<select class="input_option" name="wan_auth_x" onChange="change_wan_type(document.form.wan_proto.value);">
<option value="" <% nvram_match("wan_auth_x", "", "selected"); %>><#761#></option>
<option value="8021x-md5" <% nvram_match("wan_auth_x", "8021x-md5", "selected"); %>>802.1x MD5</option>
</select></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,4);"><#2990#></a></th>
<td><input type="text" maxlength="64" class="input_32_table" name="wan_pppoe_username" value="" autocomplete="off" onkeypress="return validator.isString(this, event)" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,5);"><#411#></a></th>
<td>
<input type="password" maxlength="64" class="input_32_table" style="margin-top:2px;" id="wan_pppoe_passwd" name="wan_pppoe_passwd" value="" autocomplete="off" autocorrect="off" autocapitalize="off">
<div style="margin-top:1px;"><input type="checkbox" name="show_pass_1" onclick="pass_checked(document.form.wan_pppoe_passwd);"><#545#></div>
</td>
</tr>
<tr style="display:none">
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,6);"><#2479#></a></th>
<td>
<input type="text" maxlength="10" class="input_12_table" name="wan_pppoe_idletime" value="<% nvram_get("wan_pppoe_idletime"); %>" onKeyPress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/>
<input type="checkbox" style="margin-left:30;display:none;" name="wan_pppoe_idletime_check" value="" />
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,7);"><#2494#></a></th>
<td><input type="text" maxlength="5" name="wan_pppoe_mtu" class="input_6_table" value="<% nvram_get("wan_pppoe_mtu"); %>" onKeyPress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,8);"><#2492#></a></th>
<td><input type="text" maxlength="5" name="wan_pppoe_mru" class="input_6_table" value="<% nvram_get("wan_pppoe_mru"); %>" onKeyPress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,9);"><#2500#></a></th>
<td><input type="text" maxlength="32" class="input_32_table" name="wan_pppoe_service" value="<% nvram_get("wan_pppoe_service"); %>" onkeypress="return validator.isString(this, event)" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,10);"><#2483#></a></th>
<td><input type="text" maxlength="32" class="input_32_table" name="wan_pppoe_ac" value="<% nvram_get("wan_pppoe_ac"); %>" onkeypress="return validator.isString(this, event)" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,18);">Host-Uniq (<#1939#>)</a></th>
<td><input type="text" maxlength="32" class="input_32_table" name="wan_pppoe_hostuniq" value="<% nvram_get("wan_pppoe_hostuniq"); %>" onkeypress="return validator.isString(this, event);" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,17);"><#2498#></a></th>
<td>
<select name="wan_pptp_options_x" class="input_option">
<option value="" <% nvram_match("wan_pptp_options_x", "","selected"); %>><#149#></option>
<option value="-mppc" <% nvram_match("wan_pptp_options_x", "-mppc","selected"); %>><#2384#></option>
<option value="+mppe-40" <% nvram_match("wan_pptp_options_x", "+mppe-40","selected"); %>>MPPE 40</option>
<option value="+mppe-128" <% nvram_match("wan_pptp_options_x", "+mppe-128","selected"); %>>MPPE 128</option>
</select>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,31);"><#2487#></a></th>
<td>
<select name="wan_ppp_echo" class="input_option" onChange="ppp_echo_control();">
<option value="0" <% nvram_match("wan_ppp_echo", "0","selected"); %>><#1345#></option>
<option value="1" <% nvram_match("wan_ppp_echo", "1","selected"); %>>PPP Echo</option>
<option value="2" <% nvram_match("wan_ppp_echo", "2","selected"); %>>DNS Probe</option>
</select>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,32);"><#2489#></a></th>
<td><input type="text" maxlength="6" class="input_6_table" name="wan_ppp_echo_interval" value="<% nvram_get("wan_ppp_echo_interval"); %>" onkeypress="return validator.isNumber(this, event)" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,33);"><#2490#></a></th>
<td><input type="text" maxlength="6" class="input_6_table" name="wan_ppp_echo_failure" value="<% nvram_get("wan_ppp_echo_failure"); %>" onkeypress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,34);">DNS Probe Max Failures</a></th><td><input type="text" maxlength="6" class="input_6_table" name="dns_delay_round" value="<% nvram_get("dns_delay_round"); %>" onkeypress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/></td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,18);"><#2485#></a></th>
<td><input type="text" name="wan_pppoe_options_x" value="<% nvram_get("wan_pppoe_options_x"); %>" class="input_32_table" maxlength="255" onKeyPress="return validator.isString(this, event)" onBlur="validator.string(this)" autocorrect="off" autocapitalize="off"></td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#415#></td>
</tr>
</thead>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,19);"><#164#></a></th>
<td>
<input type="text" name="wan_heartbeat_x" class="input_32_table" maxlength="256" value="<% nvram_get("wan_heartbeat_x"); %>" onKeyPress="return validator.isString(this, event)" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr id="vpn_dhcp">
<th><#2501#></th>
<td><input type="radio" name="wan_vpndhcp" class="input" value="1" onclick="return change_common_radio(this, 'IPConnection', 'wan_vpndhcp', 1)" <% nvram_match("wan_vpndhcp", "1", "checked"); %> /><#176#>
<input type="radio" name="wan_vpndhcp" class="input" value="0" onclick="return change_common_radio(this, 'IPConnection', 'wan_vpndhcp', 0)" <% nvram_match("wan_vpndhcp", "0", "checked"); %> /><#175#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,15);"><#2486#></a></th>
<td>
<div><input type="text" name="wan_hostname" class="input_32_table" maxlength="32" value="<% nvram_get("wan_hostname"); %>" onkeypress="return validator.isString(this, event)" autocorrect="off" autocapitalize="off"><br/><span id="alert_msg1" style="color:#FC0;"></span></div>
</td>
</tr>
<tr>
<th ><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,16);"><#2488#></a></th>
<td>
<input type="text" name="wan_hwaddr_x" class="input_20_table" maxlength="17" value="<% nvram_get("wan_hwaddr_x"); %>" onKeyPress="return validator.isHWAddr(this,event)" autocorrect="off" autocapitalize="off">
<input type="button" class="button_gen" onclick="showMAC();" value="<#167#>">
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(7,30);"><#1494#></a></th>
<td>
<select name="dhcpc_mode" class="input_option">
<option value="0" <% nvram_match(" dhcpc_mode", "0","selected"); %>><#1496#></option>
<option value="1" <% nvram_match(" dhcpc_mode", "1","selected"); %>><#1495#></option>
<option value="2" <% nvram_match(" dhcpc_mode", "2","selected"); %>><#3502#></option>
</select>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick=""><#1654#></a></th>
<td>
<input type="radio" name="ttl_inc_enable" class="input" value="1" <% nvram_match("ttl_inc_enable", "1", "checked"); %>><#176#>
<input type="radio" name="ttl_inc_enable" class="input" value="0" <% nvram_match("ttl_inc_enable", "0", "checked"); %>><#175#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick=""><#2705#></a></th>
<td>
<input type="radio" name="ttl_spoof_enable" class="input" value="1" <% nvram_match("ttl_spoof_enable", "1", "checked"); %>><#176#>
<input type="radio" name="ttl_spoof_enable" class="input" value="0" <% nvram_match("ttl_spoof_enable", "0", "checked"); %>><#175#>
</td>
</tr>
</table>
<div class="apply_gen" style="height:auto">
<input class="button_gen" onclick="applyRule();" type="button" value="<#184#>"/>
</div>
</td>
</tr>
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

