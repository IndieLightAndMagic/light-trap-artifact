
var base_width = 1080
var base_height = 1920


var osx_width_factor = 4
var osx_height_factor = 4

var android_width_factor = 10
var android_height_factor = 10 


var screenResolutions = { "R360x640":{w:360,h:640} ,"R768x1024":{w:768,h:1024}    ,"R320x568":{w:320,h:568} ,"R480x800":{w:480,h:800} ,"R320x480":{w:320,h:480} ,"R720x1280":{w:720,h:1280}    ,"R375x667":{w:375,h:667} ,"R320x534":{w:320,h:534} ,"R800x600":{w:800,h:600} ,"R240x320":{w:240,h:320} ,"R540x960":{w:540,h:960} ,"R480x854":{w:480,h:854} ,"R1280x800":{w:1280,h:800}    ,"R640x360":{w:640,h:360} ,"R414x736":{w:414,h:736} ,"R360x592":{w:360,h:592} ,"R320x570":{w:320,h:570} ,"R1080x1920":{w:1080,h:1920}   ,"R320x240":{w:320,h:240} ,"R600x1024":{w:600,h:1024}    ,"R300x371":{w:300,h:371} ,"R800x1280":{w:800,h:1280}    ,"R1024x600":{w:1024,h:600}    ,"R128x160":{w:128,h:160} ,"R601x962":{w:601,h:962} ,"R357x595":{w:357,h:595} ,"R290x305":{w:290,h:305} ,"R800x480":{w:800,h:480} ,"R300x405":{w:300,h:405} ,"R720x1184":{w:720,h:1184}    ,"R320x401":{w:320,h:401} ,"R600x976":{w:600,h:976} ,"R962x601":{w:962,h:601} ,"R240x400":{w:240,h:400} ,"R338x563":{w:338,h:563} ,"R320x455":{w:320,h:455} ,"R1024x768":{w:1024,h:768}    ,"R534x320":{w:534,h:320} ,"R320x522":{w:320,h:522} ,"R218x189":{w:218,h:189} ,"R384x640":{w:384,h:640} ,"R360x598":{w:360,h:598} ,"R480x801":{w:480,h:801} ,"R1280x752":{w:1280,h:752}    ,"R1364x768":{w:1364,h:768}    ,"R1024x552":{w:1024,h:552}    ,"R1366x768":{w:1366,h:768}    ,"R480x360":{w:480,h:360} ,"R540x888":{w:540,h:888} ,"R320x202":{w:320,h:202} ,"R1280x720":{w:1280,h:720}    ,"R240x282":{w:240,h:282} ,"R240x332":{w:240,h:332} ,"R480x782":{w:480,h:782} ,"R342x487":{w:342,h:487} ,"R240x232":{w:240,h:232} ,"R320x341":{w:320,h:341} ,"R128x133":{w:128,h:133} ,"R300x391":{w:300,h:391} ,"R598x360":{w:598,h:360} ,"R721x1280":{w:721,h:1280}    ,"R600x960":{w:600,h:960} ,"R122x133":{w:122,h:133} ,"R320x508":{w:320,h:508} ,"R854x534":{w:854,h:534} ,"R314x200":{w:314,h:200} ,"R383x638":{w:383,h:638} ,"R960x600":{w:960,h:600} ,"R1080x1776":{w:1080,h:1776}   ,"R240x276":{w:240,h:276} ,"R330x549":{w:330,h:549} ,"R360x480":{w:360,h:480} ,"R320x427":{w:320,h:427} ,"R480x855":{w:480,h:855} ,"R320x450":{w:320,h:450} ,"R1920x1080":{w:1920,h:1080}   ,"R534x854":{w:534,h:854} ,"R228x240":{w:228,h:240} ,"R403x671":{w:403,h:671} ,"R343x571":{w:343,h:571} ,"R1280x1024":{w:1280,h:1024}   ,"R320x490":{w:320,h:490} ,"R320x533":{w:320,h:533} ,"R234x282":{w:234,h:282} ,"R240x229":{w:240,h:229} ,"R337x471":{w:337,h:471} ,"R480x320":{w:480,h:320} ,"R480x853":{w:480,h:853} ,"R325x541":{w:325,h:541} ,"R1440x2560":{w:1440,h:2560}   ,"R347x347":{w:347,h:347} ,"R234x280":{w:234,h:280} ,"R1280x768":{w:1280,h:768}    ,"R240x297":{w:240,h:297} ,"R601x914":{w:601,h:914} ,"R282x349":{w:282,h:349} ,"R300x433":{w:300,h:433} ,"R396x660":{w:396,h:660} ,"R640x480":{w:640,h:480} ,"R481x854":{w:481,h:854} ,"R570x320":{w:570,h:320} ,"R364x606":{w:364,h:606} ,"R320x196":{w:320,h:196} ,"R360x594":{w:360,h:594} ,"R300x372":{w:300,h:372} ,"R541x960":{w:541,h:960} ,"R487x866":{w:487,h:866} ,"R230x285":{w:230,h:285} ,"R290x331":{w:290,h:331} ,"R240x231":{w:240,h:231} ,"R240x270":{w:240,h:270} ,"R768x1280":{w:768,h:1280}    ,"R320x219":{w:320,h:219} ,"R481x800":{w:481,h:800} ,"R800x1232":{w:800,h:1232}    ,"R960x540":{w:960,h:540} ,"R246x258":{w:246,h:258} ,"R1081x1920":{w:1081,h:1920}   ,"R230x269":{w:230,h:269} ,"R377x628":{w:377,h:628} ,"R403x716":{w:403,h:716} ,"R240x312":{w:240,h:312} ,"R320x452":{w:320,h:452} ,"R854x480":{w:854,h:480} ,"R228x282":{w:228,h:282} ,"R218x211":{w:218,h:211} ,"R122x160":{w:122,h:160} ,"R320x192":{w:320,h:192} ,"R383x640":{w:383,h:640} ,"R320x395":{w:320,h:395} ,"R720x1208":{w:720,h:1208}    ,"R480x762":{w:480,h:762} ,"R360x591":{w:360,h:591} ,"R342x500":{w:342,h:500} ,"R300x425":{w:300,h:425} ,"R300x370":{w:300,h:370} ,"R310x415":{w:310,h:415} ,"R480x752":{w:480,h:752} ,"R960x544":{w:960,h:544} ,"R300x360":{w:300,h:360} ,"R122x146":{w:122,h:146} ,"R360x503":{w:360,h:503} ,"R314x220":{w:314,h:220} ,"R962x553":{w:962,h:553} ,"R240x279":{w:240,h:279} ,"R320x488":{w:320,h:488} ,"R1360x768":{w:1360,h:768}    ,"R400x640":{w:400,h:640} ,"R412x732":{w:412,h:732} ,"R391x695":{w:391,h:695} ,"R230x275":{w:230,h:275} ,"R240x268":{w:240,h:268} ,"R800x1003":{w:800,h:1003}    ,"R320x200":{w:320,h:200} ,"R290x372":{w:290,h:372} ,"R320x194":{w:320,h:194} ,"R240x274":{w:240,h:274} ,"R320x339":{w:320,h:339} ,"R320x217":{w:320,h:217} ,"R768x976":{w:768,h:976} ,"R1024x720":{w:1024,h:720}    ,"R234x300":{w:234,h:300} ,"R480x331":{w:480,h:331} ,"R240x272":{w:240,h:272} ,"R480x806":{w:480,h:806} ,"R218x190":{w:218,h:190} ,"R128x125":{w:128,h:125} ,"R480x640":{w:480,h:640} ,"R360x601":{w:360,h:601} ,"R1067x592":{w:1067,h:592}    ,"R342x441":{w:342,h:441} ,"R282x356":{w:282,h:356} ,"R218x242":{w:218,h:242} ,"R128x130":{w:128,h:130} ,"R337x426":{w:337,h:426} ,"R181x52":{w:181,h:52}  ,"R176x208":{w:176,h:208} ,"R234x301":{w:234,h:301} ,"R320x403":{w:320,h:403} ,"R240x301":{w:240,h:301} ,"R122x125":{w:122,h:125} ,"R320x496":{w:320,h:496} ,"R128x146":{w:128,h:146} ,"R386x643":{w:386,h:643} ,"R300x18":{w:300,h:18}  ,"R337x491":{w:337,h:491} ,"R240x298":{w:240,h:298} ,"R240x260":{w:240,h:260} ,"R228x308":{w:228,h:308} ,"R1334x750":{w:1334,h:750}    ,"R282x381":{w:282,h:381} ,"R240x280":{w:240,h:280} ,"R540x330":{w:540,h:330} ,"R1920x1200":{w:1920,h:1200}   ,"R800x432":{w:800,h:432} ,"R310x407":{w:310,h:407} ,"R320x544":{w:320,h:544} ,"R320x569":{w:320,h:569} ,"R1600x900":{w:1600,h:900}    ,"R375x562":{w:375,h:562} ,"R800x1138":{w:800,h:1138}    ,"R369x456":{w:369,h:456} ,"R230x279":{w:230,h:279} ,"R239x267":{w:239,h:267} ,"R240x382":{w:240,h:382} ,"R300x467":{w:300,h:467} ,"R240x381":{w:240,h:381} ,"R240x271":{w:240,h:271} ,"R360x604":{w:360,h:604} ,"R128x127":{w:128,h:127} ,"R540x912":{w:540,h:912} ,"R600x912":{w:600,h:912} ,"R4553x2560":{w:4553,h:2560}   ,"R122x142":{w:122,h:142} ,"R230x265":{w:230,h:265} ,"R387x688":{w:387,h:688} ,"R480x744":{w:480,h:744} ,"R320x221":{w:320,h:221} ,"R342x542":{w:342,h:542} ,"R356x593":{w:356,h:593} ,"R400x592":{w:400,h:592} ,"R800x853":{w:800,h:853} ,"R640x1019":{w:640,h:1019}    ,"R960x552":{w:960,h:552} ,"R320x218":{w:320,h:218} ,"R122x126":{w:122,h:126} ,"R480x816":{w:480,h:816} ,"R230x320":{w:230,h:320} ,"R176x220":{w:176,h:220} ,"R601x911":{w:601,h:911} ,"R360x600":{w:360,h:600} ,"R310x431":{w:310,h:431} ,"R300x250":{w:300,h:250} ,"R360x378":{w:360,h:378} ,"R480x295":{w:480,h:295} ,"R218x195":{w:218,h:195} ,"R234x320":{w:234,h:320} ,"R263x50":{w:263,h:50}  ,"R1196x720":{w:1196,h:720}    ,"R230x287":{w:230,h:287} ,"R228x245":{w:228,h:245} ,"R1152x1920":{w:1152,h:1920}   ,"R230x283":{w:230,h:283} ,"R1080x1800":{w:1080,h:1800}   ,"R234x274":{w:234,h:274} ,"R1200x1920":{w:1200,h:1920}   ,"R320x367":{w:320,h:367} ,"R310x480":{w:310,h:480} ,"R314x202":{w:314,h:202} ,"R300x375":{w:300,h:375} ,"R320x426":{w:320,h:426} ,"R568x320":{w:568,h:320} ,"R371x619":{w:371,h:619} ,"R320x526":{w:320,h:526} ,"R423x601":{w:423,h:601} ,"R313x522":{w:313,h:522} ,"R300x500":{w:300,h:500} ,"R240x299":{w:240,h:299} ,"R640x330":{w:640,h:330} ,"R361x642":{w:361,h:642} ,"R263x37":{w:263,h:37}  ,"R505x505":{w:505,h:505} ,"R230x261":{w:230,h:261} ,"R128x126":{w:128,h:126}}
var hrScreenResolutions = {}



