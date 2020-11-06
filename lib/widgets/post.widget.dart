import 'package:amcom_news/models/post.model.dart';
import 'package:amcom_news/views/post.view.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({@required this.post});

  String _convertDate(String date) {
    return formatDate(
        DateTime.parse(this.post.pubDate), [dd, '/', mm, '/', yyyy]);
  }

  _launchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw "Não foi possível abrir";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 188,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
        width: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(this.post.thumbnail), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25),
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
              Text(
                "Publicado em " + _convertDate(this.post.pubDate),
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PostView(post: post)));
      },
    );
  }
}
