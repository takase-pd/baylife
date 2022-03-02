# get the latest FlutterFlow version
# git fetch
# git merge origin/flutterflow

# Flutter compile
# fvm flutter pub get
fvm flutter clean
fvm flutter pub upgrade
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
# fvm flutter run -d iPhone\ Xs
fvm flutter run