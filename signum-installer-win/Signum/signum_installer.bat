@echo off
setlocal ENABLEEXTENSIONS
cd %~dp0

set "SIGNUM_STARTER_BAT=start_signum.bat"

set "SIGNUM_NODE_DIR=node"	

set "SIGNUM_MAINNET_VERSION=v3.8.2"
set "SIGNUM_MAINNET_DIR=mainnet"
set "SIGNUM_MAINNET_DIR_PATH=%SIGNUM_MAINNET_DIR%\%SIGNUM_NODE_DIR%"
set "SIGNUM_MAINNET_ZIP=signum-node-%SIGNUM_MAINNET_VERSION%-win_x64.zip"
set "SIGNUM_MAINNET_UNZIP=signum-node-%SIGNUM_MAINNET_VERSION%-win_x64"
set "SIGNUM_MAINNET_STARTER_BAT_PATH=%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_UNZIP%\%SIGNUM_STARTER_BAT%"
set "SIGNUM_MAINNET_URL=https://github.com/signum-network/signum-node/releases/download/%SIGNUM_MAINNET_VERSION%/%SIGNUM_MAINNET_ZIP%"

set "SIGNUM_TESTNET_VERSION=v3.8.2"
set "SIGNUM_TESTNET_DIR=testnet"
set "SIGNUM_TESTNET_DIR_PATH=%SIGNUM_TESTNET_DIR%\%SIGNUM_NODE_DIR%"
set "SIGNUM_TESTNET_ZIP=signum-node-%SIGNUM_TESTNET_VERSION%-win_x64.zip"
set "SIGNUM_TESTNET_UNZIP=signum-node-%SIGNUM_TESTNET_VERSION%-win_x64"
set "SIGNUM_TESTNET_STARTER_BAT_PATH=%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_UNZIP%\%SIGNUM_STARTER_BAT%"
set "SIGNUM_TESTNET_URL=https://github.com/signum-network/signum-node/releases/download/%SIGNUM_TESTNET_VERSION%/%SIGNUM_TESTNET_ZIP%"
	
set "MAINNET_DEFAULT_PROPERTIES=.\%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_UNZIP%\conf\node-default.properties"
set "MAINNET_PROPERTIES=.\%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_UNZIP%\conf\node.properties"
	
set "TESTNET_DEFAULT_PROPERTIES=.\%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_UNZIP%\conf\node-default.properties"
set "TESTNET_PROPERTIES=.\%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_UNZIP%\conf\node.properties"

set "SIGNUM_MAINNET_MINER_VERSION="
set "SIGNUM_MAINNET_MINER_DIR="
set "SIGNUM_MAINNET_MINER_ZIP="
set "SIGNUM_MAINNET_MINER_UNZIP="
set "SIGNUM_MAINNET_MINER_STARTER_BAT_PATH="
set "SIGNUM_MAINNET_MINER_URL="

set "SIGNUM_TESTNET_MINER_VERSION="
set "SIGNUM_TESTNET_MINER_DIR="
set "SIGNUM_TESTNET_MINER_ZIP="
set "SIGNUM_TESTNET_MINER_UNZIP="
set "SIGNUM_TESTNET_MINER_STARTER_BAT_PATH="
set "SIGNUM_TESTNET_MINER_URL="

set "SIGNUM_MAINNET_MINER_YAML="
set "SIGNUM_TESTNET_MINER_YAML="

set "SIGNUM_PLOTTER_VERSION="
set "SIGNUM_PLOTTER_DIR="
set "SIGNUM_PLOTTER_ZIP="
set "SIGNUM_PLOTTER_UNZIP="
set "SIGNUM_PLOTTER_STARTER_BAT_PATH="
set "SIGNUM_PLOTTER_URL="

