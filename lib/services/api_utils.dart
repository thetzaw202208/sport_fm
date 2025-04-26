import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sport_fm/services/api_constant.dart';
import 'package:sport_fm/services/local_storage.dart';
import 'package:sport_fm/utils/constants.dart';

import '../utils/custom_exception.dart';

class ApiUtils {
  final _dio = Dio();
  LocalStorage box=LocalStorage();
  String? token;
  static final ApiUtils singleton = ApiUtils._();
  factory ApiUtils() => singleton;
  ApiUtils._() {
    _dio.options.baseUrl = ApiConstant.baseUrl;
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
    _dio.options.sendTimeout = const Duration(seconds: 20);
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = '*/*';


      token = box.read('accessKey');
     print('xxxxxxxxxx $token');
     _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // void updateToken(String token) {
  //   _dio.options.headers['Authorization'] = 'Bearer $token';
  //   MyShare.saveToken(token);
  // }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }

    try {
      token = box.read('accessKey');
      print('xxxxxxxxxx $token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }
  Future<Response> postRefresh({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
    try {
      token = box.read('refreshKey');
      print('xxxxxxxxxx $token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.data['success'] == false) {
        throw CustomException(response.data['message']);
      }
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }
  Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
    try {
      token = box.read('accessKey');
      print('xxxxxxxxxx $token');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.data['success'] == false) {
        throw CustomException(response.data['message']);
      }
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }

  Future<Response> patch({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.data['success'] == false) {
        throw CustomException(response.data['message']);
      }
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }

  Future<Response> delete({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }

    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.cancel) {
        throw CustomException("Request to API server was cancelled");
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw CustomException(
            "Receiving time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.sendTimeout) {
        throw CustomException(
            "Sending time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        throw CustomException(
            "Connecting time out! Please check your network connection.");
      } else if (dioError.type == DioExceptionType.badCertificate) {
        throw CustomException("Caused by an incorrect certificate.");
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${dioError.response?.statusCode}");
      } else if (dioError.type == DioExceptionType.connectionError) {
        throw CustomException("Caused by SocketExceptions.");
      } else if (dioError.type == DioExceptionType.unknown) {
        throw CustomException(
            "Cannot connect to server! Please check your network connection.");
      } else {
        throw CustomException();
      }
    }
  }
}
