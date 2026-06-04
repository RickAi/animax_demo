# AnimaX Demo

Minimal Android and iOS apps that load `simple_shape.json` through the published AnimaX packages.

## Versions

- AnimaX: `0.0.1-alpha.9`
- Lynx: `4.0.0-nightly.202606030642.55.ga9c771cc`
- skity: `1.1.0-alpha.0`
- LynxTextra: `0.1.5`

These versions match the `publish-release` workflow run for `v0.0.1-alpha.9`.

## Android

```bash
cd android
ANDROID_HOME="$HOME/Library/Android/sdk" ./gradlew :app:assembleDebug
```

## iOS

```bash
cd ios
pod install
xcodebuild -workspace AnimaXDemo.xcworkspace -scheme AnimaXDemo -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```
