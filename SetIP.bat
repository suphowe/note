===================��======��=====��==================
@echo off
rem ǿ�ƻ�ȡ����ԱȨ��
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

@echo off
:start
echo ============����������ѡ����һ������:
echo ============1��ip����Ϊ44.46.72.230(���ݸ����϶���)
echo ============2��ip����Ϊ172.25.1.124(���ݸ��ٻ��Ͽ���)
echo ============3������ΪDHCP�Զ���ȡip
set /P var=":"
if %var%==1 goto ipNanErHuan
if %var%==2 goto ipHuaNanKuaiSu
if %var%==3 goto ipdhcp
:ipNanErHuan
cls
netsh interface ip set address name="��̫��" static 44.46.72.230 255.255.255.0 44.46.72.1
echo **���ݸ����϶��� IP����Ϊ44.46.72.230�����óɹ�**
echo ------------------------------------------
goto start
:ipHuaNanKuaiSu
cls
netsh interface ip set address name="��̫��" static 192.169.0.129 255.255.255.0 192.169.0.64
cmd /c netsh interface ip set dns "��̫��" static 114.114.114.114
echo **���ݸ��ٻ��Ͽ��� IP����Ϊ192.169.0.129�����óɹ�**
echo ------------------------------------------
goto start
:ipdhcp
cls
netsh interface ip set address name="��̫��" source=dhcp
netsh interface ip delete dns "��̫��" all
ipconfig /flushdns
echo **IP����ΪDHCP��ȡ�����óɹ�**
echo ------------------------------------------
goto start
===================��=====��=====��===================