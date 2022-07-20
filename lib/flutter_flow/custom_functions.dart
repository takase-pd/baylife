import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

class StateEc {
  static const String STATE_NAME = 'ec_state';
  static const String STATE_MESSAGE = 'ec_state_message';
  static const String STATE_ESTIMATED = 'ec_state_estimated';
  final bool state;
  final String message;
  final String estimated;

  StateEc({
    this.state,
    this.message,
    this.estimated,
  });

  static Future<StateEc> create() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    try {
      // Using zero duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate();
      final state = remoteConfig.getBool(STATE_NAME);
      return state
          ? StateEc(
              state: state,
            )
          : StateEc(
              state: state,
              message: remoteConfig.getString(STATE_MESSAGE),
              estimated: remoteConfig.getString(STATE_ESTIMATED),
            );
    } on PlatformException catch (exception) {
      // Fetch exception.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
      print(exception);
    }
    return StateEc(
      state: false,
    );
  }
}

String getMultilineText(String multilineText) {
  return multilineText.replaceAll(RegExp(r'\n'), r'\n');
}
