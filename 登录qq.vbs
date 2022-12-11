Dim wsh,QQPath
QQPath="""C:\Program Files (x86)\Tencent\QQ\Bin\QQ.exe""" 'ÄãµÄQQµÄÂ·¾¶
Set wsh=WScript.CreateObject("WScript.Shell")
wsh.Run QQPath
WScript.Sleep 2000
wsh.SendKeys "{Delete}"
for x=1 to 14
WScript.Sleep 300
wsh.SendKeys "^{Tab}"
next
wsh.SendKeys "{Delete}"
WScript.Sleep 300
wsh.SendKeys "2140558995"
WScript.Sleep 300
wsh.SendKeys "{enter}"
wsh.SendKeys "2174323146t"
wsh.SendKeys "{enter}"
WScript.Sleep 5000
wsh.sendkeys "tao"
WScript.Sleep 1700
wsh.SendKeys "{enter}"
WScript.Sleep 1700
wsh.SendKeys "{enter}"
WScript.Sleep 1700
for x=0 To 3
wscript.sleep 1000
wsh.SendKeys "nihao1"
wsh.sendkeys "%s"	
next						
