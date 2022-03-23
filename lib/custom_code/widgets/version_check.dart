import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/services.dart';

class VersionCheck {
  static const String CONFIG_VERSION = 'force_update_buildnumber';

  Future<bool> versionCheck() async {
    final info = await PackageInfo.fromPlatform();
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    int currentVersion = int.parse(info.buildNumber);

    try {
      // Using zero duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate();
      int newVersion = remoteConfig.getInt(CONFIG_VERSION);
      if (newVersion > currentVersion) {
        return true;
      }
    } on PlatformException catch (exception) {
      // Fetch exception.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
      print(exception);
    }
    return false;
  }
}
