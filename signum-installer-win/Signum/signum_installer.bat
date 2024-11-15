@echo off
setlocal ENABLEEXTENSIONS
cd %~dp0

set "SIGNUM_STARTER_BAT=start_signum.bat"

set "SIGNUM_MAINNET_VERSION=v3.8.2"
set "SIGNUM_MAINNET_DIR=Mainnet"
set "SIGNUM_MAINNET_ZIP=signum-node-%SIGNUM_MAINNET_VERSION%-win_x64.zip"
set "SIGNUM_MAINNET_UNZIP=signum-node-%SIGNUM_MAINNET_VERSION%-win_x64"
set "SIGNUM_MAINNET_STARTER_BAT_PATH=%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_UNZIP%\%SIGNUM_STARTER_BAT%"
set "SIGNUM_MAINNET_URL=https://github.com/signum-network/signum-node/releases/download/v3.8.2/signum-node-v3.8.2-win_x64.zip"

set "SIGNUM_TESTNET_VERSION=v3.8.2"
set "SIGNUM_TESTNET_DIR=Testnet"
set "SIGNUM_TESTNET_ZIP=signum-node-%SIGNUM_TESTNET_VERSION%-win_x64.zip"
set "SIGNUM_TESTNET_UNZIP=signum-node-%SIGNUM_TESTNET_VERSION%-win_x64"
set "SIGNUM_TESTNET_STARTER_BAT_PATH=%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_UNZIP%\%SIGNUM_STARTER_BAT%"
set "SIGNUM_TESTNET_URL=https://github.com/signum-network/signum-node/releases/download/v3.8.2/signum-node-v3.8.2-win_x64.zip"
	
set "MAINNET_DEFAULT_PROPERTIES=.\%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_UNZIP%\conf\node-default.properties"
set "MAINNET_PROPERTIES=.\%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_UNZIP%\conf\node.properties"
	
set "TESTNET_DEFAULT_PROPERTIES=.\%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_UNZIP%\conf\node-default.properties"
set "TESTNET_PROPERTIES=.\%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_UNZIP%\conf\node.properties"
	
set "MARIADB_STARTER_BAT=start_mariadb.bat"	

set "DATABASE_DIR=Database"

set "MARIADB_VERSION=10.6.20"
set "MARIADB_DIR=MariaDB"	
set "MARIADB_ZIP=mariadb-%MARIADB_VERSION%-winx64.zip"
set "MARIADB_UNZIP=mariadb-%MARIADB_VERSION%-winx64"
set "MARIADB_BIN=%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\bin"
set "MARIADB_STARTER_BAT_PATH=%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\%MARIADB_STARTER_BAT%"
set "MARIADB_URL=https://archive.mariadb.org/mariadb-10.6.20/winx64-packages/mariadb-10.6.20-winx64.zip"
	
set "TOOLS_DIR=Tools"
	
set "HEIDISQL_DIR=HeidiSQL"
set "HEIDISQL_ZIP=HeidiSQL_12.8_64_Portable.zip"
set "HEIDISQL_UNZIP=HeidiSQL_12.8_64_Portable"
set "HEIDISQL_URL=https://www.heidisql.com/downloads/releases/HeidiSQL_12.8_64_Portable.zip"

:install_menu

	cls
	echo =====================================================
	echo            Welcome to the Signum Installer
	echo =====================================================
	echo Please select an option:
	echo [1] Install Signum Mainnet
	echo [2] Install Signum Testnet
	echo [3] Signum Starter Menu
	echo [4] Exit
	echo =====================================================

	set "choice="
	set /p choice="Enter your choice (1-4): "

	if "%choice%"=="1" goto install_mainnet
	if "%choice%"=="2" goto install_testnet
	if "%choice%"=="3" goto start_menu
	if "%choice%"=="4" goto exit
	echo Invalid choice! Please try again.
	pause
	goto install_menu