set "BTDEX_VERSION=v0.6.8"
set "BTDEX_DIR=btdex"
set "BTDEX_EXE=btdex-%BTDEX_VERSION%-win.exe"
set "BTDEX_EXE_PATH=%BTDEX_DIR%\%BTDEX_EXE%"
set "BTDEX_URL=https://github.com/btdex/btdex/releases/download/%BTDEX_VERSION%/%BTDEX_EXE%"

set "PHOENIX_VERSION=1.5.0-beta.3"
set "PHOENIX_DIR=phoenix"
set "PHOENIX_EXE=win-phoenix-signum-wallet.%PHOENIX_VERSION%.exe"
set "PHOENIX_EXE_PATH=%PHOENIX_DIR%\%PHOENIX_EXE%"
set "PHOENIX_URL=https://github.com/signum-network/phoenix/releases/download/desktop-%PHOENIX_VERSION%/win-phoenix-signum-wallet.%PHOENIX_VERSION%.exe"
	
set "MARIADB_STARTER_BAT=start_mariadb.bat"	

set "DATABASE_DIR=database"

set "MARIADB_VERSION=10.6.20"
set "MARIADB_DIR=MariaDB"	
set "MARIADB_ZIP=mariadb-%MARIADB_VERSION%-winx64.zip"
set "MARIADB_UNZIP=mariadb-%MARIADB_VERSION%-winx64"
set "MARIADB_BIN=%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\bin"
set "MARIADB_STARTER_BAT_PATH=%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\%MARIADB_STARTER_BAT%"
set "MARIADB_URL=https://archive.mariadb.org/mariadb-10.6.20/winx64-packages/mariadb-10.6.20-winx64.zip"
	
set "TOOLS_DIR=tools"
	
set "HEIDISQL_VERSION=12.8_64"	
set "HEIDISQL_DIR=HeidiSQL"
set "HEIDISQL_ZIP=HeidiSQL_%HEIDISQL_VERSION%_Portable.zip"
set "HEIDISQL_UNZIP=HeidiSQL_%HEIDISQL_VERSION%_Portable"
set "HEIDISQL_EXE=heidisql.exe"
set "HEIDISQL_EXE_PATH=%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_UNZIP%\%HEIDISQL_EXE%"
set "HEIDISQL_URL=https://www.heidisql.com/downloads/releases/HeidiSQL_12.8_64_Portable.zip"

:install_menu

	cls
	echo =====================================================
	echo            Welcome to the Signum Installer
	echo =====================================================
	echo Please select an option:
	echo [1] Install Signum Mainnet with MariaDB
	echo [2] Install Signum Testnet with MariaDB
	echo [3] Install BTDEX
	echo [4] Install Phoenix
	echo [5] Install MariaDB
	echo [6] Install HeidiSQL
	echo -----------------------------------------------------
	echo [7] Signum Starter Menu
	echo [8] Exit
	echo =====================================================

	set "choice="
	set /p choice="Enter your choice (1-8): "

	if "%choice%"=="1" (
		if exist "%SIGNUM_MAINNET_STARTER_BAT_PATH%" (
			echo Signum Mainnet already installed.
			pause
			goto :install_menu
		) else (
			call :install_promt "Signum Mainnet" :install_mainnet
		)
	) else if "%choice%"=="2" (
		if exist "%SIGNUM_TESTNET_STARTER_BAT_PATH%" (
			echo Signum Testnet already installed.
			pause
			goto :install_menu
		) else (
			call :install_promt "Signum Testnet" :install_testnet
		)
	) else if "%choice%"=="3" ( 
		if exist "%BTDEX_EXE_PATH%" (
			echo BTDEX already installed.
			pause
			goto :install_menu
		) else (
			call :install_promt BTDEX :install_btdex
		)
	) else if "%choice%"=="4" (
		if exist "%PHOENIX_EXE_PATH%" (
			echo Phoenix already installed.
			pause
			goto :install_menu
		) else (
			call :install_promt Phoenix :install_phoenix
		)
	) else if "%choice%"=="5" (
		if exist "%MARIADB_STARTER_BAT_PATH%" (
			echo MariaDB already installed.
			pause
			goto :install_menu
		) else (
			call :install_promt MariaDB :install_mariadb
			pause
			goto :install_menu
		)
	) else if "%choice%"=="6" (
		if exist "%HEIDISQL_EXE_PATH%" (
			echo HeidiSQL already installed.
			pause
			goto :install_menu
		) else (
			call :install_promt HeidiSQL :install_heidisql
		)
	) else if "%choice%"=="7" (
		goto start_menu
	) else if "%choice%"=="8" (
		goto exit
	) else (
		echo Invalid choice! Please try again.
		pause
		goto install_menu
	)

