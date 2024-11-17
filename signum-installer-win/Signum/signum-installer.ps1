# Change directory to the script's location
cd $PSScriptRoot

# Define variables
$SIGNUM_STARTER_PS1 = "start_signum.ps1"

$SIGNUM_NODE_DIR = "node"

$SIGNUM_MAINNET_VERSION = "v3.8.2"
$SIGNUM_MAINNET_DIR = "mainnet"
$SIGNUM_MAINNET_DIR_PATH = "${SIGNUM_MAINNET_DIR}\${SIGNUM_NODE_DIR}"
$SIGNUM_MAINNET_ZIP = "signum-node-${SIGNUM_MAINNET_VERSION}-win_x64.zip"
$SIGNUM_MAINNET_UNZIP = "signum-node-${SIGNUM_MAINNET_VERSION}-win_x64"
$SIGNUM_MAINNET_STARTER_PS1_PATH = "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\${SIGNUM_STARTER_PS1}"
$SIGNUM_MAINNET_URL = "https://github.com/signum-network/signum-node/releases/download/${SIGNUM_MAINNET_VERSION}/${SIGNUM_MAINNET_ZIP}"

$SIGNUM_TESTNET_VERSION = "v3.8.2"
$SIGNUM_TESTNET_DIR = "testnet"
$SIGNUM_TESTNET_DIR_PATH = "${SIGNUM_TESTNET_DIR}\${SIGNUM_NODE_DIR}"
$SIGNUM_TESTNET_ZIP = "signum-node-${SIGNUM_TESTNET_VERSION}-win_x64.zip"
$SIGNUM_TESTNET_UNZIP = "signum-node-${SIGNUM_TESTNET_VERSION}-win_x64"
$SIGNUM_TESTNET_STARTER_PS1_PATH = "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\${SIGNUM_STARTER_PS1}"
$SIGNUM_TESTNET_URL = "https://github.com/signum-network/signum-node/releases/download/${SIGNUM_TESTNET_VERSION}/${SIGNUM_TESTNET_ZIP}"

$MAINNET_DEFAULT_PROPERTIES = ".\${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\conf\node-default.properties"
$MAINNET_PROPERTIES = ".\${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}\conf\node.properties"

$TESTNET_DEFAULT_PROPERTIES = ".\${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\conf\node-default.properties"
$TESTNET_PROPERTIES = ".\${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}\conf\node.properties"

$SIGNUM_MAINNET_MINER_VERSION = ""
$SIGNUM_MAINNET_MINER_DIR = ""
$SIGNUM_MAINNET_MINER_ZIP = ""
$SIGNUM_MAINNET_MINER_UNZIP = ""
$SIGNUM_MAINNET_MINER_STARTER_PS1_PATH = ""
$SIGNUM_MAINNET_MINER_URL = ""

$SIGNUM_TESTNET_MINER_VERSION = ""
$SIGNUM_TESTNET_MINER_DIR = ""
$SIGNUM_TESTNET_MINER_ZIP = ""
$SIGNUM_TESTNET_MINER_UNZIP = ""
$SIGNUM_TESTNET_MINER_STARTER_PS1_PATH = ""
$SIGNUM_TESTNET_MINER_URL = ""

$SIGNUM_MAINNET_MINER_YAML = ""
$SIGNUM_TESTNET_MINER_YAML = ""

$SIGNUM_PLOTTER_VERSION = ""
$SIGNUM_PLOTTER_DIR = ""
$SIGNUM_PLOTTER_ZIP = ""
$SIGNUM_PLOTTER_UNZIP = ""
$SIGNUM_PLOTTER_STARTER_PS1_PATH = ""
$SIGNUM_PLOTTER_URL = ""

