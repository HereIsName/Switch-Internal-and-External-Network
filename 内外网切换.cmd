@rem 将以下代码加入bat文件开始处
@rem 即可在运行bat文件时获取管理员权限

@%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

@rem 在获取了管理员权限后，bat文件的执行路径会被修改为cmd所在的绝对路径
@rem 修改当前路径为bat脚本所在路径
@set CURRENT_PATH=/d %~dp0

@cd %CURRENT_PATH%
@echo.  
@set choose=
@set /p choose=-----请选择操作 [1、开启内网 2、开启外网]^:  

@if /i "%choose%"=="1" goto START_neiwang_Y
@if /i "%choose%"=="2" goto START_waiwang_Y

@echo.   

:START_neiwang
@set choose1=
@set /p choose1=-----是否启动内网 [1、启动 2、退出]^:  
@if /i "%choose1%"=="1" goto START_neiwang_Y
@if /i "%choose1%"=="2" goto PATCH_END
@goto START_neiwang

:START_neiwang_Y
@echo 正在修改IP地址....
@netsh interface ip set address name="以太网" source=static addr=192.168.10.50 mask=255.255.255.0 gateway=192.168.10.1
@echo 切换修改成功 现在是内网 IP=192.168.10.50
@goto PATCH_END

:START_waiwang
@set choose2=
@set /p choose2=-----是否启动外网 [1、启动 2、退出]^:  
@if /i "%choose2%"=="1" goto START_waiwang_Y
@if /i "%choose2%"=="2" goto PATCH_END
@goto START_waiwang

:START_waiwang_Y
@echo 正在修改IP地址....
@netsh interface ip set address name="以太网" source=static addr=192.168.7.50 mask=255.255.255.0 gateway=192.168.7.1
@echo 切换修改成功 现在是外网 IP=192.168.7.50

:PATCH_END
@echo 内外网切换结束
@pause