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
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/content-sendMailV2',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
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
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/survey-addSurveyAnswerV1',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class AnswersCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/survey-answersV1',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class ReviewsCall {
  static Future<ApiCallResponse> call({
    String sid = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/survey-reviewsV1',
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
      accessToken: '',
      appCheckToken: appCheckToken,
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
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/survey-addReviewV1',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class AddPlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
    int quantity,
    String added = '',
    String accessToken = '',
    String appCheckToken = '',
    bool verifyAge,
    int customerAge,
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}",
    "plan": "${plan}",
    "quantity": ${quantity},
    "verifyAge": ${verifyAge},
    "customerAge": ${customerAge},
    "added": "${added}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Plan',
      apiUrl:
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-addPlanV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'plan': plan,
        'quantity': quantity,
        'verifyAge': verifyAge,
        'customerAge': customerAge,
        'added': added,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class DeletePlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-deletePlanV0',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class GetCartCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-getCartV0',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class GetPlanCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String plan = '',
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-getPlanV0',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class GetPurchasesCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String accessToken = '',
    String appCheckToken = '',
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
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-getPurchasesV0',
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
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class PaymentCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String paymentId = '',
    int payAmount = 0,
    String date = '',
    String accessToken = '',
    String appCheckToken = '',
  }) {
    final body = '''
{
  "data": {
    "uid": "${uid}",
    "paymentId": "${paymentId}",
    "payAmount": ${payAmount},
    "date": "${date}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Payment',
      apiUrl:
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-paymentV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'uid': uid,
        'paymentId': paymentId,
        'payAmount': payAmount,
        'date': date,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class GetPaymentDetailsCall {
  static Future<ApiCallResponse> call({
    String paymentId = '',
    String accessToken = '',
    String appCheckToken = '',
  }) {
    final body = '''
{
  "data": {
    "paymentId": "${paymentId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Payment Details',
      apiUrl:
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/stripe-getPaymentDetailsV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'paymentId': paymentId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      accessToken: accessToken,
      appCheckToken: appCheckToken,
    );
  }
}

class TransactionsLawCall {
  static Future<ApiCallResponse> call({
    String path = '',
    String appCheckToken = '',
  }) {
    final body = '''
{
  "data": {
    "path": "${path}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Transactions Law',
      apiUrl:
          'https://asia-northeast1-baylife-ff782.cloudfunctions.net/ec-transactionsLawV0',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'path': path,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      accessToken: '',
      appCheckToken: appCheckToken,
    );
  }
}