$BTDEX_VERSION = "v0.6.8"
$BTDEX_DIR = "btdex"
$BTDEX_EXE = "btdex-${BTDEX_VERSION}-win.exe"
$BTDEX_EXE_PATH = "${BTDEX_DIR}\${BTDEX_EXE}"
$BTDEX_URL = "https://github.com/btdex/btdex/releases/download/${BTDEX_VERSION}/${BTDEX_EXE}"

$PHOENIX_VERSION = "1.5.0-beta.3"
$PHOENIX_DIR = "phoenix"
$PHOENIX_EXE = "win-phoenix-signum-wallet.${PHOENIX_VERSION}.exe"
$PHOENIX_EXE_PATH = "${PHOENIX_DIR}\${PHOENIX_EXE}"
$PHOENIX_URL = "https://github.com/signum-network/phoenix/releases/download/desktop-${PHOENIX_VERSION}/${PHOENIX_EXE}"

$MARIADB_STARTER_PS1 = "start_mariadb.ps1"

$DATABASE_DIR = "database"

$MARIADB_VERSION = "10.6.20"
$MARIADB_DIR = "MariaDB"
$MARIADB_ZIP = "mariadb-${MARIADB_VERSION}-winx64.zip"
$MARIADB_UNZIP = "mariadb-${MARIADB_VERSION}-winx64"
$MARIADB_BIN = "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\bin"
$MARIADB_STARTER_PS1_PATH = "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\${MARIADB_STARTER_PS1}"
$MARIADB_URL = "https://archive.mariadb.org/mariadb-${MARIADB_VERSION}/winx64-packages/mariadb-${MARIADB_VERSION}-winx64.zip"

$DATABASE_NAME = ""
$DATABASE_USERNAME = ""
$DATABASE_PASSWORD = ""

$TOOLS_DIR = "tools"

$HEIDISQL_VERSION = "12.8"
$HEIDISQL_DIR = "HeidiSQL"
$HEIDISQL_ZIP = "HeidiSQL_${HEIDISQL_VERSION}_64_Portable.zip"
$HEIDISQL_UNZIP = "HeidiSQL_${HEIDISQL_VERSION}_Portable"
$HEIDISQL_EXE = "heidisql.exe"
$HEIDISQL_EXE_PATH = "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_UNZIP}\${HEIDISQL_EXE}"
$HEIDISQL_URL = "https://www.heidisql.com/downloads/releases/HeidiSQL_${HEIDISQL_VERSION}_64_Portable.zip"

function Show-InstallMenu {
    Clear-Host
    Write-Host "====================================================="
    Write-Host "            Welcome to the Signum Installer          "
    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] Install Signum Mainnet with MariaDB"
    Write-Host "[2] Install Signum Testnet with MariaDB"
    Write-Host "[3] Install BTDEX"
    Write-Host "[4] Install Phoenix"
    Write-Host "[5] Install MariaDB"
    Write-Host "[6] Install HeidiSQL"
    Write-Host "-----------------------------------------------------"
    Write-Host "[7] Signum Starter Menu"
    Write-Host "[8] Exit"
    Write-Host "====================================================="

    $choice = Read-Host "Enter your choice (1-8)"

    switch ($choice) {
        "1" {
            if (Test-Path $SIGNUM_MAINNET_STARTER_PS1_PATH) {
                Write-Host "Signum Mainnet already installed."
                Pause
                Show-InstallMenu
            } else {
                install-prompt "Signum Mainnet" Install-SignumMainnet
				Pause
                Show-InstallMenu
            }
        }
        "2" {
            if (Test-Path $SIGNUM_TESTNET_STARTER_PS1_PATH) {
                Write-Host "Signum Testnet already installed."
                Pause
                Show-InstallMenu
            } else {
                install-prompt "Signum Testnet" Install-Testnet
				Pause
                Show-InstallMenu
            }
        }
        "3" {
            if (Test-Path $BTDEX_EXE_PATH) {
                Write-Host "BTDEX already installed."
                Pause
                Show-InstallMenu
            } else {
                install-prompt "BTDEX" install_btdex
				Pause
                Show-InstallMenu
            }
        }
        "4" {
            if (Test-Path $PHOENIX_EXE_PATH) {
                Write-Host "Phoenix already installed."
                Pause
                Show-InstallMenu
            } else {
                install-prompt "Phoenix" Install-Phoenix
				Pause
                Show-InstallMenu
            }
        }
        "5" {
            if (Test-Path $MARIADB_STARTER_PS1_PATH) {
                Write-Host "MariaDB already installed."
                Pause
                Show-InstallMenu
            } else {
                install-prompt "MariaDB" install_mariadb
				Pause
                Show-InstallMenu
            }
        }
        "6" {
            if (Test-Path "${HEIDISQL_EXE_PATH}") {
                Write-Host "HeidiSQL already installed."
                Pause
                Show-InstallMenu
            } else {
                install-prompt "HeidiSQL" install_heidisql
				Pause
                Show-InstallMenu
            }
        }
        "7" {
            Show-StartMenu
        }
        "8" {
            Exit-Script
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            Show-InstallMenu
        }
    }
}