function aspectRatio(w,h){

    var tap = w <= h ? w : h
    for (var div=tap;div>=2;div--){

        if (w%div!=0 || h%div!=0) continue
        w /= div
        h /= div 
        break
    } 
    return [w,h]
}

function humanReadableRatio(w,h){
    
    var aratio = aspectRatio(w,h)
    w = aratio[0]
    h = aratio[1]
    return (w>h ?"L":"P")+"A"+String(w)+":"+String(h)
    
}

function setAspectRatio(screen,window,w,h){
    
    var orientation = "LA" //Landscape
    if (w<=h) orientation = "PA" //Portrait        
    
    var screenx = screen.width
    var screeny = screen.height
    
    var aspectKey = orientation + String(w)+":"+String(h)
    var resolutionListSelected = [window.width, window.height] 
    console.log(aspectKey ,Object.keys(hrScreenResolutions))
    var resolutionPixels = 0
    
    
    
    for (var resolutionKeyIndex in hrScreenResolutions[aspectKey].resolution_list){
        var resolutionKey = hrScreenResolutions[aspectKey].resolution_list[resolutionKeyIndex]
        var resolutionList = resolutionKey.split('R')[1].split('x')
        if ((screenx)>Number(resolutionList[0]) && (screeny)>Number(resolutionList[1])){
            if (resolutionPixels<(resolutionList[0]*resolutionList[1])){
                resolutionPixels = resolutionList[0]*resolutionList[1]
                resolutionListSelected = resolutionList
            }
        }
    }
    console.log(resolutionListSelected)
    window.width = resolutionListSelected[0]
    window.height = resolutionListSelected[1]
    return resolutionListSelected
}

