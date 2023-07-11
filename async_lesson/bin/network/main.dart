import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'model/charecter.dart';
import 'service/service.dart';

Future<void> main() async {
  final dio = Dio();
  dio.options.baseUrl = 'https://rickandmortyapi.com';

  final api = RestClient(dio);
  final ch =  await api.getCharecter(2);
  print(ch);
}
