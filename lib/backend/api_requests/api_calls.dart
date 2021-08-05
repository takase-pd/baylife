import 'api_manager.dart';

Future<dynamic> registContentsCall({
  String catName = 'デフォルト',
  String catNameAdd = '',
  String title = 'デフォルト',
  String overview = 'デフォルト',
  String detail = 'デフォルト',
  String organizer = 'デフォルト',
  String contact = 'デフォルト',
  String homepage = '',
  String postName = 'デフォルト',
  String postEmail = '',
  String postPhone = '',
  String postOccupation = 'デフォルト',
  bool permission = false,
  String address = 'デフォルト',
  String startDay = '',
  String finalDay = '',
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
        'catName': catName,
        'catNameAdd': catNameAdd,
        'title': title,
        'overview': overview,
        'detail': detail,
        'organizer': organizer,
        'contact': contact,
        'homepage': homepage,
        'postName': postName,
        'postEmail': postEmail,
        'postPhone': postPhone,
        'postOccupation': postOccupation,
        'permission': permission,
        'address': address,
        'startDay': startDay,
        'finalDay': finalDay,
      },
      returnResponse: true,
    );