function Show-StartMenu {
    Clear-Host
    Write-Host "====================================================="
    Write-Host "                 Start Signum Node                   "
    Write-Host "====================================================="
    Write-Host "Please select an option:"
    Write-Host "[1] Start Signum Node Mainnet with MariaDB"
    Write-Host "[2] Start Signum Node Testnet with MariaDB"
    Write-Host "[3] Start BTDEX"
    Write-Host "[4] Start Phoenix"
    Write-Host "[5] Start MariaDB"
    Write-Host "[6] Start HeidiSQL"
    Write-Host "-----------------------------------------------------"
    Write-Host "[7] Signum Installer Menu"
    Write-Host "[8] Exit"
    Write-Host "====================================================="

    $choice = Read-Host "Enter your choice (1-8)"

    switch ($choice) {
        "1" {
            if (Test-Path $SIGNUM_MAINNET_STARTER_PS1_PATH) {
                Write-Host "Starting Signum Mainnet with MariaDB..."
                Start-Process -FilePath $SIGNUM_MAINNET_STARTER_PS1_PATH -WindowStyle Minimized
                Pause
                Show-StartMenu
            } else {
                Write-Host "Signum Mainnet is not installed, please install first!"
                Pause
                install-prompt "Signum Mainnet" Install-SignumMainnet
				Pause
                Show-StartMenu
            }
        }
        "2" {
            if (Test-Path $SIGNUM_TESTNET_STARTER_PS1_PATH) {
                Write-Host "Starting Signum Testnet with MariaDB..."
                Start-Process -FilePath $SIGNUM_TESTNET_STARTER_PS1_PATH -WindowStyle Minimized
                Pause
                Show-StartMenu
            } else {
                Write-Host "Signum Testnet is not installed, please install first!"
                Pause
                install-prompt "Signum Testnet" Install-SignumTestnet
				Pause
                Show-StartMenu
            }
        }
        "3" {
            if (Test-Path $BTDEX_EXE_PATH) {
                Write-Host "Starting BTDEX..."
                Start-Process -FilePath $BTDEX_EXE_PATH
                Pause
                Show-StartMenu
            } else {
                Write-Host "BTDEX is not installed, please install first!"
                Pause
                install-prompt "BTDEX" Install-Btdex
				Pause
                Show-StartMenu
            }
        }
        "4" {
            if (Test-Path $PHOENIX_EXE_PATH) {
                Write-Host "Starting Phoenix..."
                Start-Process -FilePath $PHOENIX_EXE_PATH -WindowStyle Minimized
                Pause
                Show-StartMenu
            } else {
                Write-Host "Phoenix is not installed, please install first!"
                Pause
                install-prompt "Phoenix" Install-Phoenix
				Pause
                Show-StartMenu
            }
        }
        "5" {
            if (Test-Path $MARIADB_STARTER_PS1_PATH) {
                Write-Host "Starting MariaDB..."
                Start-Process -FilePath $MARIADB_STARTER_PS1_PATH -WindowStyle Minimized
                Pause
                Show-StartMenu
				Pause
                Show-StartMenu
            } else {
                Write-Host "MariaDB is not installed, please install first!"
                Pause
                install-prompt "MariaDB" install_mariadb
				Pause
                Show-StartMenu
            }
        }
        "6" {
            if (Test-Path $HEIDISQL_EXE_PATH) {
                Write-Host "Starting HeidiSQL..."
                Start-Process -FilePath $HEIDISQL_EXE_PATH
                Pause
                Show-StartMenu
            } else {
                Write-Host "HeidiSQL is not installed, please install first!"
                Pause
                install-prompt "HeidiSQL" install_heidisql
				Pause
                Show-StartMenu
            }
        }
        "7" {
            Show-InstallMenu
        }
        "8" {
            Exit-Script
        }
        default {
            Write-Host "Invalid choice! Please try again."
            Pause
            Show-StartMenu
        }
    }
}

