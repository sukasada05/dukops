@echo off
echo ==========================================
echo ORGANISING DUKOPS FILES - BY SYSTEM
echo ==========================================
echo.
echo Script ini akan mengorganisir file DUKOPS
echo menjadi struktur folder yang rapi.
echo.
pause

echo.
echo ==========================================
echo CREATING FOLDER STRUCTURE...
echo ==========================================
echo.

REM Buat struktur folder utama
echo Creating main folders...
if not exist "assets" mkdir assets
if not exist "assets\css" mkdir assets\css
if not exist "assets\js" mkdir assets\js
if not exist "assets\js\dukops" mkdir assets\js\dukops
if not exist "assets\js\jadwal-piket" mkdir assets\js\jadwal-piket
if not exist "assets\js\audio" mkdir assets\js\audio
if not exist "assets\templates" mkdir assets\templates
if not exist "assets\images" mkdir assets\images
if not exist "assets\images\banners" mkdir assets\images\banners
if not exist "assets\images\logos" mkdir assets\images\logos

if not exist "config" mkdir config
if not exist "data" mkdir data
if not exist "data\coordinates" mkdir data\coordinates
if not exist "google-apps-script" mkdir google-apps-script

echo.
echo ==========================================
echo MOVING FILES TO NEW STRUCTURE...
echo ==========================================
echo.

REM Pindahkan file CSS
echo Moving CSS files...
if exist "*.css" (
    echo Found CSS files, moving to assets\css\
    move /Y "*.css" "assets\css\"
) else (
    echo No CSS files found in root
)

REM Pindahkan file JavaScript
echo Moving JavaScript files...
if exist "*.js" (
    echo Found JS files, moving to appropriate folders...
    
    REM Audio files
    if exist "audio-*.js" (
        move /Y "audio-*.js" "assets\js\audio\"
    )
    
    REM Move remaining JS files
    for %%f in (*.js) do (
        if not "%%f"=="organize-files.bat" (
            move /Y "%%f" "assets\js\"
        )
    )
)

REM Pindahkan gambar banner
echo Moving banner images...
if exist "bnr_*.png" (
    move /Y "bnr_*.png" "assets\images\banners\"
)

REM Pindahkan file koordinat
echo Moving coordinate files...
if exist "CO_*.txt" (
    move /Y "CO_*.txt" "data\coordinates\"
)

REM Pindahkan file ikon
echo Moving icon files...
if exist "apple-touch-icon.png" move /Y "apple-touch-icon.png" "assets\images\"
if exist "favicon-*.png" move /Y "favicon-*.png" "assets\images\"
if exist "favicon.ico" move /Y "favicon.ico" "assets\images\"
if exist "favicon.svg" move /Y "favicon.svg" "assets\images\"
if exist "web-app-manifest-*.png" move /Y "web-app-manifest-*.png" "assets\images\"

REM Pindahkan file konfigurasi
echo Moving config files...
if exist "site.json" move /Y "site.json" "config\"
if exist "site.webmanifest" move /Y "site.webmanifest" "config\"
if exist "manifest.json" move /Y "manifest.json" "."

REM Pindahkan file data
echo Moving data files...
if exist "list_desadankelurahan.txt" move /Y "list_desadankelurahan.txt" "data\"

REM Copy Google Apps Script
echo Copying Google Apps Script...
if exist "deepseek_batch_*.bat" (
    copy "deepseek_batch_*.bat" "google-apps-script\dukops-backend.js"
    echo Google Apps Script copied to google-apps-script\dukops-backend.js
)

echo.
echo ==========================================
echo CREATING NEW FILES...
echo ==========================================
echo.

