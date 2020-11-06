import 'dart:convert';

import 'package:amcom_news/models/post.model.dart';
import 'package:dio/dio.dart';

class FeedRepository {
  Future<List<Post>> getAll() async {
    var url =
        "https://raw.githubusercontent.com/luizaraujoamcom/feedamcom/main/feed.json";
    Response response = await Dio().get(url);
    return (json.decode(response.data) as List)
        .map((post) => Post.fromJson(post))
        .toList();
  }
}
