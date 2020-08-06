===================分======界=====线==================
@echo off
rem 强制获取管理员权限
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

@echo off
:start
echo ============请输入数字选择下一步操作:
echo ============1：ip设置为44.46.72.230(广州高速南二环)
echo ============2：ip设置为172.25.1.124(广州高速华南快速)
echo ============3：设置为DHCP自动获取ip
set /P var=":"
if %var%==1 goto ipNanErHuan
if %var%==2 goto ipHuaNanKuaiSu
if %var%==3 goto ipdhcp
:ipNanErHuan
cls
netsh interface ip set address name="以太网" static 44.46.72.230 255.255.255.0 44.46.72.1
echo **广州高速南二环 IP设置为44.46.72.230，设置成功**
echo ------------------------------------------
goto start
:ipHuaNanKuaiSu
cls
netsh interface ip set address name="以太网" static 192.169.0.129 255.255.255.0 192.169.0.64
cmd /c netsh interface ip set dns "以太网" static 114.114.114.114
echo **广州高速华南快速 IP设置为192.169.0.129，设置成功**
echo ------------------------------------------
goto start
:ipdhcp
cls
netsh interface ip set address name="以太网" source=dhcp
netsh interface ip delete dns "以太网" all
ipconfig /flushdns
echo **IP设置为DHCP获取，设置成功**
echo ------------------------------------------
goto start
===================分=====界=====线===================