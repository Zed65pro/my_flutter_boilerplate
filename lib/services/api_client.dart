import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import '../error/api_exception.dart';

enum RequestType { GET, POST, PUT, DELETE }

// SINGLETON CLASS
class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  ApiClient._internal() {
    final options = BaseOptions(
      persistentConnection: true,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
    );

    _dioClient = Dio(options);
  }

  late Dio _dioClient;

  void setToken(String? token) => _dioClient.options.headers['Authorization'] = 'Token $token';

  void removeToken() => _dioClient.options.headers.remove('Authorization');

  Future<Response<dynamic>> request(RequestType requestType, String url, {dynamic data, String? token}) async {
    try {
      switch (requestType) {
        case RequestType.GET:
          return await _dioClient.get(url, queryParameters: data);
        case RequestType.POST:
          return await _dioClient.post(url, data: data);
        case RequestType.PUT:
          return await _dioClient.put(url, data: data);
        case RequestType.DELETE:
          return await _dioClient.delete(url, queryParameters: data);
        default:
          throw Exception('"_request" has an Undefined request type');
      }
    } on NetworkException {
      throw NetworkException('Network Error occurred', null);
    } on SocketException {
      throw NetworkException('Network Error occurred', null);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) throw TimeoutException('Time out exception', e.response?.data);

      if (e.type == DioExceptionType.connectionError) throw NetworkException('Network Error occurred', e.response?.data);

      switch (e.response?.statusCode) {
        case 400:
          throw ValidationException('Bad request', e.response?.data);
        case 401:
          throw UnauthorizedException('Unauthorized', e.response?.data);
        case 403:
          throw ForbiddenException('Forbidden', e.response?.data);
        case 429:
          throw TooManyRequestsException('Too many requests', e.response?.data);
        case 426:
          throw UpgradeRequiredException('Upgrade Required', e.response?.data);
        case 500:
          throw InternalServerErrorException('Internal Server Error', e.response?.data);
        default:
          throw ApiException('HTTP Error ${e.response!.statusCode}', e.response?.data);
      }
    }
  }

  Future<Response<dynamic>> post(String url, {dynamic data}) async {
    return await request(RequestType.POST, url, data: data);
  }

  Future<Response<dynamic>> get(String url, {dynamic data}) async {
    return await request(RequestType.GET, url, data: data);
  }

  Future<Response<dynamic>> delete(String url, {dynamic data}) async {
    return await request(RequestType.DELETE, url, data: data);
  }

  Future<Response<dynamic>> put(String url, {dynamic data}) async {
    return await request(RequestType.PUT, url, data: data);
  }

  Future<String> downloadFile(String url, fileName) async {
    String filePath = '';

    if (Platform.isAndroid) {
      Directory? dir = await getExternalStorageDirectory();
      filePath = '${dir?.path}/$fileName';
    } else {
      filePath = '${(await getLibraryDirectory()).path}/$fileName';
    }

    await _dioClient.download(url, filePath);

    return filePath;
  }
}
