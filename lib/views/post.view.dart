import 'package:amcom_news/models/post.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostView extends StatelessWidget {
  final Post post;

  PostView({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF6085C3),
        ),
        title: Text(
          "AMcom News",
          style: TextStyle(color: Color(0xFF6085C3)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 188,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(this.post.thumbnail),
                    fit: BoxFit.cover),
                color: Color(0xFF6085C3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: Offset(0, 15),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.post.title,
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Html(data: this.post.content)
          ],
        ),
      ),
    );
  }
}
