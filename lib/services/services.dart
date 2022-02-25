import 'package:dio/dio.dart';
import 'package:pretest/model/list_model.dart';

class Services {
  /// Get all list data
  static Future<List<ListModel>?> getList() async {
    try {
      Response response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      return (response.data as List).map((e) => ListModel.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  /// searh by list id
  static Future<ListModel?> getListById(String id) async {
    try {
      Response response = await Dio().get('https://jsonplaceholder.typicode.com/posts/$id');

      return ListModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
