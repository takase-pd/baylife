#!/bin/zsh

# 参考
# https://takamii.hatenablog.com/entry/2020/12/06/120700

readonly TARGET_APP_VERSION = ${1} # 引数1でバージョン番号
readonly TARGET_BUILD_NO = ${2} # 引数2でビルド番号
readonly RELEASE_NOTE = ${3} # 引数2でビルド番号


flutter clean

flutter pub get

# flutter pub run flutter_launcher_icons:main

flutter packages pub run build_runner build —delete-conflicting-outputs

# open ios/Runner.xcworkspace
# agvtool new-marketing-version ${TARGET_APP_VERSION}
# agvtool next-version -all ${BUILD_NUM}

flutter build ipa --build-name=${TARGET_APP_VERSION} --build-number=${TARGET_BUILD_NO}

# open build/ios/archive/Runner.xcarchive
# Validation App *plistの作成が必要
# xcodebuild -exportArchive -archivePath ./build/ios/archive/Runner.xcarchive -exportOptionsPlist ExportOptionsProdValidate.plist
# Distribute App *コマンド未確認
# 

# flutter build ipa --export-options-plist=/Users/yuji/Work/Flutter/Archives/BayLife2021-08-26_15-44-09/ExportOptions.plist
flutter build ipa --export-options-plist=/path/to/ExportOptions.plist

firebase appdistribution:distribute /Users/yuji/Work/Flutter/baylife/build/ios/ipa/bay_life.ipa  \
    --app 1:317803933569:ios:030a6694ae2ea1a96e8280  \
    --release-notes "${RELEASE_NOTE}"