/* menuTree_bwdpi_traffic_analyzer.js */
define(function(){
var menuTree = {
list: [
/*
{
menuName: "Title",
index: "Assign an index to this menu, it is also used for filtering",
tab: [
{
url: "Put url here",
tabName: "
Assign a title for this tab, leave this field empty to bypass this tab,
fill in '__HIDE__' to hide the tab switcher,
fill in '__INHERIT__' to inhert tab index from referred page.
"
}
]
}
*/
{
menuName: "<#421#>",
index: "menu_QIS",
tab: [
{url: "QIS_wizard.htm", tabName: "__HIDE__"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
/* ============================================================================================================ */
{
menuName: "<#316#>",
index: "menu_Split",
tab: [
{url: "NULL", tabName: "__HIDE__"}
]
},
{
menuName: "<#313#>",
index: "menu_Index",
tab: [
{url: "<% networkmap_page(); %>", tabName: "__HIDE__"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#234#>",
index: "menu_GuestNetwork",
tab: [
{url: "Guest_network.asp", tabName: "<#234#>"},
{url: "Captive_Portal.asp", tabName: "Free Wi-Fi"},
{url: "Captive_Portal_Advanced.asp", tabName: "<#3455#>"},
{url: "Guest_network_fbwifi.asp", tabName: "Facebook Wi-Fi"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#1123#>",
index: "menu_AiProtection",
tab: [
{url: "AiProtection_HomeSecurity.asp", tabName: "__HIDE__"},
{url: "AiProtection_HomeProtection.asp", tabName: "<#1076#>"},
{url: "AiProtection_MaliciousSitesBlocking.asp", tabName: "<#1120#>"},
{url: "AiProtection_IntrusionPreventionSystem.asp", tabName: "<#1139#>"},
{url: "AiProtection_InfectedDevicePreventBlock.asp", tabName: "<#1033#>"},
{url: "AiProtection_WebProtector.asp", tabName: "<#399#>"},
{url: "ParentalControl.asp", tabName: "__INHERIT__"},
{url: "AiProtection_AdBlock.asp", tabName: "Ad Blocking"},
{url: "AiProtection_Key_Guard.asp", tabName: "Key Guard"},
{url: "YandexDNS.asp", tabName: "<#3411#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{ //for without bwdpi model, RT-N66U_C1
menuName: "<#311#>",
index: "menu_QoS",
tab: [
{url: "QoS_EZQoS.asp", tabName: "<#2240#>"},
{url: "Main_TrafficMonitor_realtime.asp", tabName: "<#695#>"},
{url: "Main_TrafficMonitor_last24.asp", tabName: "__INHERIT__"},
{url: "Main_TrafficMonitor_daily.asp", tabName: "__INHERIT__"},
{url: "AdaptiveQoS_ROG.asp", tabName: "<table style='margin-top:-7px;'><tr><td><img src='/images/ROG_Logo.png' style='border:0px;width:32px;'></td><td>ROG First</td></tr></table>"},
{url: "Main_Spectrum_Content.asp", tabName: "<#2704#>"},
{url: "AdaptiveQoS_TrafficLimiter.asp", tabName: "Traffic Limiter"},
{url: "Advanced_QOSUserPrio_Content.asp", tabName: "__INHERIT__"},
{url: "Advanced_QOSUserRules_Content.asp", tabName: "__INHERIT__"},
]
},
{ //for without bwdpi model, RT-N66U_C1
menuName: "<#399#>",
index: "menu_ParentalControl",
tab: [
{url: "ParentalControl.asp", tabName: "<#399#>"},
{url: "YandexDNS.asp", tabName: "<#3411#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#811#>",
index: "menu_BandwidthMonitor",
tab: [
{url: "AdaptiveQoS_Bandwidth_Monitor.asp", tabName: "<#1264#>"},
{url: "QoS_EZQoS.asp", tabName: "<#2240#>"},
{url: "AdaptiveQoS_WebHistory.asp", tabName: "<#806#>"},
{url: "AdaptiveQoS_ROG.asp", tabName: "<table style='margin-top:-7px;'><tr><td><img src='/images/ROG_Logo.png' style='border:0px;width:32px;'></td><td>ROG First</td></tr></table>"},
{url: "Main_Spectrum_Content.asp", tabName: "<#2704#>"},
{url: "Advanced_QOSUserPrio_Content.asp", tabName: "__INHERIT__"},
{url: "Advanced_QOSUserRules_Content.asp", tabName: "__INHERIT__"},
{url: "AdaptiveQoS_Adaptive.asp", tabName: "__INHERIT__"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "网易UU加速器",
index: "menu_UU",
tab: [
{url: "UUAccelerator.asp", tabName: "网易UU加速器"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#2826#>",
index: "menu_TrafficAnalyzer",
tab: [
{url: "TrafficAnalyzer_Statistic.asp", tabName: "<#2715#>"},
{url: "Main_TrafficMonitor_realtime.asp", tabName: "<#695#>"},
{url: "Main_TrafficMonitor_last24.asp", tabName: "__INHERIT__"},
{url: "Main_TrafficMonitor_daily.asp", tabName: "__INHERIT__"},
{url: "AdaptiveQoS_TrafficLimiter.asp", tabName: "Traffic Limiter"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#1860#>",
index: "menu_GameBoost",
tab: [
{url: "GameBoost.asp", tabName: "<#1860#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "Open NAT",
index: "menu_OpenNAT",
tab: [
{url: "GameProfile.asp", tabName: "Open NAT"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#312#>",
index: "menu_APP",
tab: [
{url: "APP_Installation.asp", tabName: "__HIDE__"},
{url: "aidisk.asp", tabName: "__INHERIT__"},
{url: "mediaserver.asp", tabName: "<#699#>"},
{url: "Advanced_AiDisk_samba.asp", tabName: "<#333#>".concat(WebDav_support?" / <#1372#>":"")},
{url: "Advanced_AiDisk_ftp.asp", tabName: "<#334#>"},
{url: "PrinterServer.asp", tabName: "__INHERIT__"},
{url: "Advanced_Modem_Content.asp", tabName: "__INHERIT__"},
{url: "Advanced_TimeMachine.asp", tabName: "__INHERIT__"},
{url: "fileflex.asp", tabName: "__INHERIT__"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#871#>",
index: "menu_AiCloud",
tab: [
{url: "cloud_main.asp", tabName: "AiCloud 2.0"},
{url: "cloud_sync.asp", tabName: "<#2695#>"},
{url: "cloud_router_sync.asp", tabName: "<#2628#>"},
{url: "cloud_settings.asp", tabName: "<#2648#>"},
{url: "cloud_syslog.asp", tabName: "<#2206#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
/* ============================================================================================================ */
{
menuName: "<#314#>",
index: "menu_Split",
tab: [
{url: "NULL", tabName: "__HIDE__"}
]
},
{
menuName: "<#315#>",
index: "menu_Wireless",
tab: [
{url: "Advanced_Wireless_Content.asp", tabName: "<#316#>"},
{url: "Advanced_WWPS_Content.asp", tabName: "<#317#>"},
{url: "Advanced_WMode_Content.asp", tabName: "WDS"},
{url: "Advanced_ACL_Content.asp", tabName: "<#319#>"},
{url: "Advanced_WSecurity_Content.asp", tabName: "<#320#>"},
{url: "Advanced_WAdvanced_Content.asp", tabName: "<#321#>"},
{url: "Advanced_WProxy_Content.asp", tabName: "<#3194#>"},
{url: "Advanced_Roaming_Block_Content.asp", tabName: "<#3197#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#322#>",
index: "menu_LAN",
tab: [
{url: "Advanced_LAN_Content.asp", tabName: "<#323#>"},
{url: "Advanced_DHCP_Content.asp", tabName: "<#324#>"},
{url: "Advanced_MultiSubnet_Content.asp", tabName: "<#324#>"},
{url: "Advanced_GWStaticRoute_Content.asp", tabName: "<#325#>"},
{url: "Advanced_IPTV_Content.asp", tabName: "IPTV"},
{url: "Advanced_SwitchCtrl_Content.asp", tabName: "<#2741#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#326#>",
index: "menu_WAN",
tab: [
{url: "Advanced_WAN_Content.asp", tabName: "<#327#>"},
{url: "Advanced_DSL_Content.asp", tabName: "<#327#>"},
{url: "Advanced_VDSL_Content.asp", tabName: "<#327#>"},
{url: "Advanced_Modem_Content.asp", tabName: "<#327#>"},
{url: "Advanced_MobileBroadband_Content.asp", tabName: "<#327#>"},
{url: "Advanced_WANPort_Content.asp", tabName: "<#207#>"},
{url: "Advanced_PortTrigger_Content.asp", tabName: "<#328#>"},
{url: "Advanced_VirtualServer_Content.asp", tabName: "<#329#>"},
{url: "Advanced_Exposed_Content.asp", tabName: "<#330#>"},
{url: "Advanced_ASUSDDNS_Content.asp", tabName: "<#331#>"},
{url: "Advanced_NATPassThrough_Content.asp", tabName: "<#359#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "Alexa & IFTTT",
index: "menu_Alexa_IFTTT",
tab: [
{url: "Advanced_Smart_Home_Alexa.asp", tabName: "__INHERIT__"},
{url: "Advanced_Smart_Home_IFTTT.asp", tabName: "__INHERIT__"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "IPv6",
index: "menu_IPv6",
tab: [
{url: "Advanced_IPv6_Content.asp", tabName: "IPv6"},
{url: "Advanced_IPv61_Content.asp", tabName: "__INHERIT__"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "VPN",
index: "menu_VPN",
tab: [
{url: "Advanced_VPN_PPTP.asp", tabName: "<#164#>"},
{url: "Advanced_VPN_OpenVPN.asp", tabName: "__INHERIT__"},
{url: "Advanced_VPN_IPSec.asp", tabName: "__INHERIT__"},
{url: "Advanced_VPNClient_Content.asp", tabName: (vpn_fusion_support) ? "<#3549#>" : "<#3139#>"},
{url: "Advanced_TOR_Content.asp", tabName: "TOR"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#337#>",
index: "menu_Firewall",
tab: [
{url: "Advanced_BasicFirewall_Content.asp", tabName: "<#316#>"},
{url: "Advanced_URLFilter_Content.asp", tabName: "<#338#>"},
{url: "Advanced_KeywordFilter_Content.asp", tabName: "<#341#>"},
{url: "Advanced_Firewall_Content.asp", tabName: "<#340#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#343#>",
index: "menu_Setting",
tab: [
{url: "Advanced_OperationMode_Content.asp", tabName: "<#344#>"},
{url: "Advanced_System_Content.asp", tabName: "<#346#>"},
{url: "Advanced_FirmwareUpgrade_Content.asp", tabName: "<#347#>"},
{url: "Advanced_SettingBackup_Content.asp", tabName: "<#348#>"},
{url: "Advanced_PerformanceTuning_Content.asp", tabName: "Fan tuning"},
{url: "Advanced_ADSL_Content.asp", tabName: "<#310#>"},
{url: "Advanced_Feedback.asp", tabName: "<#2235#>"},
{url: "Feedback_Info.asp", tabName: "__INHERIT__"},
{url: "Advanced_SNMP_Content.asp", tabName: "SNMP"},
{url: "Advanced_TR069_Content.asp", tabName: "TR-069"},
{url: "Advanced_Notification_Content.asp", tabName: "Notification"},
{url: "Advanced_Privacy.asp", tabName: "<#3580#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#668#>",
index: "menu_Log",
tab: [
{url: "Main_LogStatus_Content.asp", tabName: "<#349#>"},
{url: "Main_WStatus_Content.asp", tabName: "<#351#>"},
{url: "Main_DHCPStatus_Content.asp", tabName: "<#350#>"},
{url: "Main_IPV6Status_Content.asp", tabName: "IPv6"},
{url: "Main_RouteStatus_Content.asp", tabName: "<#353#>"},
{url: "Main_IPTStatus_Content.asp", tabName: "<#352#>"},
{url: "Main_AdslStatus_Content.asp", tabName: "<#309#>"},
{url: "Main_ConnStatus_Content.asp", tabName: "<#1395#>"},
/* {url: "###Main_ConnStatus_Content.asp", tabName: "Captive Portal Connection Log"}, */
{url: "NULL", tabName: "__INHERIT__"}
]
},
{
menuName: "<#2363#>",
index: "menu_NekworkTool",
tab: [
{url: "Main_Analysis_Content.asp", tabName: "<#2359#>"},
{url: "Main_Netstat_Content.asp", tabName: "Netstat"},
{url: "Main_WOL_Content.asp", tabName: "<#2379#>"},
{url: "Advanced_Smart_Connect.asp", tabName: "<#2688#>"},
{url: "NULL", tabName: "__INHERIT__"}
]
}
],
exclude: {
menus: function(){
var retArray = [];
if(!multissid_support){
retArray.push("menu_GuestNetwork");
}
if(!bwdpi_support){
retArray.push("menu_AiProtection");
retArray.push("menu_TrafficAnalyzer");
retArray.push("menu_BandwidthMonitor");
}
else{
retArray.push("menu_ParentalControl");
retArray.push("menu_QoS");
}
if(!usb_support){
retArray.push("menu_APP");
}
if(!cloudsync_support && !aicloudipk_support){
retArray.push("menu_AiCloud");
}
if(!ifttt_support && !alexa_support){
retArray.push("menu_Alexa_IFTTT");
}
if(!IPv6_support){
retArray.push("menu_IPv6");
}
if(!networkTool_support){
retArray.push("menu_NekworkTool");
}
if(!pptpd_support && !openvpnd_support && !vpnc_support){
retArray.push("menu_VPN");
}
if(!tagged_based_vlan){
retArray.push("menu_VLAN");
}
if(!gameMode_support) {
retArray.push("menu_OpenNAT");
}
if(!rog_support){
for(i=0; i<menuTree.list.length; i++){
if(menuTree.list[i].menuName == '<#1860#>'){
menuTree.list[i].menuName = 'Game';
}
}
}
if(!uu_support){
retArray.push("menu_UU");
}
/* Operation Mode */
if(isSwMode("re")){
retArray.push("menu_GuestNetwork");
retArray.push("menu_AccessControl");
retArray.push("menu_TrafficAnalyzer");
retArray.push("menu_QoS");
retArray.push("menu_BandwidthMonitor");
retArray.push("menu_AiProtection");
retArray.push("menu_WAN");
retArray.push("menu_IPv6");
retArray.push("menu_VPN");
retArray.push("menu_VLAN");
retArray.push("menu_Firewall");
retArray.push("menu_ParentalControl");
retArray.push("menu_QoS");
retArray.push("menu_OpenNAT");
if(!userRSSI_support){
retArray.push("menu_Wireless");
}
if(wlc_express != 0){
retArray.push("menu_Wireless");
}
if(ifttt_support || alexa_support){
retArray.push("menu_Alexa_IFTTT");
}
}
else if(isSwMode("ap")){
retArray.push("menu_AccessControl");
retArray.push("menu_TrafficAnalyzer");
retArray.push("menu_QoS");
retArray.push("menu_BandwidthMonitor");
retArray.push("menu_AiProtection");
retArray.push("menu_WAN");
retArray.push("menu_IPv6");
retArray.push("menu_VPN");
retArray.push("menu_VLAN");
retArray.push("menu_Firewall");
retArray.push("menu_ParentalControl");
retArray.push("menu_QoS");
retArray.push("menu_OpenNAT");
if(ifttt_support || alexa_support){
retArray.push("menu_Alexa_IFTTT");
}
}
else if(isSwMode("mb")){
retArray.push("menu_GuestNetwork");
retArray.push("menu_AccessControl");
retArray.push("menu_TrafficAnalyzer");
retArray.push("menu_QoS");
retArray.push("menu_BandwidthMonitor");
retArray.push("menu_AiProtection");
retArray.push("menu_Wireless");
retArray.push("menu_WAN");
retArray.push("menu_IPv6");
retArray.push("menu_VPN");
retArray.push("menu_VLAN");
retArray.push("menu_Firewall");
retArray.push("menu_ParentalControl");
retArray.push("menu_QoS");
retArray.push("menu_OpenNAT");
if(ifttt_support || alexa_support){
retArray.push("menu_Alexa_IFTTT");
}
}
return retArray;
},
tabs: function(){
var retArray = [];
/* By RC Support */
if(!bwdpi_support){
retArray.push("AdaptiveQoS_Bandwidth_Monitor.asp");
retArray.push("AdaptiveQoS_WebHistory.asp");
retArray.push("AdaptiveQoS_Adaptive.asp");
retArray.push("AiProtection_HomeSecurity.asp");
retArray.push("AiProtection_HomeProtection.asp");
retArray.push("AiProtection_WebProtector.asp");
retArray.push("AiProtection_AdBlock.asp");
retArray.push("AiProtection_Key_Guard.asp");
retArray.push("AiProtection_AdBlock.asp");
retArray.push("TrafficAnalyzer_Statistic.asp");
}
if(!traffic_analyzer_support){
retArray.push("TrafficAnalyzer_Statistic.asp");
}
if(!traffic_limiter_support){
retArray.push("AdaptiveQoS_TrafficLimiter.asp");
}
if(downsize_4m_support){
retArray.push("Main_ConnStatus_Content.asp");
retArray.push("Main_TrafficMonitor_realtime.asp");
}
if(!pptpd_support){
retArray.push("Advanced_VPN_PPTP.asp");
}
if(!openvpnd_support){
retArray.push("Advanced_VPN_OpenVPN.asp");
}
if(!ipsec_srv_support){
retArray.push("Advanced_VPN_IPSec.asp");
}
if(!vpnc_support){
retArray.push("Advanced_VPNClient_Content.asp");
}
if(!ParentalCtrl2_support){
retArray.push("ParentalControl.asp");
}
if(!yadns_support){
retArray.push("YandexDNS.asp");
}
if(!frs_feedback_support) {
retArray.push("Advanced_Feedback.asp");
retArray.push("Feedback_Info.asp");
}
if(noftp_support){
retArray.push("Advanced_AiDisk_ftp.asp");
}
if(!dualWAN_support){
retArray.push("Advanced_WANPort_Content.asp");
retArray.push("Advanced_Modem_Content.asp");
retArray.push("Advanced_MobileBroadband_Content.asp");
}
else{
if(!dualwan_enabled && usb_index == 0){
retArray.push("Advanced_WAN_Content.asp");
if(!gobi_support)
retArray.push("Advanced_MobileBroadband_Content.asp");
else
retArray.push("Advanced_Modem_Content.asp");
}
else{
retArray.push("Advanced_MobileBroadband_Content.asp");
retArray.push("Advanced_Modem_Content.asp");
}
}
if(!SwitchCtrl_support){
retArray.push("Advanced_SwitchCtrl_Content.asp");
}
if(!tr069_support){
retArray.push("Advanced_TR069_Content.asp");
}
if(!snmp_support){
retArray.push("Advanced_SNMP_Content.asp");
}
if(!nt_center_support){
retArray.push("Advanced_Notification_Content.asp");
}
if(!smart_connect_support){
retArray.push("Advanced_Smart_Connect.asp");
}
if(!adBlock_support){
retArray.push("AiProtection_AdBlock.asp");
}
if(!keyGuard_support){
retArray.push("AiProtection_Key_Guard.asp");
}
if(!tor_support){
retArray.push("Advanced_TOR_Content.asp");
}
if(!dsl_support) {
retArray.push("Advanced_DSL_Content.asp");
retArray.push("Advanced_VDSL_Content.asp");
retArray.push("Advanced_ADSL_Content.asp");
retArray.push("Main_AdslStatus_Content.asp");
retArray.push("Main_Spectrum_Content.asp");
}
else{
retArray.push("Advanced_WAN_Content.asp");
retArray.push("Advanced_VDSL_Content.asp");
retArray.push("Advanced_OperationMode_Content.asp");
if(!spectrum_support)
retArray.push("Main_Spectrum_Content.asp");
}
if(hwmodeSwitch_support){
retArray.push("Advanced_OperationMode_Content.asp");
}
if(noiptv_support){
retArray.push("Advanced_IPTV_Content.asp");
}
if(!media_support || nomedia_support){
retArray.push("mediaserver.asp");
}
if(!rog_support){
retArray.push("AdaptiveQoS_ROG.asp");
}
if(!wtfast_support && !gameMode_support){
retArray.push("GameBoost.asp");
}
if(!alexa_support){
retArray.push("Advanced_Smart_Home_Alexa.asp");
}
if(!ifttt_support){
retArray.push("Advanced_Smart_Home_IFTTT.asp");
}
if(!IPv6_support){
retArray.push("Main_IPV6Status_Content.asp");
}
if(!fbwifi_support){
retArray.push("Guest_network_fbwifi.asp");
}
if(!tagged_based_vlan){
retArray.push("Advanced_TagBasedVLAN_Content.asp");
retArray.push("Advanced_MultiSubnet_Content.asp");
}
else
retArray.push("Advanced_DHCP_Content.asp");
if((!Rawifi_support && ! Rtkwifi_support) || !concurrep_support || !isSwMode("re")){
retArray.push("Advanced_WProxy_Content.asp");
}
if(!captivePortal_support) {
retArray.push("Captive_Portal.asp");
retArray.push("Captive_Portal_Advanced.asp");
}
else {
if(!cp_freewifi_support)
retArray.push("Captive_Portal.asp");
if(!cp_advanced_support)
retArray.push("Captive_Portal_Advanced.asp");
}
if(!cooler_support){
retArray.push("Advanced_PerformanceTuning_Content.asp");
}
if(!rrsut_support)
retArray.push("cloud_router_sync.asp");
if(!amesh_support)
retArray.push("Advanced_Roaming_Block_Content.asp");
else{
if(ameshRouter_support){
if(!isSwMode("rt") && !isSwMode("ap"))
retArray.push("Advanced_Roaming_Block_Content.asp");
}
else if(ameshNode_support)
retArray.push("Advanced_Roaming_Block_Content.asp");
}
if(!fileflex_support)
retArray.push("fileflex.asp");
/* Operation Mode */
if(isSwMode("re")){
retArray.push("GameBoost.asp");
retArray.push("TrafficAnalyzer_Statistic.asp");
retArray.push("Advanced_DHCP_Content.asp");
retArray.push("Advanced_MultiSubnet_Content.asp");
retArray.push("Advanced_GWStaticRoute_Content.asp");
retArray.push("Advanced_IPTV_Content.asp");
retArray.push("Advanced_SwitchCtrl_Content.asp");
retArray.push("Main_DHCPStatus_Content.asp");
retArray.push("Main_IPV6Status_Content.asp");
retArray.push("Main_RouteStatus_Content.asp");
retArray.push("Main_IPTStatus_Content.asp");
retArray.push("Main_ConnStatus_Content.asp");
if(userRSSI_support){
retArray.push("Advanced_ACL_Content.asp");
if(!concurrep_support){
retArray.push("Advanced_Wireless_Content.asp");
}
retArray.push("Advanced_WWPS_Content.asp");
retArray.push("Advanced_WMode_Content.asp");
retArray.push("Advanced_WSecurity_Content.asp");
}
}
else if(isSwMode("ap")){
retArray.push("GameBoost.asp");
retArray.push("TrafficAnalyzer_Statistic.asp");
if(!dhcp_override_support){
retArray.push("Advanced_DHCP_Content.asp");
}
retArray.push("Advanced_MultiSubnet_Content.asp");
retArray.push("Advanced_GWStaticRoute_Content.asp");
retArray.push("Advanced_IPTV_Content.asp");
retArray.push("Advanced_SwitchCtrl_Content.asp");
retArray.push("Main_DHCPStatus_Content.asp");
retArray.push("Main_IPV6Status_Content.asp");
retArray.push("Main_RouteStatus_Content.asp");
retArray.push("Main_IPTStatus_Content.asp");
retArray.push("Main_ConnStatus_Content.asp");
retArray.push("Captive_Portal.asp");
retArray.push("Captive_Portal_Advanced.asp");
retArray.push("Guest_network_fbwifi.asp");
}
else if(isSwMode("mb")){
retArray.push("GameBoost.asp");
retArray.push("TrafficAnalyzer_Statistic.asp");
retArray.push("Advanced_DHCP_Content.asp");
retArray.push("Advanced_MultiSubnet_Content.asp");
retArray.push("Advanced_GWStaticRoute_Content.asp");
retArray.push("Advanced_IPTV_Content.asp");
retArray.push("Advanced_SwitchCtrl_Content.asp");
retArray.push("Main_DHCPStatus_Content.asp");
retArray.push("Main_IPV6Status_Content.asp");
retArray.push("Main_RouteStatus_Content.asp");
retArray.push("Main_IPTStatus_Content.asp");
retArray.push("Main_ConnStatus_Content.asp");
retArray.push("Advanced_Smart_Connect.asp");
}
/* System Status Changed */
/* MODELDEP */
if(based_modelid == "RT-N10U"){
retArray.push("Advanced_WMode_Content.asp");
}
else if(based_modelid == "RT-AC87U" && '<% nvram_get("wl_unit"); %>' == '1'){
retArray.push("Advanced_WSecurity_Content.asp");
}
else if(based_modelid == "RT-N300"){
retArray.push("Advanced_WMode_Content.asp");
retArray.push("Advanced_IPTV_Content.asp");
}
if(lyra_hide_support){
retArray.push("AiProtection_HomeSecurity.asp");
retArray.push("AiProtection_WebProtector.asp");
retArray.push("ParentalControl.asp");
retArray.push("Advanced_OperationMode_Content.asp");
retArray.push("QoS_EZQoS.asp");
retArray.push("AdaptiveQoS_WebHistory.asp");
retArray.push("Advanced_DHCP_Content.asp");
}
return retArray;
}
}
}
if(odmpid == "RT-N66U_C1"){
menuTree.list.splice(7,2);
}
else{
menuTree.list.splice(5,2);
}
return menuTree;
});

