import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioService {
  late final Dio _dio;
 late final Connectivity _connectivity;

  DioService(){
     _dio = Dio();
     _dio.options = BaseOptions(baseUrl: "https://fakestoreapi.com");
        _connectivity = Connectivity();
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final result = await _dio.get(url,
          queryParameters: queryParameters, options: options);
      return result;
    } on DioException catch (e) {
      return handleDioException(e);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<Response> post(String url,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final result = await _dio.post(url,
          data: data, queryParameters: queryParameters, options: options);
      return result;
    } on DioException catch (e) {
      return handleDioException(e);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<Response> put(String url,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final result = await _dio.put(url,
          data: data, queryParameters: queryParameters, options: options);
      return result;
    } on DioException catch (e) {
      return handleDioException(e);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final result = await _dio.delete(url,
          queryParameters: queryParameters, options: options);
      return result;
    } on DioException catch (e) {
      return handleDioException(e);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Response handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw Exception('Connection timed out');
      case DioExceptionType.sendTimeout:
        throw Exception('Send timeout');
      case DioExceptionType.receiveTimeout:
        throw Exception('Receive timeout');
      case DioExceptionType.badResponse:
        throw Exception('Bad response');
      case DioExceptionType.cancel:
        throw Exception('Request canceled');
      case DioExceptionType.unknown:
        throw Exception('Unknown error');
      case DioExceptionType.badCertificate:
        throw Exception('Bad Certificate');
      case DioExceptionType.connectionError:
        throw Exception('Connection Error');
    }
  }

  Response handleException(Exception e) {
    throw Exception('Unknown error: $e');
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.first == ConnectivityResult.none;
  }

  void setHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
}
