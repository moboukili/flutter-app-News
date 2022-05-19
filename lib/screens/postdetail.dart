import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

  class PostDetail extends StatefulWidget {
    final String heroId;
    final data;
  const PostDetail({Key? key, @required this.data, required this.heroId,}) : super(key: key);
  @override
  _DetailDoaState createState() => _DetailDoaState(this.data);
  }

  class _DetailDoaState extends State<PostDetail> {
    final data;
  List<String> favId = [];
  _DetailDoaState(this.data);
  @override
  Widget build(BuildContext context) {
    final heroId = widget.heroId;
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Hero(
                        tag: heroId,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60.0)),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.overlay),
                            child: Image.network(
                              data["_embedded"]["wp:featuredmedia"][0]["source_url"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 36, 16, 50),
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      radius: 20,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Html(data: "<h2>" + data['title']['rendered'] + "</h2>", style: {
                        "h2": Style(
                            color: Colors.deepPurple[400],
                            fontWeight: FontWeight.w500,
                            fontSize: FontSize.em(1.6),
                            padding: EdgeInsets.all(4)),
                      }),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(3)),
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        margin: EdgeInsets.all(16),
                        child: Text(
                          data["_embedded"]["wp:term"][0][0]["name"],
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(right: 5),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.share,
                            color: Theme.of(context).iconTheme.color,
                            size: 26.0,
                          ),
                          onPressed: () {
                            Share.share('Share the news: ' + data['link']);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['_embedded']['author'][0]['avatar_urls']['48']),
                          ),
                          title: Text(
                            "By " + data['_embedded']['author'][0]['slug'],
                            style: TextStyle(fontSize: 12),
                          ),
                          subtitle: Text(
                            getCurrentDate(),
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 36, 16, 50),
                          child: Html(
                            style: {
                              "p": Style(fontSize: FontSize.medium, textAlign: TextAlign.justify,),
                              "a": Style(color: Colors.deepPurple[400], fontSize: FontSize.medium, fontWeight: FontWeight.w400, textDecoration: TextDecoration.underline,textAlign: TextAlign.justify,),
                              "h2": Style(fontSize: FontSize.larger, fontWeight: FontWeight.w900,textAlign: TextAlign.justify,),

                            },
                            data: data['content']['rendered'],
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

    String getCurrentDate() {
      var date = DateFormat('dd MMMM, yyyy HH:mm', 'en_US')
          .format(DateTime.parse(data['date']))
          .toString();
      return date.toString();
    }

}