:start_menu

	cls
	echo =====================================================
	echo                 Start Signum Node
	echo =====================================================
	echo Please select an option:
	echo [1] Start Signum Node Mainnet with MariaDB
	echo [2] Start Signum Node Testnet with MariaDB
	echo [3] Start BTDEX
	echo [4] Start Phoenix
	echo [5] Start MariaDB
	echo [6] Start HeidiSQL

	echo -----------------------------------------------------
	echo [7] Signum Installer Menu
	echo [8] Exit
	echo =====================================================
	
	set "choice="
	set /p choice="Enter your choice (1-8): "

	if "%choice%"=="1" (
		If exist %SIGNUM_MAINNET_STARTER_BAT_PATH% (
			echo Starting Signum Mainnet with MariaDB
			start /min "" "%SIGNUM_MAINNET_STARTER_BAT_PATH%"
			pause
			goto start_menu
		) else (
			echo Signum Mainnet is not installed, please install first!
			pause
			goto install_mainnet
		)
	) else if "%choice%"=="2" ( 
		If exist %SIGNUM_TESTNET_STARTER_BAT_PATH% (
			echo Starting Signum Testnet with MariaDB
			start /min "" "%SIGNUM_TESTNET_STARTER_BAT_PATH%"
			pause
			goto start_menu
		) else (
			echo Signum Testnet is not installed, please install first!
			pause
			goto install_testnet
		)
	) else if "%choice%"=="3" ( 
		If exist %BTDEX_EXE_PATH% (
			echo Starting BTDEX
			start "" "%BTDEX_EXE_PATH%"
			pause
			goto start_menu
		) else (
			echo BTDEX is not installed, please install first!
			pause
			call :install_promt BTDEX :install_btdex
			pause
			goto start_menu
		)
	) else if "%choice%"=="4" (
		If exist %PHOENIX_EXE_PATH% (
			echo Starting MariaDB
			start /min "" "%PHOENIX_EXE_PATH%"
			pause
			goto start_menu
		) else (
			echo Phoenix is not installed, please install Phoenix first!
			pause
			call :install_promt Phoenix :install_phoenix
			pause
			goto start_menu
		)
			) else if "%choice%"=="5" (
		If exist %MARIADB_STARTER_BAT_PATH% (
			echo Starting MariaDB
			start /min "" "%MARIADB_STARTER_BAT_PATH%"
			pause
			goto start_menu
		) else (
			echo MariaDB is not installed please install MariaDB first!
			pause
			call :install_promt MariaDB :install_mariadb
			pause
			goto start_menu
		)
	) else if "%choice%"=="6" ( 
		If exist %HEIDISQL_EXE_PATH% (
			echo Starting HeidiSQL
			start "" "%HEIDISQL_EXE_PATH%"
			pause
			goto start_menu
		) else (
			echo Signum Testnet is not installed, please install first!
			pause
			call :install_promt HeidiSQL :install_heidisql
			pause
			goto start_menu
		)
	) else if "%choice%"=="7" ( 
		goto install_menu
	) else if "%choice%"=="8" ( 
		goto exit
	) else (
		echo Invalid choice! Please try again.
		pause
		goto start_menu
	)
	
