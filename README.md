# AnimaX Demo

Minimal Android and iOS apps that load `simple_shape.json` through the published AnimaX packages.

## Versions

- AnimaX: `1.0.0`
- Lynx: `4.0.0-nightly.202606030642.55.ga9c771cc`
- skity: `1.1.0-alpha.0`
- LynxTextra: `0.1.5`

These versions use the published AnimaX `1.0.0` packages with the runtime dependency versions listed above.

## Android

### Run with Android Studio

1. Open Android Studio.
2. Choose `Open`, then select the `android` directory in this repo.
3. Wait for Gradle Sync to finish.
4. Select the `app` run configuration.
5. Select an Android emulator or a connected Android device.
6. Click `Run`.

The demo package is `com.rickai.animaxdemo`.

### Run from Command Line

Build the debug APK:

```bash
cd android
ANDROID_HOME="$HOME/Library/Android/sdk" ./gradlew :app:assembleDebug
```

Install and launch it on a connected device or emulator:

```bash
cd android
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
"$ANDROID_HOME/platform-tools/adb" devices
"$ANDROID_HOME/platform-tools/adb" install -r app/build/outputs/apk/debug/app-debug.apk
"$ANDROID_HOME/platform-tools/adb" shell am start -n com.rickai.animaxdemo/.MainActivity
```

## iOS

### Run with Xcode

Install pods and open the workspace:

```bash
cd ios
pod install
open AnimaXDemo.xcworkspace
```

In Xcode:

1. Open `AnimaXDemo.xcworkspace`, not `AnimaXDemo.xcodeproj`.
2. Select the `AnimaXDemo` scheme.
3. Select an iOS Simulator.
4. Click `Run`.

For a physical device, choose your Apple Team in `Signing & Capabilities`.

### Run from Command Line

Build for iOS Simulator:

```bash
cd ios
pod install
xcodebuild -workspace AnimaXDemo.xcworkspace -scheme AnimaXDemo -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

Install and launch on a simulator:

```bash
cd ios
pod install
xcrun simctl list devices available

# Paste a simulator UDID from the list above.
DEVICE_UDID="PASTE_SIMULATOR_UDID_HERE"
xcrun simctl boot "$DEVICE_UDID" || true
xcrun simctl bootstatus "$DEVICE_UDID"

DERIVED_DATA_PATH="$(pwd)/build/DerivedData"
xcodebuild \
  -workspace AnimaXDemo.xcworkspace \
  -scheme AnimaXDemo \
  -sdk iphonesimulator \
  -destination "platform=iOS Simulator,id=$DEVICE_UDID" \
  -derivedDataPath "$DERIVED_DATA_PATH" \
  CODE_SIGNING_ALLOWED=NO \
  build

xcrun simctl install "$DEVICE_UDID" "$DERIVED_DATA_PATH/Build/Products/Debug-iphonesimulator/AnimaXDemo.app"
xcrun simctl launch "$DEVICE_UDID" com.rickai.animaxdemo
```
