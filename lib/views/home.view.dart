import 'package:amcom_news/models/post.model.dart';
import 'package:amcom_news/repositories/feed.repository.dart';
import 'package:amcom_news/widgets/post.widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var repository = new FeedRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Text("News")
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: repository.getAll(),
            builder: (ctx, snp) {
              if (snp.hasData) {
                List<Post> posts = snp.data;
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (ctx, i) {
                      return PostWidget(post: posts[i]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    ));
  }
}