:exit

	echo Press any key to exit Signum Installer. Goodbye!
	pause
	exit /b
	
:install_mainnet
			
    echo Installing Signum mainnet ...

	:: Create mainnet/testnet directory
    if not exist "%SIGNUM_MAINNET_DIR_PATH%" (
        mkdir "%SIGNUM_MAINNET_DIR_PATH%"
        echo Created directory: %SIGNUM_MAINNET_DIR_PATH%
    ) else (
        echo Directory already exists: %SIGNUM_MAINNET_DIR_PATH%
    )

	if exist "%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_ZIP%" (
        echo %SIGNUM_MAINNET_ZIP% already downloaded.
    ) else (
		:: Download the Signum mainnet zip file
		echo Downloading Signum from GitHub ...
		:: powershell -Command "Invoke-WebRequest -Uri '%SIGNUM_MAINNET_URL%' -OutFile '%SIGNUM_MAINNET_ZIP%'"
		powershell -Command "Start-BitsTransfer -Source '%SIGNUM_MAINNET_URL%' -Destination '%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_ZIP%'"
		
		:: Check if download was successful
		if not exist "%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_ZIP%" (
			echo Error: Failed to download Signum.
			pause
			goto :install_menu
		)
	)
	
	if exist "%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_UNZIP%" (
		echo %SIGNUM_MAINNET_UNZIP% already installed.
	) else (
		:: Unzip the downloaded file to the installation directory
		echo Unzipping Signum to %SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_ZIP%' -DestinationPath '%SIGNUM_MAINNET_DIR_PATH%\%SIGNUM_MAINNET_UNZIP%' -Force"
	)
	
	:: Copy node-default.properties to node.properties
	echo Copying %MAINNET_DEFAULT_PROPERTIES% to %MAINNET_PROPERTIES% ...
	copy "%MAINNET_DEFAULT_PROPERTIES%" "%MAINNET_PROPERTIES%" >nul
	
	:: Plans
	:: Adding more custom properties in case port should be changed (e.g. multiple node running using different databases)
	:: Idea Signum-MariaDB; Signum-PostGreSQL; Signum-H2; Signum-SQLight folders with different ports
	:: Newer idea using postfix for database identification signum-node-v3.8.2-win_x64-mariadb; signum-node-v3.8.2-win_x64-pasgresql
	:: Question: Is Testnet port change possible?

call :signum_starter_bat Mainnet %SIGNUM_MAINNET_STARTER_BAT_PATH%

call :install_mariadb

call :setup_mariadb Mainnet signum-mainnet %MAINNET_PROPERTIES%

	echo Signum Mainnet Installation complete.
	pause

	if not exist "%SIGNUM_TESTNET_STARTER_BAT_PATH%" (
		call :install_promt "Signum Testnet" :install_testnet
	)
	
goto :eof

