import 'package:dio/dio.dart';

class ApiBase {
  final Dio _dio;

  ApiBase(this._dio) {}

  Dio get dio => _dio;
}