function Exit-Script {
    Write-Host "Press any key to exit Signum Installer. Goodbye!"
    Pause
    Exit
}

function Install-SignumMainnet {
    Write-Host "Installing Signum Mainnet ..."

    # Create mainnet/testnet directory
    if (-not (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_MAINNET_DIR_PATH}" -ItemType Directory | Out-Null
        Write-Host "Created directory: ${SIGNUM_MAINNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_MAINNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}") {
        Write-Host "${SIGNUM_MAINNET_ZIP} already downloaded."
    } else {
        # Download the Signum mainnet zip file
        Write-Host "Downloading Signum from GitHub ..."
        Start-BitsTransfer -Source "${SIGNUM_MAINNET_URL}" -Destination "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}"

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}")) {
            Write-Host "Error: Failed to download Signum."
            Pause
            # Install-Menu
            return
        }
    }

    if (Test-Path -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}") {
        Write-Host "${SIGNUM_MAINNET_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP} ..."
        Expand-Archive -Path "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_ZIP}" -DestinationPath "${SIGNUM_MAINNET_DIR_PATH}\${SIGNUM_MAINNET_UNZIP}" -Force
    }

    # Copy node-default.properties to node.properties
    Write-Host "Copying ${MAINNET_DEFAULT_PROPERTIES} to ${MAINNET_PROPERTIES} ..."
    Copy-Item -Path "${MAINNET_DEFAULT_PROPERTIES}" -Destination "${MAINNET_PROPERTIES}"

    # Install Signum Mainnet starter batch
    signum-starter-ps1 "Mainnet" ${SIGNUM_MAINNET_STARTER_PS1_PATH}
	
	

    # Install MariaDB
    install_mariadb

    # Setup MariaDB for Mainnet
    Setup-Mariadb "Mainnet" "signum-mainnet"
	
	# Update database information in node.properties
	setup_db_node_properties ${MAINNET_PROPERTIES}

    Write-Host "Signum Mainnet Installation complete."
    Pause

    if (-not (Test-Path -Path "${SIGNUM_TESTNET_STARTER_PS1_PATH}")) {
        install-prompt "Signum Testnet" Install-SignumTestnet
    }
}