:install_testnet

    echo Installing Signum Testnet ...
	
	:: Create mainnet/testnet directory
    if not exist "%SIGNUM_TESTNET_DIR_PATH%" (
        mkdir "%SIGNUM_TESTNET_DIR_PATH%"
        echo Created directory: %SIGNUM_TESTNET_DIR_PATH%
    ) else (
        echo Directory already exists: %SIGNUM_TESTNET_DIR_PATH%
    )

	if exist "%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_ZIP%" (
        echo %SIGNUM_TESTNET_ZIP% already downloaded.
    ) else (
		:: Download the Signum mainnet zip file
		echo Downloading Signum from GitHub ...
		:: powershell -Command "Invoke-WebRequest -Uri '%SIGNUM_TESTNET_URL%' -OutFile '%SIGNUM_TESTNET_ZIP%'"
		powershell -Command "Start-BitsTransfer -Source '%SIGNUM_TESTNET_URL%' -Destination '%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_ZIP%'"
		
		:: Check if download was successful
		if not exist "%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_ZIP%" (
			echo Error: Failed to download Signum.
			exit /b 1
		)
	)
	
	if exist "%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_UNZIP%" (
		echo %SIGNUM_TESTNET_UNZIP% already installed.
	) else (
		:: Unzip the downloaded file to the installation directory
		echo Unzipping Signum to %SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_ZIP%' -DestinationPath '%SIGNUM_TESTNET_DIR_PATH%\%SIGNUM_TESTNET_UNZIP%' -Force"
	)
	
	:: Copy node-default.properties to node.properties
	echo Copying %TESTNET_DEFAULT_PROPERTIES% to %TESTNET_PROPERTIES% ...
	copy "%TESTNET_DEFAULT_PROPERTIES%" "%TESTNET_PROPERTIES%" >nul
	
		:: Update node.properties with new database information
	echo Updating %TESTNET_PROPERTIES% with Testnet configurations ...

	powershell -Command "(Get-Content -Path '%TESTNET_PROPERTIES%') -replace '# node.network = signum.net.TestnetNetwork', 'node.network = signum.net.TestnetNetwork' | Set-Content -Path '%TESTNET_PROPERTIES%'"
	
	echo Update complete.
	
call :signum_starter_bat Testnet %SIGNUM_TESTNET_STARTER_BAT_PATH%
	
call :install_mariadb

call :setup_mariadb Testnet signum-testnet %TESTNET_PROPERTIES%
	
	echo Signum Testnet Installation complete.
	pause
	
	if not exist "%SIGNUM_MAINNET_STARTER_BAT_PATH%" (
		call :install_promt "Signum Mainnet" :install_mainnet
	)
	
goto :eof
	
:signum_starter_bat
	
	if not exist "%2%" (
		:: Create start_signum.bat file with the desired content
		echo cd %%~dp0 > "%2%"
		echo title Signum Node %1 >> "%2%"
		echo start /min ..\..\..\%MARIADB_STARTER_BAT_PATH% >> "%2%"
		echo timeout 10 >> "%2%"
		echo .\jre\bin\java -jar .\signum-node.jar >> "%2%"
		echo exit >> "%2%"

		:: Inform the user that the file has been created
		echo "%SIGNUM_STARTER_BAT%" successfully created.
	) else (
		echo File already exists: %SIGNUM_STARTER_BAT%
	)
	
goto :eof
	
:install_heidisql
	
	:: Create HeidiSQL directory
    if not exist "%TOOLS_DIR%\%HEIDISQL_DIR%" (
        mkdir "%TOOLS_DIR%\%HEIDISQL_DIR%"
        echo Created directory: %TOOLS_DIR%\%HEIDISQL_DIR%
    ) else (
        echo Directory already exists: %TOOLS_DIR%\%HEIDISQL_DIR%
    )
	
	if exist "%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_ZIP%" (
        echo %HEIDISQL_ZIP% already downloaded.
    ) else (
		:: Download the Signum mainnet zip file
		echo Downloading HeidiSQL ...
		:: powershell -Command "Invoke-WebRequest -Uri '%SIGNUM_MAINNET_URL%' -OutFile '%SIGNUM_MAINNET_ZIP%'"
		powershell -Command "Start-BitsTransfer -Source '%HEIDISQL_URL%' -Destination '%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_ZIP%'"
		
		:: Check if download was successful
		if not exist "%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_ZIP%" (
			echo Error: Failed to download HeidiSQL.
			pause
			goto install_menu
		)
	)
	
	if exist "%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_UNZIP%%" (
		echo %HEIDISQL_UNZIP% already installed.
	) else (
		:: Unzip the downloaded file to the installation directory
		echo Unzipping HeidiSQL to %TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_ZIP%' -DestinationPath '%TOOLS_DIR%\%HEIDISQL_DIR%\%HEIDISQL_UNZIP%' -Force"
		echo HeidiSQL installed successfully.
	)
	
goto :eof

