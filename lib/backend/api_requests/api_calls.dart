import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start AI Spymaster Group Code

class AISpymasterGroup {
  static GetClueCall getClueCall = GetClueCall();
}

class GetClueCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? systemPrompt = '',
    String? userPrompt = '',
    String? modelName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetClueCall',
        'variables': {
          'apiKey': apiKey,
          'systemPrompt': systemPrompt,
          'userPrompt': userPrompt,
          'modelName': modelName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic rawClue(dynamic response) => getJsonField(
        response,
        r'''$.choices[0].message.content''',
      );
}

/// End AI Spymaster Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
