# 🚢 MSC Vessel Tracker - Flutter

Track MSC cruise ships in real-time on an interactive map with route visualization.

![Flutter](https://img.shields.io/badge/Flutter-3.24-02569B?logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Android%20%7C%20iOS-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- 🗺️ **Interactive Map** - Google Maps with custom markers
- 🚢 **Real-time Tracking** - Track multiple vessels simultaneously
- 📍 **Route Visualization** - Animated route drawing
- 📱 **Responsive Design** - Works on web, mobile, and tablet
- 🎨 **MSC Branding** - Official MSC colors and styling
- 🔄 **Auto-refresh** - Mock data for testing

## 🚀 Quick Start

### Option 1: GitHub Codespaces (No Installation Required) ⭐

1. **Fork this repository**
2. Click **Code** → **Codespaces** → **Create codespace**
3. Wait 2-3 minutes for environment setup
4. Run:
   ```bash
   flutter pub get
   flutter run -d web-server --web-port 8080
   ```
5. Click on the forwarded port to view the app

### Option 2: Local Development

#### Prerequisites
- Flutter SDK 3.24 or higher
- Dart SDK 3.2 or higher
- Git

#### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/msc-vessel-tracker.git
cd msc-vessel-tracker

# Get dependencies
flutter pub get

# Generate JSON serialization
flutter pub run build_runner build --delete-conflicting-outputs

# Run on web
flutter run -d chrome

# Or run on mobile
flutter run
```

## 🌐 Deploy to GitHub Pages

This project includes automatic deployment to GitHub Pages via GitHub Actions.

### Setup:

1. **Enable GitHub Pages**:
   - Go to repository **Settings** → **Pages**
   - Source: **Deploy from a branch**
   - Branch: **gh-pages** → **/ (root)**
   - Save

2. **Push to main branch**:
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

3. **Wait for deployment**:
   - Go to **Actions** tab
   - Watch the build process
   - Once complete, your app will be live at:
     `https://YOUR_USERNAME.github.io/msc-vessel-tracker/`

## 🗺️ Google Maps Setup

### Get API Key:

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project
3. Enable **Maps JavaScript API**
4. Create credentials → **API Key**
5. Copy the key

### Add to project:

Edit `web/index.html` (line 18):
```html
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE"></script>
```

**For production**: Restrict your API key to your domain!

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── vessel.dart          # Vessel data model
│   └── vessel.g.dart        # Generated JSON serialization
├── services/
│   └── mock_data_service.dart  # Mock data provider
├── providers/
│   └── vessel_provider.dart    # State management
├── screens/
│   └── map_screen.dart         # Main map view
└── widgets/
    └── vessel_list_sheet.dart  # Vessel list bottom sheet
```

## 🎨 Features Detail

### Route View Mode
1. Click FAB (floating action button) to open vessel list
2. Select a vessel
3. Click **"Percorso"** button
4. Watch animated route drawing
5. Click **"Torna alla Mappa"** to exit

### Mock Data
The app includes realistic mock data for:
- **8 vessels** with complete information
- **8 cruise routes** across Caribbean, Mediterranean, and Asia
- Real coordinates and timestamps

### Vessels Included:
- Explora I (Caribbean cruise)
- MSC Grandiosa (Jamaica route)
- MSC Seaside (Bahamas)
- MSC Meraviglia (Florida)
- MSC Bellissima (Shanghai)
- MSC World Europa (Portugal → Spain)
- MSC Seashore (Tampa)
- MSC Virtuosa (Caribbean islands)

## 🔧 Configuration

### Change Map Initial Position

Edit `lib/screens/map_screen.dart`:
```dart
static const CameraPosition _initialPosition = CameraPosition(
  target: LatLng(25.0, -80.0),  // Change coordinates
  zoom: 3.0,                     // Change zoom level
);
```

### Adjust Animation Speed

Edit `lib/screens/map_screen.dart`:
```dart
_animationTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
  // Change 100 to 50 for faster, 200 for slower
});
```

## 🚀 Build for Production

### Web
```bash
flutter build web --release
# Output: build/web/
```

### Android
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### iOS
```bash
flutter build ios --release
# Requires macOS and Xcode
```

## 🐛 Troubleshooting

### White screen on web
- Check browser console for errors
- Verify Google Maps API key is valid
- Clear browser cache

### Build errors
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### GitHub Actions fails
- Check workflow file syntax
- Verify Flutter version compatibility
- Check build logs in Actions tab

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [Google Maps Flutter Plugin](https://pub.dev/packages/google_maps_flutter)
- [Provider State Management](https://pub.dev/packages/provider)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Credits

- MSC Cruises for brand inspiration
- Flutter team for amazing framework
- Google Maps Platform

---

**Made with ❤️ and Flutter**

🚢 Happy vessel tracking! ⚓
