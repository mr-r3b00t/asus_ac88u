function updateAMeshCount() {
if(lastName != "iconAMesh") {
$.ajax({
url: '/ajax_onboarding.asp',
dataType: 'script',
success: function(response) {
var get_cfg_clientlist_num = 0;
if(get_cfg_clientlist.length > 1) {
for (var idx in get_cfg_clientlist) {
if(get_cfg_clientlist.hasOwnProperty(idx)) {
if(idx != 0) {
get_cfg_clientlist_num++;
}
}
}
show_AMesh_status(get_cfg_clientlist_num, 1);
}
else
show_AMesh_status(0, 1);
}
});
}
}
function show_AMesh_status(num, flag) {
document.getElementById("ameshNumber").innerHTML = "<#946#>: <span>" + num + "</span>";
}
function initial_amesh_obj() {
if($('link[rel=stylesheet][href~="/device-map/amesh.css"]').length == 1) {
$('link[rel=stylesheet][href~="/device-map/amesh.css"]').remove();
}
if($('.amesh_popup_bg').length > 0) {
$('.amesh_popup_bg').remove();
}
}
function check_wl_auth_support(_wl_auth_mode_x, _obj) {
var support_flag = false;
var support_auth = ["psk2", "pskpsk2"];
for (var idx in support_auth) {
if (support_auth.hasOwnProperty(idx)) {
if(_wl_auth_mode_x == support_auth[idx]) {
support_flag = true;
break;
}
}
}
if(!support_flag) {
var auth_text = _obj.text();
var confirm_msg = "<#908#> " + auth_text + "<#909#>\n<#907#>";
support_flag = confirm(confirm_msg);
}
return support_flag;
}
function AiMesh_confirm_msg(_name, _value) {
var check_operation_mode = function(_value) {
switch(parseInt(_value)) {
case 2 :
return confirm("<#910#>\n<#907#>");//Repeater
break;
case 4 :
return confirm("<#911#>\n<#907#>");//Media Bridge
break;
default :
return true;
}
};
var check_feature_status = function(_obj, _value) {
if(_obj.value != _value)
return confirm(_obj.text);
else
return true;
};
var check_wireless_ssid_psk = function(_value) {
var current_ssid = _value["current"]["ssid"];
var current_psk = _value["current"]["psk"];
var original_ssid = _value["original"]["ssid"];
var original_psk = _value["original"]["psk"];
var current_node_count = [<% get_cfg_clientlist(); %>][0].length - 1;
var total_node_count = [<% get_onboardingstatus(); %>][0]["cfg_obcount"];
if(total_node_count != "" && current_node_count < total_node_count) {
if(current_ssid == original_ssid && current_psk == original_psk)
return true;
else if(current_ssid != original_ssid && current_psk != original_psk)
return confirm("<#912#>\n<#907#>");//SSID & WPA key
else if(current_ssid != original_ssid)
return confirm("<#913#>\n<#907#>");//SSID
else if(current_psk != original_psk)
return confirm("<#914#>\n<#907#>");/* untranslated */
}
else
return true;
};
var check_wireless_country_code = function() {
return confirm("<#915#>\n<#907#>");//Country code
};
var feature_value = {
"Wireless_Radio" : {
"value" : 1,
"text" : "<#916#>\n<#907#>" //Disable Radio
},
"Wireless_Hide" : {
"value" : 0,
"text" : "<#917#>\n<#907#>" //Hide SSID
},
"Wireless_Hide_WPS" : {
"value" : 0,
"text" : "<#918#>\n<#907#>" //Hide SSID
},
"DHCP_Server" : {
"value" : 1,
"text" : "<#919#>\n<#907#>" //Disable DHCP
}
};
var confirm_flag = true;
switch(_name) {
case "Operation_Mode" :
confirm_flag = check_operation_mode(_value);
break;
case "Wireless_Radio" :
case "Wireless_Hide" :
case "Wireless_Hide_WPS" :
case "DHCP_Server" :
confirm_flag = check_feature_status(feature_value[_name], _value);
break;
case "Wireless_SSID_PSK" :
confirm_flag = check_wireless_ssid_psk(_value);
break;
case "Wireless_CountryCode" :
confirm_flag = check_wireless_country_code();
break;
}
return confirm_flag;
}