function Install-SignumTestnet {
    Write-Host "Installing Signum Testnet ..."

    # Create mainnet/testnet directory
    if (-not (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}")) {
        New-Item -Path "${SIGNUM_TESTNET_DIR_PATH}" -ItemType Directory
        Write-Host "Created directory: ${SIGNUM_TESTNET_DIR_PATH}"
    } else {
        Write-Host "Directory already exists: ${SIGNUM_TESTNET_DIR_PATH}"
    }

    if (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}") {
        Write-Host "${SIGNUM_TESTNET_ZIP} already downloaded."
    } else {
        # Download the Signum testnet zip file
        Write-Host "Downloading Signum from GitHub ..."
        Start-BitsTransfer -Source "${SIGNUM_TESTNET_URL}" -Destination "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}"

        # Check if download was successful
        if (-not (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}")) {
            Write-Host "Error: Failed to download Signum."
            Exit
        }
    }

    if (Test-Path -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}") {
        Write-Host "${SIGNUM_TESTNET_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping Signum to ${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP} ..."
        Expand-Archive -Path "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_ZIP}" -DestinationPath "${SIGNUM_TESTNET_DIR_PATH}\${SIGNUM_TESTNET_UNZIP}" -Force
    }

    # Copy node-default.properties to node.properties
    Write-Host "Copying ${TESTNET_DEFAULT_PROPERTIES} to ${TESTNET_PROPERTIES} ..."
    Copy-Item -Path "${TESTNET_DEFAULT_PROPERTIES}" -Destination "${TESTNET_PROPERTIES}"

    # Update node.properties with new database information
    Write-Host "Updating ${TESTNET_PROPERTIES} with Testnet configurations ..."
    (Get-Content -Path $TESTNET_PROPERTIES) -replace '# node.network = signum.net.TestnetNetwork', 'node.network = signum.net.TestnetNetwork' | Set-Content -Path $TESTNET_PROPERTIES

    Write-Host "Update complete."

    # Install Signum Testnet starter batch
    signum-starter-ps1 "Testnet" $SIGNUM_TESTNET_STARTER_PS1_PATH
	
	# OS dependent start-signum file creation TODO

    # Install MariaDB
    install_mariadb

    # Setup MariaDB for Testnet
    Setup-Mariadb "Testnet" "signum-testnet" $TESTNET_PROPERTIES

    Write-Host "Signum Testnet Installation complete."
    Pause

    if (-not (Test-Path -Path "${SIGNUM_MAINNET_STARTER_PS1_PATH}")) {
        install-prompt "Signum Mainnet" Install-SignumMainnet
    }
}

function signum-starter-ps1 ($name, $file){

    if (-not (Test-Path $file)) {
        # Create start_signum.ps1 file with the desired content
        $content = 
@"
# PowerShell script to start Signum Node
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:TITLE = 'Signum Node $name'
Start-Process -FilePath "..\..\..\${MARIADB_STARTER_PS1_PATH}" -WindowStyle Minimized
Start-Sleep -Seconds 10
Start-Process -FilePath ".\jre\bin\java" -ArgumentList "-jar .\signum-node.jar"
exit
"@
        $content | Out-File -FilePath $file -Force

        Write-Host "${file} successfully created."
    } else {
        Write-Host "File already exists: ${file}"
    }
}

function install_heidisql {
    # Create HeidiSQL directory
    if (-not (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}")) {
        New-Item -ItemType Directory -Path "${TOOLS_DIR}\${HEIDISQL_DIR}" | Out-Null
        Write-Host "Created directory: ${HEIDISQL_DIR}"
    } else {
        Write-Host "Directory already exists: ${HEIDISQL_DIR}"
    }

    if (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}") {
        Write-Host "${HEIDISQL_ZIP} already downloaded."
    } else {
        # Download HeidiSQL
        Write-Host "Downloading HeidiSQL ..."
        Start-BitsTransfer -Source "${HEIDISQL_URL}" -Destination "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}"

        # Check if download was successful
        if (-not (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_ZIP}")) {
            Write-Host "Error: Failed to download HeidiSQL."
            Pause
            return
        }
    }

    if (Test-Path "${TOOLS_DIR}\${HEIDISQL_DIR}\${HEIDISQL_UNZIP}") {
        Write-Host "${HEIDISQL_UNZIP} already installed."
    } else {
        # Unzip the downloaded file to the installation directory
        Write-Host "Unzipping HeidiSQL to $TOOLS_DIR\$HEIDISQL_DIR\$HEIDISQL_UNZIP ..."
        Expand-Archive -Path "$TOOLS_DIR\$HEIDISQL_DIR\$HEIDISQL_ZIP" -DestinationPath "$TOOLS_DIR\$HEIDISQL_DIR\$HEIDISQL_UNZIP" -Force
        Write-Host "HeidiSQL installed successfully."
    }
}

