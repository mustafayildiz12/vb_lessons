import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_servis_learn_202/models/comment_model.dart';
import 'package:logger/logger.dart';

import '../models/post_model.dart';

abstract class IDioService {
  Future<List<PostModel>?> getPost();
  Future<List<CommentModel>?> getComments(int id);
}

class DioService implements IDioService {
  final Dio _dio;
  final logger = Logger();

  DioService()
      : _dio = Dio(
          BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
        );

  @override
  Future<List<PostModel>?> getPost() async {
    try {
      final response = await _dio.get("posts");
      if (response.statusCode == HttpStatus.ok) {
        var _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      logger.e(error.message);
      logger.e(error.type);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> getComments(int id) async {
    try {
      final response =
          await _dio.get("comments", queryParameters: {"userId": id});

      if (response.statusCode == HttpStatus.ok) {
        var _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      logger.e(error.message);
      logger.e(error.type.name);
      logger.e(error.response?.statusCode);
    }
  }
}
