@rem �����´������bat�ļ���ʼ��
@rem ����������bat�ļ�ʱ��ȡ����ԱȨ��

@%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

@rem �ڻ�ȡ�˹���ԱȨ�޺�bat�ļ���ִ��·���ᱻ�޸�Ϊcmd���ڵľ���·��
@rem �޸ĵ�ǰ·��Ϊbat�ű�����·��
@set CURRENT_PATH=/d %~dp0

@cd %CURRENT_PATH%
@echo.  
@set choose=
@set /p choose=-----��ѡ����� [1���������� 2����������]^:  

@if /i "%choose%"=="1" goto START_neiwang_Y
@if /i "%choose%"=="2" goto START_waiwang_Y

@echo.   

:START_neiwang
@set choose1=
@set /p choose1=-----�Ƿ��������� [1������ 2���˳�]^:  
@if /i "%choose1%"=="1" goto START_neiwang_Y
@if /i "%choose1%"=="2" goto PATCH_END
@goto START_neiwang

:START_neiwang_Y
@echo �����޸�IP��ַ....
@netsh interface ip set address name="��̫��" source=static addr=192.168.10.50 mask=255.255.255.0 gateway=192.168.10.1
@echo �л��޸ĳɹ� ���������� IP=192.168.10.50
@goto PATCH_END

:START_waiwang
@set choose2=
@set /p choose2=-----�Ƿ��������� [1������ 2���˳�]^:  
@if /i "%choose2%"=="1" goto START_waiwang_Y
@if /i "%choose2%"=="2" goto PATCH_END
@goto START_waiwang

:START_waiwang_Y
@echo �����޸�IP��ַ....
@netsh interface ip set address name="��̫��" source=static addr=192.168.7.50 mask=255.255.255.0 gateway=192.168.7.1
@echo �л��޸ĳɹ� ���������� IP=192.168.7.50

:PATCH_END
@echo �������л�����
@pause