:install_btdex

	:: Create btdex directory
    if not exist "%BTDEX_DIR%" (
        mkdir "%BTDEX_DIR%"
        echo Created directory: %BTDEX_DIR%
    ) else (
        echo Directory already exists: %BTDEX_DIR%
    )
	
	if exist "%BTDEX_EXE_PATH%" (
        echo %BTDEX_EXE% already installed.
    ) else (
		:: Download btdex exe file
		echo Downloading BTDEX ...
		powershell -Command "Start-BitsTransfer -Source '%BTDEX_URL%' -Destination '%BTDEX_EXE_PATH%'"
		
		:: Check if download was successful
		if not exist "%BTDEX_EXE_PATH%" (
			echo Error: Failed to download BTDEX.
			pause
			goto install_menu
		) else (
			echo BTDEX installed successfully.
		)
	)
	
goto :eof

:install_phoenix

	:: Create btdex directory
    if not exist "%PHOENIX_DIR%" (
        mkdir "%PHOENIX_DIR%"
        echo Created directory: %PHOENIX_DIR%
    ) else (
        echo Directory already exists: %PHOENIX_DIR%
    )
	
	if exist "%PHOENIX_EXE_PATH%" (
        echo %PHOENIX_EXE% already installed.
    ) else (
		:: Download btdex exe file
		echo Downloading BTDEX ...
		powershell -Command "Start-BitsTransfer -Source '%PHOENIX_URL%' -Destination '%PHOENIX_EXE_PATH%'"
		
		:: Check if download was successful
		if not exist "%PHOENIX_EXE_PATH%" (
			echo Error: Failed to download BTDEX.
			pause
			goto install_menu
		) else (
			echo Phoenix installed successfully.
		)
	)
	
goto :eof

:install_mariadb

call :install_heidisql
	
	if exist "%MARIADB_STARTER_BAT_PATH%" (
		echo MariaDB already installed!
		goto :eof
	)
	
	:: Create the installation directory if it doesn't exist
	if not exist "%DATABASE_DIR%\%MARIADB_DIR%" (
		mkdir "%DATABASE_DIR%\%MARIADB_DIR%"
	) else (
		echo Directory already exists: %DATABASE_DIR%\%MARIADB_DIR%
	)

	:: Check if database already exists
	if exist "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_ZIP%" (
		echo %MARIADB_ZIP% already downloaded.
	) else (
		:: Download MariaDB zip file
		echo Downloading MariaDB version %MARIADB_VERSION% ...
		:: powershell -Command "Invoke-WebRequest -Uri '%MARIADB_URL%' -OutFile 'mariadb.zip'"
		powershell -Command "Start-BitsTransfer -Source '%MARIADB_URL%' -Destination '%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_ZIP%'"
		
		:: Check if download was successful
		if not exist "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_ZIP%" (
			echo Error: Failed to download MariaDB version %MARIADB_VERSION%.
			pause
			goto install_menu
		)
	)
	
	if exist "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%" (
		echo %MARIADB_UNZIP% already installed.
	) else (
		:: Unzip MariaDB to the installation path
		echo Unzipping MariaDB to %DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_ZIP%' -DestinationPath '%DATABASE_DIR%\%MARIADB_DIR%' -Force"
	)

	:: Initialize the database if needed
	if not exist "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data" (
		mkdir "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data"
		echo Initializing MariaDB data directory ...
		:: "%MARIADB_BIN%\mysql_install_db.exe" --datadir=".\%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data" --basedir=".\%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%"
		"%MARIADB_BIN%\mysql_install_db.exe"
	) else (
		echo MariaDB data directory already initialized.
	)
	
	if not exist "%MARIADB_STARTER_BAT_PATH%" (
		:: Create start_mariadb.bat file with the desired content
		echo cd %%~dp0 > "%MARIADB_STARTER_BAT_PATH%"
		echo title MariaDB >> "%MARIADB_STARTER_BAT_PATH%"
		echo start /min "" .\bin\mariadbd.exe --no-defaults --console >> "%MARIADB_STARTER_BAT_PATH%"
		echo exit >> "%MARIADB_STARTER_BAT_PATH%"
		
		:: Inform the user that the file has been created
		echo "%MARIADB_STARTER_BAT%" successfully created.
	) else (
		echo File already exists: %MARIADB_STARTER_BAT%
	)
	
	goto :eof
	
