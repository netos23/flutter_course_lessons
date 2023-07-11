import 'package:dio/dio.dart';
import 'package:flutter_async_lesson/model/charecter.dart';
import 'package:retrofit/http.dart';

part 'service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character/{id}")
  Future<Character> getCharecter(@Path() int id);
}

