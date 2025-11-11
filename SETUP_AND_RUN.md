# Farm Drone App - Setup and Run Guide

## Quick Start (Copy-Paste These Commands)

### Step 1: Install Flutter SDK

Open **PowerShell as Administrator** and run:

```powershell
# Create flutter directory
New-Item -ItemType Directory -Path "C:\flutter" -Force

# Download Flutter SDK (latest stable)
$url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip"
$output = "$env:TEMP\flutter.zip"
Invoke-WebRequest -Uri $url -OutFile $output

# Extract
Expand-Archive -Path $output -DestinationPath "C:\" -Force

# Add to PATH permanently
[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\flutter\bin", "User")

Write-Host "Flutter installed! Close and reopen PowerShell to use it."
```

### Step 2: Verify Installation

**Close PowerShell and open a NEW PowerShell window**, then run:

```powershell
flutter --version
flutter doctor
```

You'll see warnings about Android SDK, Visual Studio, etc. - ignore them for now.

### Step 3: Initialize the Project

```powershell
cd "C:\Users\varsh\OneDrive\Desktop\vayu"
flutter create . --platforms=windows,web
flutter pub get
```

### Step 4: Run the App

**For Windows Desktop** (requires Visual Studio with C++ Desktop Development):
```powershell
flutter run -d windows
```

**For Web** (easiest, works in Chrome/Edge):
```powershell
flutter config --enable-web
flutter run -d chrome
```

---

## Troubleshooting

### "flutter is not recognized"
- Make sure you **closed and reopened PowerShell** after installation
- Verify PATH: `echo $env:Path | Select-String flutter`
- If not found, manually add: Settings → System → About → Advanced system settings → Environment Variables → User variables → Path → Edit → New → `C:\flutter\bin`

### No devices available
- For web: Run `flutter config --enable-web` first
- For Windows desktop: Install Visual Studio 2022 Community with "Desktop development with C++" workload

### Long path errors (OneDrive)
- Move the project to a shorter path like `C:\dev\vayu`
- Run commands from there instead

---

## What Your App Contains

✅ 16 fully designed screens:
1. Onboarding / Hero
2. Login / Verify Number  
3. Create Account
4. Welcome Screen
5. Enter Farm Details
6. Choose Plan (List)
7. Choose Plan (Premium)
8. Crop Selection
9. Collecting Images
10. Coconut Crop Hub
11. Health Summary
12. Disease Details
13. Disease Breakdown
14. Stem Bleeding Analysis
15. Expert Connect
16. Thank You

All screens use your exact color scheme (#2E7D32 green theme) and design specifications.

---

## Alternative: Online Flutter

If local setup is too complex, use:
- **DartPad** (flutter.dev/go/dartpad) - paste your code and run in browser
- **FlutLab** (flutlab.io) - full Flutter IDE in browser
- **Zapp** (zapp.run) - collaborative Flutter playground

Just create a new project and copy your `lib/` folder contents.