:setup_mariadb

	:: Ask for user input for database name, username, and password
	set "DATABASE_NAME="
	set /p DATABASE_NAME="Enter Signum %1 database name (or press Enter for default %2): "
	if "%DATABASE_NAME%"=="" set DATABASE_NAME=%2
	echo Database name: %DATABASE_NAME%

	set "DATABASE_USERNAME="
	set /p DATABASE_USERNAME="Enter the username (or press Enter for default 'signumuser'): "
	if "%DATABASE_USERNAME%"=="" set DATABASE_USERNAME=signumuser
	echo Username: %DATABASE_USERNAME%

	set "DATABASE_PASSWORD="
	set /p DATABASE_PASSWORD="Enter the password (or press Enter for default 'signumpassword'): "
	if "%DATABASE_PASSWORD%"=="" set DATABASE_PASSWORD=signumpassword
	echo Password: %DATABASE_PASSWORD%

	:: Start the MariaDB server
	echo Starting MariaDB server ...
	:: start /min "" "%MARIADB_BIN%\mysqld.exe" --datadir=".\%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data" --console
	start /min "" "%MARIADB_BIN%\mysqld.exe" --no-defaults --console

	:: Wait for MariaDB to start
	timeout /t 10 >nul

	:: Create the specified database, user, and grant permissions
	echo Creating database: %DATABASE_NAME%
	"%MARIADB_BIN%\mysql.exe" --user=root --password= -e "CREATE DATABASE IF NOT EXISTS `%DATABASE_NAME%`;"

	echo Creating user: %DATABASE_USERNAME%
	"%MARIADB_BIN%\mysql.exe" --user=root --password= -e "CREATE USER IF NOT EXISTS '%DATABASE_USERNAME%'@'localhost' IDENTIFIED BY '%DATABASE_PASSWORD%';"

	echo Granting permissions to user %DATABASE_USERNAME% on database %DATABASE_NAME% ...
	"%MARIADB_BIN%\mysql.exe" --user=root --password= -e "GRANT ALL PRIVILEGES ON `%DATABASE_NAME%`.* TO '%DATABASE_USERNAME%'@'localhost';"
	"%MARIADB_BIN%\mysql.exe" --user=root --password= -e "FLUSH PRIVILEGES;"
		
	echo MariaDB setup complete.

	:: Update node.properties with new database information
	echo Updating %3 with new database configurations ...

	:: Use PowerShell to modify the file in place
	powershell -Command "(Get-Content -Path '%3') -replace '# DB.Url=jdbc:mariadb:.*', 'DB.Url=jdbc:mariadb://localhost:3306/%DATABASE_NAME%' -replace '# DB\.Username=.*', 'DB.Username=%DATABASE_USERNAME%' -replace '# DB\.Password=.*', 'DB.Password=%DATABASE_PASSWORD%' | Set-Content -Path '%3'"

	echo Update complete.
	
goto :eof

:install_promt

	:: Prompt user to install
	set "userChoice="
	set /p userChoice="Do you want to install %1? (yes/no): "

	:: Check the user's choice, accepting "yes", "y", or "Y"
	if /i "%userChoice%"=="yes" (
		goto %2
	) else if /i "%userChoice%"=="y" (
		goto %2
	) else if /i "%userChoice%"=="Y" (
		goto %2
	) else (
		echo %1 Installation canceled.
		goto :eof
	)
	
goto :eof

endlocal
