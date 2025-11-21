# Happy Graduation, Sayang

A small Flutter 3.24 app that celebrates graduation moments with a swipeable gallery, heartfelt congrats, and a TikTok AR filter redirect.

## Features
- Splash with navigation to gallery, congrats, and AR filter redirect.
- Gallery carousel backed by static JSON memories.
- Congrats page with confetti overlay.
- AR redirect powered by `url_launcher`.

## Getting Started
1. Ensure you have Flutter 3.24+ installed.
2. Fetch packages:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

Assets are already wired through `pubspec.yaml`. Drop your own JPEGs into `assets/images/` (matching the names referenced in
`assets/data/memories.json`) to personalize the memories.

## Updating your local copy with new PR changes
1. Make sure you are in the project root (the folder containing this README) inside a terminal.
2. Confirm your working tree is clean so Git can fast-forward without conflicts:
   ```bash
   git status -sb
   ```
3. Fetch the latest commits from the remote:
   ```bash
   git fetch origin
   ```
4. Pull the updates for the branch you are tracking (usually `main`). If you only need the new PR changes and have no local
   commits, a fast-forward pull is simplest:
   ```bash
   git pull --ff-only origin main
   ```
   If you do have local commits and want to replay them on top of the remote branch, use:
   ```bash
   git pull --rebase origin main
   ```
5. Re-run Flutter dependency resolution in case the PR touched `pubspec.yaml`:
   ```bash
   flutter pub get
   ```
6. Launch or test the updated code as usual with `flutter run` or `flutter test`.

## Troubleshooting: Gradle 8.13 requirement
If you hit an error similar to `Minimum supported Gradle version is 8.13. Current version is 8.10` while running `flutter run`
or debugging on Android, follow these steps:

1. **(Re)generate the Android folder** – this repo keeps only the cross-platform Dart code. In your local checkout run:
   ```bash
   flutter create .
   ```
   Flutter will scaffold the missing `android/` directory for you.
2. **Bump the Gradle wrapper to 8.13** – edit `android/gradle/wrapper/gradle-wrapper.properties` and change the
   `distributionUrl` line to:
   ```
   distributionUrl=https\://services.gradle.org/distributions/gradle-8.13-bin.zip
   ```
   This ensures both your app module and any plugins (e.g., `path_provider_android`) run with a compatible Gradle version.
3. **Clean and fetch dependencies** – remove stale build artifacts and re-download packages:
   ```bash
   flutter clean
   flutter pub get
   ```
4. **Retry the build** – run `flutter run` again. There is no need to delete your entire `~/.pub-cache`; the error is
   resolved once the project uses Gradle 8.13 or newer.

If the problem persists, run `flutter pub cache repair` to make sure cached plugins were downloaded correctly, then repeat
the steps above.
