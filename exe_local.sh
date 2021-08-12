# get the latest FlutterFlow version
git fetch
git merge origin/flutterflow

# Flutter compile
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run -d iPhone\ Xs