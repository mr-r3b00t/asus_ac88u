<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#756#> - Blocking Page</title>
<script type="text/JavaScript" src="/js/jquery.js"></script>
<style>
body{
color:#FFF;
font-family: Arial;
}
.wrapper{
background:url(images/New_ui/login_bg.png) #1F1F1F no-repeat;
background-size: 1280px 1076px;
background-position: center 0%;
margin: 0px;
}
.title_name {
font-size: 32px;
color:#93D2D9;
}
.title_text{
width:520px;
}
.prod_madelName{
font-size: 26px;
color:#fff;
margin-left:78px;
margin-top: 10px;
}
.login_img{
width:43px;
height:43px;
background-image: url('images/New_ui/icon_titleName.png');
background-repeat: no-repeat;
}
.p1{
font-size: 16px;
color:#fff;
width: 480px;
}
.button{
background-color:#279FD9;
/*background:rgba(255,255,255,0.1);
border: solid 1px #6e8385;*/
border-radius: 4px ;
transition: visibility 0s linear 0.218s,opacity 0.218s,background-color 0.218s;
height: 68px;
width: 300px;
font-size: 28px;
color:#fff;
color:#000\9; /* IE6 IE7 IE8 */
text-align: center;
float:right;
margin:25px 0 0 78px;
line-height:68px;
}
.form_input{
background-color:rgba(255,255,255,0.2);
border-radius: 4px;
padding:26px 22px;
width: 480px;
border: 0;
height:25px;
color:#fff;
color:#000\9; /* IE6 IE7 IE8 */
font-size:28px
}
.nologin{
margin:10px 0px 0px 78px;
background-color:rgba(255,255,255,0.2);
padding:20px;
line-height:36px;
border-radius: 5px;
width: 600px;
border: 0;
color:#fff;
color:#000\9; /* IE6 IE7 IE8 */
font-size: 18px;
}
.div_table{
display:table;
}
.div_tr{
display:table-row;
}
.div_td{
display:table-cell;
}
.title_gap{
margin:10px 0px 0px 78px;
}
.img_gap{
padding-right:30px;
vertical-align:middle;
}
.password_gap{
margin:30px 0px 0px 78px;
}
.error_hint{
color: rgb(255, 204, 0);
margin:10px 0px -10px 78px;
font-size: 18px;
font-weight: bolder;
}
.main_field_gap{
margin:100px auto 0;
}
ul{
margin: 0;
}
li{
margin: 10px 0;
}
#wanLink{
cursor: pointer;
}
.button_background{
background-color: transparent;
}
.tm_logo{
background:url('images/New_ui/tm_logo_1.png') no-repeat;
width:487px;
height:90px;
background-size: 80%;
margin-left: -20px;
}
.desc_info{
font-weight:bold;
}
#tm_block{
margin: 0 20px;
}
a{
color: #FC0;
}
/*for mobile device*/
@media screen and (max-width: 1000px){
.title_name {
font-size: 1.2em;
color:#93d2d9;
margin-left:15px;
}
.prod_madelName{
font-size: 1.2em;
margin-left: 15px;
}
.p1{
font-size: 16px;
width:100%;
}
.login_img{
background-size: 75%;
}
.title_text{
width: 100%;
}
.form_input{
padding:13px 11px;
width: 100%;
height:25px;
font-size:16px
}
.button{
height: 50px;
width: 100%;
font-size: 16px;
text-align: center;
float:right;
margin: 25px -30px 0 0;
line-height:50px;
padding: 0 10px;
}
.nologin{
margin-left:10px;
padding:5px;
line-height:18px;
width: 100%;
font-size:14px;
}
.error_hint{
margin-left:10px;
}
.main_field_gap{
width:80%;
margin:30px 0 0 15px;
/*margin:30px auto 0;*/
}
.title_gap{
margin-left:15px;
}
.password_gap{
margin-left:15px;
}
.img_gap{
padding-right:0;
vertical-align:middle;
}
ul{
margin-left:-20px;
}
li{
margin: 10px 0;
}
.tm_logo{
width: 400px;
background-repeat: no-repeat;
background-size: 100%;
}
}
</style>
<script type="text/javascript">
var bwdpi_support = ('<% nvram_get("rc_support"); %>'.search('bwdpi') == -1) ? false : true;
var casenum = '<% get_parameter("cat_id"); %>';
var flag = '<% get_parameter("flag"); %>';
var block_info = '<% bwdpi_redirect_info(); %>';
if(block_info != "")
block_info = JSON.parse(block_info);
var category_info = [ ["Parental Controls", "1", "<#1047#>", "<#1049#>", "<#1275#>"],
["Parental Controls", "2", "<#1047#>", "<#1049#>", "<#1276#>"],
["Parental Controls", "3", "<#1047#>", "<#1049#>", "<#1277#>"],
["Parental Controls", "4", "<#1047#>", "<#1049#>", "<#1278#>"],
["Parental Controls", "5", "<#1047#>", "<#1049#>", "<#1279#>"],
["Parental Controls", "6", "<#1047#>", "<#1049#>", "<#1280#>"],
["Parental Controls", "8", "<#1047#>", "<#1049#>", "<#1281#>"],
["Parental Controls", "9", "<#1047#>", "<#1050#>", "<#1282#>"],
["Parental Controls", "10", "<#1047#>", "<#1050#>", "<#1283#>"],
["Parental Controls", "14", "<#1047#>", "<#1050#>", "<#1284#>"],
["Parental Controls", "15", "<#1047#>", "<#1050#>", "<#1285#>"],
["Parental Controls", "16", "<#1047#>", "<#1050#>", "<#1286#>"],
["Parental Controls", "25", "<#1047#>", "<#1050#>", "<#1287#>"],
["Parental Controls", "26", "<#1047#>", "<#1050#>", "<#1288#>"],
["Parental Controls", "11", "<#1047#>", "<#1051#>", "<#1289#>"],
["Parental Controls", "24", "<#1062#>", "<#1052#>", "<#1290#>"],
["Parental Controls", "51", "<#1062#>", "<#1053#>", "<#1291#>"],
["Parental Controls", "53", "<#1062#>", "<#1054#>", "<#1292#>"],
["Parental Controls", "89", "<#1062#>", "<#1054#>", "<#1293#>"],
["Parental Controls", "42", "<#1062#>", "<#1055#>", "<#1294#>"],
["Parental Controls", "56", "<#1065#>", "<#1067#>", "<#1295#>"],
["Parental Controls", "70", "<#1065#>", "<#1067#>", "<#1296#>"],
["Parental Controls", "71", "<#1065#>", "<#1067#>", "<#1297#>"],
["Parental Controls", "57", "<#1065#>", "<#1068#>", "<#1298#>"],
["Parental Controls", "69", "<#1069#>", "<#1071#>", "<#1299#>"],
["Parental Controls", "23", "<#1069#>", "<#1072#>", "<#1300#>"],
["Home Protection", "91", "Anti-Trojan detecting and blocked", "", "<#1301#>"],
["Home Protection", "39", "Malicious site blocked", "", "<#1302#>"],
["Home Protection", "73", "Malicious site blocked", "", "<#1303#>"],
["Home Protection", "74", "Malicious site blocked", "", "<#1304#>"],
["Home Protection", "75", "Malicious site blocked", "", "<#1305#>"],
["Home Protection", "76", "Malicious site blocked", "", "<#1306#>"],
["Home Protection", "77", "Malicious site blocked", "", "<#1307#>"],
["Home Protection", "78", "Malicious site blocked", "", "<#1308#>"],
["Home Protection", "79", "Malicious site blocked", "", "<#1309#>"],
["Home Protection", "80", "Malicious site blocked", "", "<#1310#>"],
["Home Protection", "81", "Malicious site blocked", "", "<#1311#>"],
["Home Protection", "82", "Malicious site blocked", "", "<#1312#>"],
["Home Protection", "83", "Malicious site blocked", "", "<#1313#>"],
["Home Protection", "84", "Malicious site blocked", "", "<#1314#>"],
["Home Protection", "85", "Malicious site blocked", "", "<#1315#>"],
["Home Protection", "86", "Malicious site blocked", "", "<#1316#>"],
["Home Protection", "88", "Malicious site blocked", "", "<#1317#>"],
["Home Protection", "92", "Malicious site blocked", "", "<#1318#>"],
["Home Protection", "94", "Malicious site blocked", "", "<#1319#>"],
["Home Protection", "95", "Malicious site blocked", "", "<#1320#>"]
];
var target_info = {
url: "",
category_id: "",
category_type: "",
content_category: "",
desc: ""
}
function initial(){
get_target_info();
show_information();
}
function get_target_info(){
if(casenum != ""){ //for AiProtection
target_info.url = block_info[1];
target_info.category_id = block_info[2];
get_category_info();
}
else{ //for Parental Controls (Time Scheduling)
target_info.desc = "<#1328#>";
}
}
function get_category_info(){
var cat_id = target_info.category_id;
var category_string = "";
for(i=0;i< category_info.length;i++){
if(category_info[i][1] == cat_id){
category_string = category_info[i][2];
if(category_info[i][3] != ""){
category_string += " - " + category_info[i][3];
}
target_info.category_type = category_info[i][0];
target_info.content_category = category_string;
target_info.desc = category_info[i][4];
}
}
}
function show_information(){
var code = "";
var code_suggestion = "";
var code_title = "";
var parental_string = "";
code = "<ul>";
code += "<li><div><span class='desc_info'><#1478#>:</span><br>" + target_info.desc + "</div></li>";
if(casenum != "")
code += "<li><div><span class='desc_info'>URL: </span>" + target_info.url +"</div></li>";
if(target_info.category_type == "Parental Controls")
code += "<li><div><span class='desc_info'><#1057#> :</span>" + target_info.content_category + "</div></li>";
code += "</ul>";
document.getElementById('detail_info').innerHTML = code;
if(target_info.category_type == "Parental Controls"){ //Webs Apps filter
code_title = "<div class='er_title' style='height:auto;'><#1327#></div>";
code_suggestion = "<ul>";
code_suggestion += "<li><span><#1326#></span></li>";
code_suggestion += "<li><span><#1331#></span></li>";
code_suggestion += '<li><#1117#><a href="https://global.sitesafety.trendmicro.com/index.php" target="_blank"><#1118#></a></li>';
code_suggestion += "</ul>";
document.getElementById('tm_block').style.display = "none";
$("#go_btn").click(function(){
location.href = "AiProtection_WebProtector.asp";
});
document.getElementById('go_btn').style.display = "";
}
else if(target_info.category_type == "Home Protection"){
code_title = "<div class='er_title' style='height:auto;'><#1325#></div>";
code_suggestion = "<ul>";
code_suggestion += '<li>If you are not sure of this webiste, visit <a href="https://global.sitesafety.trendmicro.com/index.php" target="_blank">TrendMicro\'s Site Safety Caneter</a> for more information. You can check the safety level of a particular URL that might seem suspicious.</li>';
code_suggestion += "<li>If you trust this website, click <a href='http://router.asus.com/AiProtection_MaliciousSitesBlocking.asp'>here</a> to unblock (administrator credential required)</li>";
code_suggestion += "</ul>";
document.getElementById('tm_block').style.display = "";
/*$("#go_btn").click(function(){
location.href = "AiProtection_HomeProtection.asp";
});
document.getElementById('go_btn').style.display = "";*/
}
else if(flag != ""){
code_title = "<div class='er_title' style='height:auto;'><#722#></div>";
document.getElementById('main_reason').innerHTML = "<#721#>";
code = "";
code += "<div><#732#></div>";
document.getElementById('detail_info').innerHTML = code;
code_suggestion = "<ul>";
code_suggestion += "<li><span><#733#></span></li>";
code_suggestion += "<li><span><#734#></span></li>";
code_suggestion += "</ul>";
$("#go_btn").click(function(){
location.href = "AdaptiveQoS_TrafficLimiter.asp";
});
document.getElementById('go_btn').style.display = "";
}
else{ //for Parental Control(Time Scheduling)
code_title = "<div class='er_title' style='height:auto;'><#1332#></div>"
code_suggestion = "<ul>";
if(bwdpi_support)
parental_string = "<#2783#>";
else
parental_string = "<#399#>";
code_suggestion += "<li><#1329#> "+ parental_string +" <#1330#></li>";
code_suggestion += "<li><#1331#></li>";
code_suggestion += "</ul>";
$("#go_btn").click(function(){
location.href = "ParentalControl.asp";
});
document.getElementById('go_btn').style.display = "";
document.getElementById('tm_block').style.display = "none";
}
document.getElementById('page_title').innerHTML = code_title;
document.getElementById('suggestion').innerHTML = code_suggestion;
}
</script>
</head>
<body class="wrapper" onload="initial();">
<div class="div_table main_field_gap">
<div class="title_name">
<div class="div_td img_gap">
<div class="login_img"></div>
</div>
<div id="page_title" class="div_td title_text"></div>
</div>
<div class="prod_madelName"><#757#></div>
<div id="main_reason" class="p1 title_gap"><#1322#></div>
<div ></div>
<div>
<div class="p1 title_gap"></div>
<div class="nologin">
<div id="detail_info"></div>
</div>
</div>
<div class="p1 title_gap"><#741#></div>
<div>
<div class="p1 title_gap"></div>
<div class="nologin">
<div id="case_content"></div>
<div id="suggestion"></div>
<div id="tm_block" style="display:none">
<!--div><#1324#></div-->
<div class="tm_logo"></div>
</div>
</div>
</div>
<div id="go_btn" class='button' style="display:none;"><#1349#></div>
</div>
</body>
</html>

