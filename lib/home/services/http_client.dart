import 'package:desafio_dryve/home/interfaces/http_client.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements HttpClient {
  final Dio dio;

  DioHttpClient({String baseUrl = ""})
      : dio = Dio(BaseOptions(baseUrl: baseUrl, receiveTimeout: 10000));

  @override
  Future<Object> find(String path) async {
    Response response = await dio.get(path);
    return response.data;
  }
}
