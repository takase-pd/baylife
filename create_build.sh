#!/bin/zsh

# 参考
# https://takamii.hatenablog.com/entry/2020/12/06/120700

readonly TARGET_APP_VERSION = ${1} # 引数1でバージョン番号
readonly TARGET_BUILD_NO = ${2} # 引数2でビルド番号
readonly RELEASE_NOTE = ${3} # 引数3でリリースノート

flutter clean
flutter pub get
# flutter pub run flutter_launcher_icons:main
flutter packages pub run build_runner build —delete-conflicting-outputs

# Archiveを作成 → これも下記のflutter build で一発でOKのよう
# open ios/Runner.xcworkspace # Xcode上で設定する場合
# agvtool new-marketing-version ${TARGET_APP_VERSION} # 下記Flutterのコマンドで対応可能
# agvtool next-version -all ${BUILD_NUM} # 下記Flutterのコマンドで対応可能
# lutter build ipa --build-name=${TARGET_APP_VERSION} --build-number=${TARGET_BUILD_NO}

# Validation App *CLIの場合、plistの作成が必要
# open build/ios/archive/Runner.xcarchive # Xcode上で実行する場合
# xcodebuild -exportArchive -archivePath ./build/ios/archive/Runner.xcarchive \
#  -exportOptionsPlist ExportOptionsValidation.plist

# Distribute App *コマンド未確認
# xcodebuild -allowProvisioningUpdates -exportArchive \
#  -archivePath ../build/Runner.xcarchive \
#  -exportOptionsPlist ExportOptions.plist -exportPath ../Archives/Baylife
# Distribute AppはFlutterの下記だけでOK ＊今まで二重に実行していたよう
# ただし、下記を実行するためには、ExportOption.plistが必要
# 今までXcode上で作成されたものを流用すればOK
flutter build ipa  --release --build-name=${TARGET_APP_VERSION} --build-number=${TARGET_BUILD_NO} --export-options-plist=ExportOptions.plist

# Firebase App Distributionへアップ
# firebase appdistribution:distribute ./build/ios/ipa/bay_life.ipa  \
#     --app 1:317803933569:ios:030a6694ae2ea1a96e8280  \
#     --release-notes "${RELEASE_NOTE}"