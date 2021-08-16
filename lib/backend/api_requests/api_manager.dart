import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

enum ApiCallType {
  GET,
  POST,
}

class ApiCallRecord extends Equatable {
  ApiCallRecord(
      this.callName, this.domain, this.endpoint, this.headers, this.params);
  final String callName;
  final String domain;
  final String endpoint;
  final Map<String, dynamic> headers;
  final Map<String, dynamic> params;

  @override
  List<Object> get props => [callName, domain, endpoint, headers, params];
}

class ApiManager {
  ApiManager._();

  // Cache that will ensure identical calls are not repeatedly made.
  static Map<ApiCallRecord, dynamic> _apiCache = {};

  static ApiManager _instance;
  static ApiManager get instance => _instance ??= ApiManager._();

  // If your API calls need authentication, populate this field once
  // the user has authenticated. Alter this as needed.
  static String _accessToken;

  // You may want to call this if, for example, you make a change to the
  // database and no longer want the cached result of a call that may
  // have changed.
  static void clearCache(String callName) => _apiCache.keys
      .toSet()
      .forEach((k) => k.callName == callName ? _apiCache.remove(k) : null);

  static Map<String, String> toStringMap(Map<String, dynamic> map) =>
      map.map((key, value) => MapEntry(key, value.toString()));

  static String asQueryParams(Map<String, dynamic> map) =>
      map.entries.map((e) => "${e.key}=${e.value}").join('&');

  static Future<dynamic> getRequest(
    String apiUrl,
    Map<String, dynamic> headers,
    Map<String, dynamic> params,
    bool returnResponse,
  ) async {
    if (params.isNotEmpty) {
      final lastUriPart = apiUrl.split('/').last;
      final needsParamSpecifier = !lastUriPart.contains('?');
      apiUrl =
          '$apiUrl${needsParamSpecifier ? '?' : ''}${asQueryParams(params)}';
    }
    final response =
        await http.get(Uri.parse(apiUrl), headers: toStringMap(headers));
    return returnResponse ? json.decode(response.body) : null;
  }

  static Future<dynamic> postRequest(
    String apiUrl,
    Map<String, dynamic> headers,
    Map<String, dynamic> params,
    bool returnResponse,
  ) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: toStringMap(headers),
      body: json.encode(params),
    );
    return returnResponse ? json.decode(response.body) : null;
  }

  Future<dynamic> makeApiCall({
    String callName,
    String apiUrl,
    ApiCallType callType,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> params = const {},
    bool returnResponse,
  }) async {
    // Modify for your specific needs if this differs from your API.
    if (_accessToken != null) {
      headers[HttpHeaders.authorizationHeader] = 'Token $_accessToken';
    }
    if (!apiUrl.startsWith('http')) {
      apiUrl = 'https://$apiUrl';
    }

    var result;
    switch (callType) {
      case ApiCallType.GET:
        result = await getRequest(apiUrl, headers, params, returnResponse);
        break;
      case ApiCallType.POST:
        result = await postRequest(apiUrl, headers, params, returnResponse);
        break;
    }

    return result;
  }
}