function install_btdex {
    # Create btdex directory
    if (-not (Test-Path $BTDEX_DIR)) {
        New-Item -ItemType Directory -Path $BTDEX_DIR | Out-Null
        Write-Host "Created directory: ${BTDEX_DIR}"
    } else {
        Write-Host "Directory already exists: ${BTDEX_DIR}"
    }

    if (Test-Path $BTDEX_EXE_PATH) {
        Write-Host "${BTDEX_EXE} already installed."
    } else {
        # Download BTDEX exe file
        Write-Host "Downloading BTDEX ..."
        Start-BitsTransfer -Source $BTDEX_URL -Destination $BTDEX_EXE_PATH

        # Check if download was successful
        if (-not (Test-Path $BTDEX_EXE_PATH)) {
            Write-Host "Error: Failed to download BTDEX."
            Pause
            return
        } else {
            Write-Host "BTDEX installed successfully."
        }
    }
}

function install_phoenix {
    if (-not (Test-Path $PHOENIX_DIR)) {
        New-Item -ItemType Directory -Force -Path $PHOENIX_DIR | Out-Null
        Write-Host "Created directory: ${PHOENIX_DIR}"
    } else {
        Write-Host "Directory already exists: ${PHOENIX_DIR}"
    }

    if (Test-Path $PHOENIX_EXE_PATH) {
        Write-Host "${PHOENIX_EXE} already installed."
    } else {
        Write-Host "Downloading Phoenix ..."
        Start-BitsTransfer -Source $PHOENIX_URL -Destination $PHOENIX_EXE_PATH

        if (-not (Test-Path $PHOENIX_EXE_PATH)) {
            Write-Host "Error: Failed to download Phoenix."
            Read-Host "Press Enter to continue"
            return
        } else {
            Write-Host "Phoenix installed successfully."
        }
    }
}

function install_mariadb {
    install_heidisql

    if (Test-Path $MARIADB_STARTER_PS1_PATH) {
        Write-Host "MariaDB already installed!"
        return
    }

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}")) {
        New-Item -ItemType Directory -Force -Path "${DATABASE_DIR}\${MARIADB_DIR}" | Out-Null
    } else {
        Write-Host "Directory already exists: ${DATABASE_DIR}\${MARIADB_DIR}"
    }

    if (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}") {
        Write-Host "${MARIADB_ZIP} already downloaded."
    } else {
        Write-Host "Downloading MariaDB version ${MARIADB_VERSION} ..."
        Start-BitsTransfer -Source $MARIADB_URL -Destination "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}"

        if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}")) {
            Write-Host "Error: Failed to download MariaDB version ${MARIADB_VERSION}."
            Read-Host "Press Enter to continue"
            return
        }
    }

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}")) {
        Write-Host "Unzipping MariaDB to ${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP} ..."
        Expand-Archive -Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_ZIP}" -DestinationPath "${DATABASE_DIR}\${MARIADB_DIR}" -Force
    }

    if (-not (Test-Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\data")) {
        New-Item -ItemType Directory -Force -Path "${DATABASE_DIR}\${MARIADB_DIR}\${MARIADB_UNZIP}\data" | Out-Null
        Write-Host "Initializing MariaDB data directory ..."
        & "${MARIADB_BIN}\mysql_install_db.exe"
    } else {
        Write-Host "MariaDB data directory already initialized."
    }

    if (-not (Test-Path $MARIADB_STARTER_PS1_PATH)) {
        $content = 
@"
# PowerShell script to start MariaDB
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:TITLE = 'MariaDB'
Start-Process -FilePath ".\bin\mariadbd.exe" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized
exit
"@
        $content | Out-File -FilePath $MARIADB_STARTER_PS1_PATH -Force
        Write-Host "${MARIADB_STARTER_PS1_PATH} successfully created."
    } else {
        Write-Host "File already exists: ${MARIADB_STARTER_PS1_PATH}"
    }
}

