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
  String filePath = '',
}) {
  final body = '''
{
  "data": {
    "catName": "$catName",
    "catNameAdd": "$catNameAdd",
    "title": "$title",
    "overview": "$overview",
    "detail": "$detail",
    "organizer": "$organizer",
    "contact": "$contact",
    "homepage": "$homepage",
    "postName": "$postName",
    "postEmail": "$postEmail",
    "postPhone": "$postPhone",
    "postOccupation": "$postOccupation",
    "permission": $permission,
    "address": "$address",
    "startDay": "$startDay",
    "finalDay": "$finalDay",
    "filePath": "$filePath"
  }
}''';
  return ApiManager.instance.makeApiCall(
    callName: 'Regist Contents',
    apiUrl: 'https://us-central1-baylife-ff782.cloudfunctions.net/sendMail',
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
      'filePath': filePath,
    },
    body: body,
    bodyType: BodyType.JSON,
    returnResponse: true,
  );
}
