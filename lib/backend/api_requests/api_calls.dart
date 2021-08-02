import 'api_manager.dart';

Future<dynamic> registContentsCall({
  String name = 'Default Name',
  String email = 'info@particledrawing.com',
  String content = 'Decault Content',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Regist Contents',
      apiDomain: 'us-central1-baylife-ff782.cloudfunctions.net',
      apiEndpoint: 'sendMail',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'data': {
          'name': name,
          'email': email,
          'content': content,
        },
      },
      returnResponse: true,
    );