function responsiveStartUp(qtCtxt,screen,window,aspectRatioW,aspectRatioH){

    console.log("responsiveStartUp")
    console.log("")
    console.log("Responsiveness Check")
    console.log("----------------------------\n")
    console.log("Operative System Found: ",qtCtxt.platform.os)
    
    console.log("Window dimensions:")
	console.log(window.width, window.height)
    console.log("Screen Dimensions:")
    console.log(screen.width, screen.height)    
    
    if (qtCtxt.platform.os != "osx") return Qt.vector2d(1.0, 1.0);
    
    console.log("osx host ",window.width,"x",window.height,"emulating a ",aspectRatioW,":",aspectRatioH," mobile device")
    
    /* Check Screen resolutions */
    for (var key in screenResolutions){
        var aspectKey = humanReadableRatio(screenResolutions[key].w,screenResolutions[key].h)
        if (aspectKey in hrScreenResolutions){
            hrScreenResolutions[aspectKey].resolution_list.push(key)
            hrScreenResolutions[aspectKey].count++
            
        } else {
            hrScreenResolutions[aspectKey] = {resolution_list:[key], count:1}
        } 

        
    }
    var keystodelete = []
    for (var key in hrScreenResolutions){
        if (hrScreenResolutions[key].count<3){
            keystodelete.push(key)    
            continue
        }
    }
    for (var key in keystodelete){
        delete hrScreenResolutions[keystodelete[key]]
    }
    for (var key in hrScreenResolutions){
        if (key[0]=='L')
            console.log(key,":(",hrScreenResolutions[key].count,")",hrScreenResolutions[key].resolution_list)
            
    }    
    for (var key in hrScreenResolutions){
        if (key[0]=='P')
            console.log(key,":(",hrScreenResolutions[key].count,")",hrScreenResolutions[key].resolution_list)
    }    
    setAspectRatio(screen,window,aspectRatioW,aspectRatioH)  
    console.log("osx host ",window.width,"x",window.height,"emulating a ",aspectRatioW,":",aspectRatioH," mobile device")
    
    window.y = 0
    window.x = screen.width/2 - window.width/2
    return Qt.vector2d(window.width/Responsive.base_width, window.height/Responsive.base_height)
    
}