REM Buat file index.html baru
echo Creating new index.html...
(
echo ^<!DOCTYPE html^>
echo ^<html lang="id"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"^>
echo     ^<meta http-equiv="X-UA-Compatible" content="IE=edge"^>
echo.
echo     ^<!-- PWA Configuration --^>
echo     ^<meta name="mobile-web-app-capable" content="yes"^>
echo     ^<meta name="apple-mobile-web-app-capable" content="yes"^>
echo     ^<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"^>
echo     ^<meta name="apple-mobile-web-app-title" content="DUKOPS"^>
echo     ^<title^>SISTEM PELAPORAN DUKOPS BABINSA dan JADWAL PIKET KORAMIL^</title^>
echo     ^<meta name="theme-color" content="#202624"^>
echo.
echo     ^<!-- Favicon --^>
echo     ^<link rel="icon" type="image/png" href="assets/images/favicon-96x96.png" sizes="96x96" /^>
echo     ^<link rel="icon" type="image/svg+xml" href="assets/images/favicon.svg" /^>
echo     ^<link rel="shortcut icon" href="assets/images/favicon.ico" /^>
echo     ^<link rel="apple-touch-icon" sizes="180x180" href="assets/images/apple-touch-icon.png" /^>
echo     ^<link rel="manifest" href="manifest.json" /^>
echo.
echo     ^<!-- External Libraries --^>
echo     ^<script src="https://cdn.polyfill.io/v3/polyfill.min.js?features=default,es6,Promise,fetch,Array.prototype.includes"^>^</script^>
echo     ^<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"^>^</script^>
echo     ^<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"^>
echo.
echo     ^<!-- CSS Files --^>
echo     ^<link rel="stylesheet" href="assets/css/common.css"^>
echo     ^<link rel="stylesheet" href="assets/css/splash.css"^>
echo     ^<link rel="stylesheet" href="assets/css/dukops.css"^>
echo     ^<link rel="stylesheet" href="assets/css/jadwal-piket.css"^>
echo     ^<link rel="stylesheet" href="assets/css/attendance.css"^>
echo ^</head^>
echo ^<body^>
echo     ^<!-- SPLASH SCREEN --^>
echo     ^<div id="splashScreen" class="splash-container"^>
echo         ^<!-- Logo Kodam Udayana --^>
echo         ^<div class="splash-circle"^>
echo             ^<div class="logo-container"^>
echo                 ^<img src="assets/images/logos/lambang_kodam_udayana.svg" 
echo                      alt="Lambang Kodam Udayana" 
echo                      class="svg-logo"^>
echo             ^</div^>
echo         ^</div^>
echo.
echo         ^<!-- Teks Aplikasi --^>
echo         ^<div class="splash-title"^>DUKOPS BABINSA dan JADWAL PIKET^</div^>
echo         ^<div class="splash-unit"^>KORAMIL 1609-05/SUKASADA^</div^>
echo         ^<div class="splash-subtitle"^>KODIM 1609/BULELENG^</div^>
echo.
echo         ^<!-- Progress Bar --^>
echo         ^<div class="splash-progress-container"^>
echo             ^<div class="splash-progress-bar" id="splashProgressBar"^>^</div^>
echo             ^<div class="progress-percentage" id="progressPercentage"^>0%^</div^>
echo         ^</div^>
echo.
echo         ^<!-- Tombol Pilihan Aplikasi --^>
echo         ^<div class="splash-buttons"^>
echo             ^<button class="splash-btn splash-btn-dukops" id="splashDukopsBtn"^>
echo                 ^<i class="fas fa-file-upload"^> klik disini ➯ ^</i^> OPEN APLIKASI DUKOPS
echo             ^</button^>
echo         ^</div^>
echo.
echo         ^<!-- Loading Text --^>
echo         ^<div class="loading-text" id="loadingStatusText"^>Pilih aplikasi yang akan digunakan^</div^>
echo     ^</div^>
echo.
echo     ^<!-- APLIKASI UTAMA --^>
echo     ^<div id="appContainer" class="container" style="display: none;"^>
echo         ^<!-- Install Button --^>
echo         ^<button id="installButton"^>
echo             ^<i class="fas fa-download"^>^</i^> Install App
echo         ^</button^>
echo.
echo         ^<!-- Navigation Buttons --^>
echo         ^<div class="nav-buttons"^>
echo             ^<button class="nav-btn active" id="btnDukops"^>
echo                 ^<i class="fas fa-file-upload"^>^</i^> DUKOPS BABINSA
echo             ^</button^>
echo             ^<button class="nav-btn" id="btnJadwal"^>
echo                 ^<i class="fas fa-calendar-alt"^>^</i^> JADWAL PIKET
echo             ^</button^>
echo         ^</div^>
echo.
echo         ^<!-- DUKOPS Content --^>
echo         ^<div id="dukopsContent"^>
echo             ^<!-- Konten DUKOPS akan dimuat di sini --^>
echo         ^</div^>
echo.
echo         ^<!-- Jadwal Piket Content --^>
echo         ^<div id="jadwalPiketContainer" style="display: none;"^>
echo             ^<!-- Konten Jadwal Piket akan dimuat di sini --^>
echo         ^</div^>
echo     ^</div^>
echo.
echo     ^<!-- JavaScript Files --^>
echo     ^<script src="config/api-config.js"^>^</script^>
echo     ^<script src="assets/js/utils.js"^>^</script^>
echo     ^<script src="assets/js/splash.js"^>^</script^>
echo     ^<script src="assets/js/app.js"^>^</script^>
echo     ^<script src="assets/js/dukops/main.js"^>^</script^>
echo     ^<script src="assets/js/jadwal-piket/main.js"^>^</script^>
echo     ^<script src="assets/js/audio/audio-base64.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > index.html

echo index.html created successfully!

REM Buat file README
echo Creating README.md...
(
echo # DUKOPS BABINSA DAN JADWAL PIKET KORAMIL
echo.
echo ## Struktur Folder Baru
echo.
echo Berikut adalah struktur folder baru setelah reorganisasi:
echo.
echo ^````
echo DUKOPS-main/
echo ├── index.html                     # File utama HTML
echo ├── assets/
echo │   ├── css/
echo │   │   ├── splash.css            # Style splash screen
echo │   │   ├── dukops.css            # Style aplikasi DUKOPS
echo │   │   ├── jadwal-piket.css      # Style jadwal piket
echo │   │   ├── attendance.css        # Style laporan absensi
echo │   │   └── common.css            # Style umum
echo │   ├── js/
echo │   │   ├── app.js                # Main app controller
echo │   │   ├── splash.js             # Splash screen functions
echo │   │   ├── utils.js              # Utility functions
echo │   │   ├── dukops/
echo │   │   │   └── main.js           # DUKOPS module
echo │   │   ├── jadwal-piket/
echo │   │   │   └── main.js           # Jadwal piket module
echo │   │   └── audio/
echo │   │       └── audio-base64.js   # Audio system
echo │   ├── templates/
echo │   │   ├── dukops-content.html   # Template DUKOPS
echo │   │   └── jadwal-piket-content.html # Template jadwal
echo │   └── images/
echo │       ├── banners/              # Banner images
echo │       └── logos/                # Logo images
echo ├── config/
echo │   └── api-config.js             # Konfigurasi API
echo ├── data/
echo │   ├── coordinates/              # File koordinat desa
echo │   └── desa-list.txt             # Daftar desa
echo ├── google-apps-script/
echo │   └── dukops-backend.js         # Backend Google Apps Script
echo ├── manifest.json                  # PWA manifest
echo └── README.md                     # Dokumentasi ini
echo ^````
echo.
echo ## Cara Penggunaan
echo.
echo 1. **Backup file lama** terlebih dahulu
echo 2. **Jalankan script ini** untuk mengorganisir file
echo 3. **Salin semua file CSS dan JS** yang sudah dibuat ke folder yang sesuai
echo 4. **Update Google Apps Script** dengan file di folder google-apps-script
echo 5. **Update path gambar** di file HTML jika diperlukan
echo.
echo ## Fitur Baru
echo.
echo - **Modular Structure**: Setiap fungsi di file terpisah
echo - **Easy Maintenance**: Debugging lebih mudah
echo - **Scalable**: Mudah ditambah fitur baru
echo - **PWA Ready**: Bisa diinstall sebagai aplikasi
echo - **Audio Feedback**: Sistem audio untuk notifikasi
echo.
echo ## Developer
echo.
echo **Serka I Nyoman Arta**
echo Koramil 1609-05/Sukasada
echo Kodim 1609/Buleleng
echo.
) > README.md

echo README.md created successfully!

echo.
echo ==========================================
echo SUMMARY
echo ==========================================
echo.
echo ✅ Struktur folder berhasil dibuat:
echo.
echo Folder utama yang dibuat:
echo   - assets\           : Semua asset (CSS, JS, images)
echo   - config\           : File konfigurasi
echo   - data\             : Data dan koordinat
echo   - google-apps-script\ : Backend script
echo.
echo File yang dibuat:
echo   - index.html        : File utama HTML
echo   - README.md         : Dokumentasi
echo   - manifest.json     : PWA manifest
echo.
echo ⚠️  PERHATIAN:
echo   1. Salin semua file CSS dan JS yang sudah saya buat
echo   2. Pindahkan semua gambar banner ke assets\images\banners\
echo   3. Update path di file HTML jika diperlukan
echo   4. Backup Google Apps Script yang lama
echo.
echo ==========================================
echo DONE! Struktur siap digunakan.
echo ==========================================
echo.
pause