# Netlify Deployment Guide

## Quick Start

Your Flutter web app is ready to deploy on Netlify. Follow these steps:

### 1. Connect Your GitHub Repository to Netlify

1. Go to [netlify.com](https://netlify.com) and sign up/log in
2. Click **"Add new site"** → **"Import an existing project"**
3. Choose **GitHub** as your Git provider
4. Select the repository: `Deekshith135/Vaayu_drishti_Version`
5. Authorize Netlify to access your GitHub account

### 2. Configure Build Settings

Netlify will auto-detect the `netlify.toml` file. Verify the settings:

- **Build command:** `flutter build web --release`
- **Publish directory:** `build/web`

Click **"Deploy site"** to start the deployment.

### 3. Monitor Deployment

- Netlify will clone your repo
- Run `flutter build web --release` to create an optimized production build
- Deploy the contents of `build/web` to their CDN
- You'll receive a live URL (e.g., `https://vaayu-drishti.netlify.app`)

## What's Configured

✅ **netlify.toml** — Build and deployment settings
✅ **SPA Routing** — All routes redirect to `index.html` (Flutter routing works correctly)
✅ **Release Build** — Optimized for production performance

## Troubleshooting

### Build fails: "flutter not found"

Netlify doesn't have Flutter pre-installed. You have two options:

**Option A: Use Docker (Recommended)**
Add to `netlify.toml`:

```toml
[build]
image = "mcr.microsoft.com/mirror/node:18"
```

Then manually configure the build in Netlify UI to use a Docker image with Flutter.

**Option B: Pre-build locally and commit to `build/web`**
Run locally:

```bash
flutter build web --release
git add build/web
git commit -m "Add pre-built web distribution"
git push
```

Update `netlify.toml`:

```toml
[build]
command = "echo 'Using pre-built web'"
publish = "build/web"
```

### Best Solution: Use Netlify CLI with Build Plugin

```bash
npm install -g netlify-cli
netlify deploy --prod --dir=build/web
```

Or set up GitHub Actions to build and deploy automatically.

## Deployment Status

- ✅ Repository: https://github.com/Deekshith135/Vaayu_drishti_Version
- 🔄 Netlify configuration added
- ⏳ Next: Connect to Netlify and deploy

Enjoy your live app! 🚀
