import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RegistContentsCall {
  static Future<ApiCallResponse> call({
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
    String filePath =
        'https://firebasestorage.googleapis.com/v0/b/baylife-ff782.appspot.com/o/assets%2FNoImage.png?alt=media&token=cfb3d70b-69d2-4f7f-be63-f429cc9872da',
    String postRemarks = '',
    String uid = '',
  }) {
    final body = '''
{
  "data": {
    "catName": "${catName}",
    "catNameAdd": "${catNameAdd}",
    "title": "${title}",
    "overview": "${overview}",
    "detail": "${detail}",
    "organizer": "${organizer}",
    "contact": "${contact}",
    "homepage": "${homepage}",
    "postName": "${postName}",
    "postEmail": "${postEmail}",
    "postPhone": "${postPhone}",
    "postOccupation": "${postOccupation}",
    "permission": ${permission},
    "address": "${address}",
    "startDay": "${startDay}",
    "finalDay": "${finalDay}",
    "filePath": "${filePath}",
    "postRemarks": "${postRemarks}",
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Regist Contents',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/content-sendMailV1',
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
        'postRemarks': postRemarks,
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddSurveyAnswerCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String sid = '',
    String choice = '',
    String date = '',
    String freeAnswer = '',
  }) {
    final body = '''
{
  "data": {
    "sid": "${sid}",
    "uid": "${uid}",
    "choice": "${choice}",
    "freeAnswer": "${freeAnswer}",
    "date": "${date}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Survey Answer',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/survey-addSurveyAnswerV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'sid': sid,
        'choice': choice,
        'date': date,
        'freeAnswer': freeAnswer,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AnswersCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Answers',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/survey-answersV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ReviewsCall {
  static Future<ApiCallResponse> call({
    String sid = '',
  }) {
    final body = '''
{
  "data": {
    "sid": "${sid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reviews',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/survey-reviewsV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'sid': sid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddReviewCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String sid = '',
    String date = '',
    String comment = '',
    String tag = '',
  }) {
    final body = '''
{
  "data": {
    "sid": "${sid}",
    "uid": "${uid}",
    "comment": "${comment}",
    "tag": "${tag}",
    "date": "${date}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Review',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/survey-addReviewV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'sid': sid,
        'date': date,
        'comment': comment,
        'tag': tag,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class AddPlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
    int quantity,
    int unitAmount,
    String date = '',
    String name = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}",
    "plan": "${plan}",
    "quantity": ${quantity},
    "unit_amount": ${unitAmount},
    "name": "${name}",
    "date": "${date}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Plan',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-addPlanV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'plan': plan,
        'quantity': quantity,
        'unit_amount': unitAmount,
        'date': date,
        'name': name,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class DeletePlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}",
    "plan": "${plan}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Plan',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-deletePlanV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'plan': plan,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdatePlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
    int quantity,
    int unitAmount,
    String date = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}",
    "plan": "${plan}",
    "quantity": ${quantity},
    "unit_amount": ${unitAmount},
    "date": "${date}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Plan',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-updatePlanV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'plan': plan,
        'quantity': quantity,
        'unit_amount': unitAmount,
        'date': date,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetCartCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Cart',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-getCartV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetPlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}",
    "plan": "${plan}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Plan',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-getPlanV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'plan': plan,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetPurchasesCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Purchases',
      apiUrl:
          'https://asia-northeast1-baylifedev.cloudfunctions.net/ec-getPurchasesV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