:start_menu

	cls
	echo =====================================================
	echo                 Start Signum Node
	echo =====================================================
	echo Please select an option:
	echo [1] Start Signum Mainnet
	echo [2] Start Signum Testnet
	echo [3] Start MariaDB
	echo [4] Signum Installer Menu
	echo [5] Exit
	echo =====================================================
	
	set "choice="
	set /p choice="Enter your choice (1-5): "

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
		If exist %MARIADB_STARTER_BAT_PATH% (
			echo Starting MariaDB
			start /min "" "%MARIADB_STARTER_BAT_PATH%"
			pause
			goto start_menu
		) else (
			echo MariaDB is not installed! 
			echo Please install Singnum Mainnet or Signum Testnet first!
			pause
			goto install_menu
		)
	) else if "%choice%"=="4" ( 
		goto install_menu
	) else if "%choice%"=="5" ( 
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

	if exist "%SIGNUM_MAINNET_STARTER_BAT_PATH%" (
		echo Signum Mainnet already installed.
		pause
		goto :start_menu
	)
	
	:: Prompt user to install Signum Testnet
	set "userChoice="
	set /p userChoice="Do you want to install Signum Mainnet? (yes/no): "

	:: Check the user's choice, accepting "yes", "y", or "Y"
	if /i "%userChoice%"=="yes" (
		rem Do nothing
	) else if /i "%userChoice%"=="y" (
		rem Do nothing
	) else if /i "%userChoice%"=="Y" (
		rem Do nothing
	) else (
		echo Signum Mainnet Installation canceled.
		pause
		goto :install_menu
	)

:install_mainnet_start
			
    echo Installing Signum mainnet ...

	:: Create mainnet/testnet directory
    if not exist "%SIGNUM_MAINNET_DIR%" (
        mkdir "%SIGNUM_MAINNET_DIR%"
        echo Created directory: %SIGNUM_MAINNET_DIR%
    ) else (
        echo Directory already exists: %SIGNUM_MAINNET_DIR%
    )

	if exist "%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_ZIP%" (
        echo %SIGNUM_MAINNET_ZIP% already downloaded.
    ) else (
		:: Download the Signum mainnet zip file
		echo Downloading Signum from GitHub ...
		:: powershell -Command "Invoke-WebRequest -Uri '%SIGNUM_MAINNET_URL%' -OutFile '%SIGNUM_MAINNET_ZIP%'"
		powershell -Command "Start-BitsTransfer -Source '%SIGNUM_MAINNET_URL%' -Destination '%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_ZIP%'"
		
		:: Check if download was successful
		if not exist "%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_ZIP%" (
			echo Error: Failed to download Signum.
			pause
			goto :install_menu
		)
	)
	
	if exist "%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_UNZIP%" (
		echo %SIGNUM_MAINNET_UNZIP% already installed.
	) else (
		:: Unzip the downloaded file to the installation directory
		echo Unzipping Signum to %SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_ZIP%' -DestinationPath '%SIGNUM_MAINNET_DIR%\%SIGNUM_MAINNET_UNZIP%' -Force"
	)
	
	:: Copy node-default.properties to node.properties
	echo Copying %MAINNET_DEFAULT_PROPERTIES% to %MAINNET_PROPERTIES% ...
	copy "%MAINNET_DEFAULT_PROPERTIES%" "%MAINNET_PROPERTIES%" >nul
	
	:: Plans
	:: Adding more custom properties in case port should be changed (e.g. multiple node running using different databases)
	:: Idea Signum-MariaDB; Signum-PostGreSQL; Signum-H2; Signum-SQLight folders with different ports
	:: Question: Is Testnet port change possible?

call :signum_starter_bat %SIGNUM_MAINNET_STARTER_BAT_PATH%

call :install_mariadb Mainnet signum-mainnet %MAINNET_PROPERTIES%

	echo Signum Mainnet Installation complete.
	pause

	if exist "%SIGNUM_TESTNET_STARTER_BAT_PATH%" goto :start_menu
		:: Prompt user to install Signum Testnet
		set "userChoice="
		set /p userChoice="Do you want to install Signum Testnet as well? (yes/no): "

		:: Check the user's choice, accepting "yes", "y", or "Y"
		if /i "%userChoice%"=="yes" (
			call :install_testnet_start
		) else if /i "%userChoice%"=="y" (
			call :install_testnet_start
		) else if /i "%userChoice%"=="Y" (
			call :install_testnet_start
		) else (
			echo Signum Testnet Installation canceled.
			pause
			goto start_menu
		)
	
goto :eof

:install_testnet

	if exist "%SIGNUM_TESTNET_STARTER_BAT_PATH%" (
		echo Signum Testnet already installed.
		pause
		goto :start_menu
	)
	
	:: Prompt user to install Signum Testnet
	set "userChoice="
	set /p userChoice="Do you want to install Signum Testnet? (yes/no): "

	:: Check the user's choice, accepting "yes", "y", or "Y"
	if /i "%userChoice%"=="yes" (
		rem Do nothing
	) else if /i "%userChoice%"=="y" (
		rem Do nothing
	) else if /i "%userChoice%"=="Y" (
		rem Do nothing
	) else (
		echo Signum Testnet Installation canceled.
		pause
		goto :install_menu
	)

:install_testnet_start

    echo Installing Signum Testnet ...
	
	:: Create mainnet/testnet directory
    if not exist "%SIGNUM_TESTNET_DIR%" (
        mkdir "%SIGNUM_TESTNET_DIR%"
        echo Created directory: %SIGNUM_TESTNET_DIR%
    ) else (
        echo Directory already exists: %SIGNUM_TESTNET_DIR%
    )
	
	:: Create mainnet/testnet directory
    if not exist "%SIGNUM_TESTNET_DIR%" (
        mkdir "%SIGNUM_TESTNET_DIR%"
        echo Created directory: %SIGNUM_TESTNET_DIR%
    ) else (
        echo Directory already exists: %SIGNUM_TESTNET_DIR%
    )

    :: Create database directory
    if not exist "%DATABASE_DIR%" (
        mkdir "%DATABASE_DIR%"
        echo Created directory: %DATABASE_DIR%
    ) else (
        echo Directory already exists: %DATABASE_DIR%
    )

	if exist "%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_ZIP%" (
        echo %SIGNUM_TESTNET_ZIP% already downloaded.
    ) else (
		:: Download the Signum mainnet zip file
		echo Downloading Signum from GitHub ...
		:: powershell -Command "Invoke-WebRequest -Uri '%SIGNUM_TESTNET_URL%' -OutFile '%SIGNUM_TESTNET_ZIP%'"
		powershell -Command "Start-BitsTransfer -Source '%SIGNUM_TESTNET_URL%' -Destination '%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_ZIP%'"
		
		:: Check if download was successful
		if not exist "%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_ZIP%" (
			echo Error: Failed to download Signum.
			exit /b 1
		)
	)
	
	if exist "%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_UNZIP%" (
		echo %SIGNUM_TESTNET_UNZIP% already installed.
	) else (
		:: Unzip the downloaded file to the installation directory
		echo Unzipping Signum to %SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_UNZIP% ...
		powershell -Command "Expand-Archive -Path '%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_ZIP%' -DestinationPath '%SIGNUM_TESTNET_DIR%\%SIGNUM_TESTNET_UNZIP%' -Force"
	)
	
	:: Copy node-default.properties to node.properties
	echo Copying %TESTNET_DEFAULT_PROPERTIES% to %TESTNET_PROPERTIES% ...
	copy "%TESTNET_DEFAULT_PROPERTIES%" "%TESTNET_PROPERTIES%" >nul
	
		:: Update node.properties with new database information
	echo Updating %TESTNET_PROPERTIES% with Testnet configurations ...

	powershell -Command "(Get-Content -Path '%TESTNET_PROPERTIES%') -replace '# node.network = signum.net.TestnetNetwork', 'node.network = signum.net.TestnetNetwork' | Set-Content -Path '%TESTNET_PROPERTIES%'"
	
	echo Update complete.
	
call :signum_starter_bat %SIGNUM_TESTNET_STARTER_BAT_PATH%
	
call :install_mariadb Testnet signum-testnet %TESTNET_PROPERTIES%
	
	echo Signum Testnet Installation complete.
	pause
	
	if exist "%SIGNUM_MAINNET_STARTER_BAT_PATH%" goto :start_menu
		:: Prompt user to install Signum Mainnet
		set "userChoice="
		set /p userChoice="Do you want to install Signum Mainnet as well? (yes/no): "

		:: Check the user's choice, accepting "yes", "y", or "Y"
		if /i "%userChoice%"=="yes" (
			call :install_mainnet_start
		) else if /i "%userChoice%"=="y" (
			call :install_mainnet_start
		) else if /i "%userChoice%"=="Y" (
			call :install_mainnet_start
		) else (
			echo Signum Mainnet Installation canceled.
			pause
			goto start_menu
		)
	
goto :eof
	
:signum_starter_bat	
	
	if not exist "%1%" (
		:: Create start_signum.bat file with the desired content
		echo cd %%~dp0 > "%1%"
		echo title Signum Node Mainnet >> "%1%"
		echo start /min ..\..\%MARIADB_STARTER_BAT_PATH% >> "%1%"
		echo timeout 10 >> "%1%"
		echo .\jre\bin\java -jar .\signum-node.jar >> "%1%"
		echo exit >> "%1%"

		:: Inform the user that the file has been created
		echo "%SIGNUM_STARTER_BAT%" successfully created.
	) else (
		echo File already exists: %SIGNUM_STARTER_BAT%
	)
	
goto :eof
	
:install_tools	
	
	:: Create mainnet/testnet directory
    if not exist "%TOOLS_DIR%" (
        mkdir "%TOOLS_DIR%"
        echo Created directory: %TOOLS_DIR%
    ) else (
        echo Directory already exists: %TOOLS_DIR%
    )
	
	:: Create mainnet/testnet directory
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
	)
	
goto :eof

:install_mariadb

call :install_tools

	:: Create the installation directory if it doesn't exist
	if not exist "%DATABASE_DIR%" (
		mkdir "%DATABASE_DIR%"
	) else (
		echo Directory already exists: %DATABASE_DIR%
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

	:: Initialize the database if needed
	if not exist "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data" (
		mkdir "%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data"
		echo Initializing MariaDB data directory ...
		:: "%MARIADB_BIN%\mysql_install_db.exe" --datadir=".\%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%\data" --basedir=".\%DATABASE_DIR%\%MARIADB_DIR%\%MARIADB_UNZIP%"
		"%MARIADB_BIN%\mysql_install_db.exe"
	) else (
		echo MariaDB data directory already initialized.
	)
		
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

endlocal
