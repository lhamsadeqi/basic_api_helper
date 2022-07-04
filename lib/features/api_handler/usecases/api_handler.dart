library api_handler;

import 'package:api_handler/features/api_handler/data/models/query_model.dart';

import '../../../core/token/token.dart';
import '../data/enums/header_enum.dart';
import '../../../core/api_data/api_data.dart';
import '../../../core/api_method/api_method.dart';
import '../data/enums/response_enum.dart';
import '../data/models/response_model.dart';

class APIHandler {
  final GetApi _getApi = GetApi();
  final PostApi _postApi = PostApi();
  final PutApi _putApi = PutApi();
  final DeleteApi _deleteApi = DeleteApi();

  /// sets Token to use bearer header in APIs.
  setToken(String? token) {
    Token _token = Token();
    _token.setToken = token;
  }

  /// calls a 'Get' API and returns a `ResponseModel`.
  Future<ResponseModel> get(
    String url, {
    List<QueryModel>? queries,
    String? pathVariable,
    required HeaderEnum headerEnum,
    required ResponseEnum responseEnum,
  }) async {
    return await _getApi(GetApiData(
      url,
      queries: queries,
      pathVars: pathVariable,
      headerEnum: headerEnum,
      responseEnum: responseEnum,
    ));
  }

  /// calls a 'Post' API and returns a `ResponseModel`.
  Future<ResponseModel> post(
    String url, {
    List<QueryModel>? queries,
    String? pathVariable,
    dynamic body,
    required HeaderEnum headerEnum,
    required ResponseEnum responseEnum,
  }) async {
    return _postApi(PostApiData(
      url,
      queries: queries,
      pathVars: pathVariable,
      body: body,
      headerEnum: headerEnum,
      responseEnum: responseEnum,
    ));
  }

  /// calls a 'put' API and returns a `ResponseModel`.
  Future<ResponseModel> put(
    String url, {
    List<QueryModel>? queries,
    String? pathVariable,
    dynamic body,
    required HeaderEnum headerEnum,
    required ResponseEnum responseEnum,
  }) async {
    return _putApi(PutApiData(
      url,
      queries: queries,
      pathVars: pathVariable,
      body: body,
      headerEnum: headerEnum,
      responseEnum: responseEnum,
    ));
  }

  /// calls a 'delete' API and returns a `ResponseModel`.
  Future<ResponseModel> delete(
    String url, {
    List<QueryModel>? queries,
    String? pathVariable,
    dynamic body,
    required HeaderEnum headerEnum,
    required ResponseEnum responseEnum,
  }) async {
    return _deleteApi(DeleteApiData(
      url,
      queries: queries,
      pathVars: pathVariable,
      body: body,
      headerEnum: headerEnum,
      responseEnum: responseEnum,
    ));
  }
}