function setup_mariadb ($name, $database) {
	
	$global:DATABASE_NAME = ""
	$global:DATABASE_USERNAME = ""
	$global:DATABASE_PASSWORD = ""
	
    $global:DATABASE_NAME = Read-Host "Enter Signum ${name} database name (or press Enter for default ${database}): "
    if (-not $global:DATABASE_NAME) { $global:DATABASE_NAME = $database }
    Write-Host "Database name: ${database}"

    $global:DATABASE_USERNAME = Read-Host "Enter the username (or press Enter for default 'signumuser'): "
    if (-not $global:DATABASE_USERNAME) { $global:DATABASE_USERNAME = "signumuser" }
    Write-Host "Username: ${DATABASE_USERNAME}"

    $global:DATABASE_PASSWORD = Read-Host "Enter the password (or press Enter for default 'signumpassword'): " -AsSecureString
    if (-not $global:DATABASE_PASSWORD) { $global:DATABASE_PASSWORD = "signumpassword" }
    Write-Host "Password: ${DATABASE_PASSWORD}"

    Write-Host "Starting MariaDB server ..."
    Start-Process -FilePath "${MARIADB_BIN}\mysqld.exe" -ArgumentList "--no-defaults", "--console" -WindowStyle Minimized

    Start-Sleep -Seconds 10

    Write-Host "Creating database: ${DATABASE_NAME}"
    & "${MARIADB_BIN}\mysql.exe" --user=root --password= -e "CREATE DATABASE IF NOT EXISTS `$global:DATABASE_NAME;"

    Write-Host "Creating user: ${DATABASE_USERNAME}"
    & "${MARIADB_BIN}\mysql.exe" --user=root --password= -e "CREATE USER IF NOT EXISTS `$global:DATABASE_USERNAME`@'localhost' IDENTIFIED BY `$global:DATABASE_PASSWORD;"

    Write-Host "Granting permissions to user $global:DATABASE_USERNAME on database $global:DATABASE_NAME ..."
    & "${MARIADB_BIN}\mysql.exe" --user=root --password= -e "GRANT ALL PRIVILEGES ON `$global:DATABASE_NAME.* TO `$global:DATABASE_USERNAME`@'localhost';"
    & "${MARIADB_BIN}\mysql.exe" --user=root --password= -e "FLUSH PRIVILEGES;"

    Write-Host "MariaDB setup complete."
}

function setup_db_node_properties($file) {
	
	Write-Host "Updating node.properties with new database configurations ..."
    (Get-Content -Path $file) -replace '# DB.Url=jdbc:mariadb:.*', "DB.Url=jdbc:mariadb://localhost:3306/${global:DATABASE_NAME}" `
        -replace '# DB.Username=.*', "DB.Username=${global:DATABASE_USERNAME}" `
        -replace '# DB.Password=.*', "DB.Password=${global:DATABASE_PASSWORD}" | Set-Content -Path $file

    Write-Host "Update complete."
	
}

function install-prompt($name, $installFunction) {
    $userChoice = Read-Host "Do you want to install ${name} (yes/no)"
    if ($userChoice -match '^(yes|y|Y)$') {
        &$installFunction
    } else {
        Write-Host "${name} Installation canceled."
    }
}

# Checking OS environment TODO
# Initialization and setup if not exists depending on OS if neccessary TODO

# Initialize the script by showing the install menu
Show-InstallMenu
