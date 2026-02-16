# 🚀 Setup Guide - GitHub Deployment

Complete guide to get your MSC Vessel Tracker running on GitHub Pages without installing Flutter locally.

## 📋 Prerequisites

- GitHub account
- Google Maps API key (free tier: 28,000 map loads/month)

---

## Step 1️⃣: Fork Repository

1. Click **Fork** button (top right)
2. Choose your account
3. Wait for fork to complete

---

## Step 2️⃣: Get Google Maps API Key

### Create API Key:

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create new project: **"MSC Vessel Tracker"**
3. Navigate to **APIs & Services** → **Library**
4. Search and enable:
   - ✅ **Maps JavaScript API**
   - ✅ **Maps SDK for Android** (optional)
   - ✅ **Maps SDK for iOS** (optional)
5. Go to **Credentials** → **Create Credentials** → **API Key**
6. Copy the key (looks like: `AIzaSyXXXXXXXXXXXXXXXXXXXX`)

### Add API Key to Project:

1. In your forked repo, click `web/index.html`
2. Click **Edit** (pencil icon)
3. Find line 18:
   ```html
   <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY"></script>
   ```
4. Replace `YOUR_GOOGLE_MAPS_API_KEY` with your actual key
5. **Commit changes**

---

## Step 3️⃣: Enable GitHub Pages

1. Go to **Settings** → **Pages**
2. Under **Source**:
   - Select: **Deploy from a branch**
   - Branch: **gh-pages**
   - Folder: **/ (root)**
3. Click **Save**

---

## Step 4️⃣: Configure Deployment

### Update base-href:

1. Edit `.github/workflows/deploy.yml`
2. Line 27, change:
   ```yaml
   run: flutter build web --release --base-href "/msc-vessel-tracker/"
   ```
   To match your repo name:
   ```yaml
   run: flutter build web --release --base-href "/YOUR-REPO-NAME/"
   ```
3. **Commit changes**

---

## Step 5️⃣: Trigger Build

### Option A: Push a change
```bash
# Make any small change and push
git commit --allow-empty -m "Trigger build"
git push
```

### Option B: Manual trigger
1. Go to **Actions** tab
2. Select **Build and Deploy Flutter Web**
3. Click **Run workflow** → **Run workflow**

---

## Step 6️⃣: Wait for Deployment

1. Go to **Actions** tab
2. Watch the workflow run (takes ~3-5 minutes)
3. Green checkmark ✅ = Success!

---

## Step 7️⃣: View Your App! 🎉

Your app is now live at:
```
https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/
```

Example:
```
https://johndoe.github.io/msc-vessel-tracker/
```

---

## 🔧 Development Without Installing Flutter

### Option 1: GitHub Codespaces (Recommended)

1. Click **Code** → **Codespaces** → **Create codespace**
2. Wait 2-3 minutes
3. Run:
   ```bash
   flutter pub get
   flutter run -d web-server --web-port 8080
   ```
4. Click on forwarded port to preview

### Option 2: Gitpod

1. Add `gitpod.io/#` before your repo URL:
   ```
   https://gitpod.io/#https://github.com/YOUR-USERNAME/YOUR-REPO
   ```
2. Wait for environment setup
3. Same commands as Codespaces

---

## 📱 Test on Mobile Devices

Once deployed, you can test on any device by visiting your GitHub Pages URL!

---

## 🐛 Troubleshooting

### Build Failed in Actions

**Check logs:**
1. Go to **Actions** tab
2. Click on failed workflow
3. Check error messages

**Common fixes:**
```bash
# In Codespaces:
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Map Not Showing

**Check:**
1. API key is correct in `web/index.html`
2. Maps JavaScript API is enabled in Google Cloud
3. Browser console for errors (F12)

### 404 Page Not Found

**Fix base-href:**
1. Edit `.github/workflows/deploy.yml`
2. Make sure `--base-href` matches your repo name
3. Commit and push

### White Screen

**Solutions:**
1. Clear browser cache (Ctrl+Shift+Delete)
2. Try incognito/private mode
3. Check browser console (F12) for errors

---

## 🔐 Security Best Practices

### Restrict API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. **Credentials** → Click your API key
3. **Application restrictions**:
   - Select: **HTTP referrers**
   - Add: `https://YOUR-USERNAME.github.io/*`
4. **API restrictions**:
   - Select: **Restrict key**
   - Select only: **Maps JavaScript API**
5. **Save**

This prevents unauthorized use of your API key!

---

## 🎨 Customization

### Change App Name

Edit `web/index.html` and `web/manifest.json`:
```html
<title>Your Custom Name</title>
```

### Change Colors

Edit `lib/main.dart`:
```dart
primaryColor: const Color(0xFFYOURCOLOR),
```

### Add More Vessels

Edit `lib/services/mock_data_service.dart` and add vessels to `_mockVessels` list.

---

## 📊 Monitor Usage

### Check API Usage:

1. [Google Cloud Console](https://console.cloud.google.com)
2. **APIs & Services** → **Dashboard**
3. View **Maps JavaScript API** usage
4. Free tier: 28,000 map loads/month

---

## 🆘 Need Help?

1. Check [README.md](README.md) for detailed docs
2. Search [Flutter docs](https://docs.flutter.dev)
3. Open an issue in the repository

---

**You're all set! 🎉**

Your MSC Vessel Tracker is now live on GitHub Pages without installing anything on your computer!

🚢 Happy tracking! ⚓
