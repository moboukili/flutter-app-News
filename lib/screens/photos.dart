import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_wordpress_api_get_post/model/article.dart';
import 'package:flutter_wordpress_api_get_post/page/about.dart';
import 'package:flutter_wordpress_api_get_post/page/contact.dart';
import 'package:flutter_wordpress_api_get_post/page/disclaimer.dart';
import 'package:flutter_wordpress_api_get_post/page/policy.dart';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Posts> _list = [];
  List<Posts> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
        await http.get(Uri.parse("https://accosoi.com/wp-json/wp/v2/posts?_embed&per_page=25"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map<String, dynamic> i in data) {
          _list.add(Posts.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.title.contains(text) || f.id.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => About(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Contact(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Policy(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Disclaimer(),
        ));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Searching',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        elevation: 0.5,
      ),
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:Theme.of(context).canvasColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  new InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      child: Icon(Icons.clear,color: Colors.white,),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[400]),
                accountName: new Text ("Welcome to Accosoi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800, fontSize: 18),),
                accountEmail: new Text("contact@accosoi.com",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: AssetImage('assets/image/mini.png'),
                ), // CircleAvatar
              ),
              SizedBox(
                height: 20,
              ),// UserAccountsDrawerHeader
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.announcement,color: Theme.of(context).accentColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('About'),
                    )
                  ],
                ),
                onTap: () => selectedItem(context, 0),
              ),
              Divider(color: Theme.of(context).accentColor,indent: 40,),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.account_circle,color: Theme.of(context).accentColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Contact'),
                    )
                  ],
                ),
                onTap: () => selectedItem(context, 1),
              ),
              Divider(color: Theme.of(context).accentColor,indent: 40,),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.policy,color: Theme.of(context).accentColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Privacy Policy'),
                    )
                  ],
                ),
                onTap: () => selectedItem(context, 2),
              ),
              Divider(color: Theme.of(context).accentColor,indent: 40,),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.airplay,color: Theme.of(context).accentColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Disclaimer'),
                    )
                  ],
                ),
                onTap: () => selectedItem(context, 3),
              ),
              Divider(color: Theme.of(context).accentColor,indent: 40,),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app,color: Theme.of(context).accentColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Exit'),
                    )
                  ],
                ),
                onTap: () => SystemNavigator.pop(),
              ),
              SizedBox(
                height: 90,
              ),
              Divider(color: Theme.of(context).accentColor,indent: 40,),
              ListTile(
                title: Center
                  (child: Text(
                  'App version 1.0.0',
                  style: TextStyle(
                    fontFamily: 'Times',
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 24),
              color: Colors.deepPurple[400],
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final b = _search[i];
                              return GestureDetector(
                                onTap: (){
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 24),
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: Image.network(
                                                  b.featuredmedia,
                                                  height: 200,
                                                  width: MediaQuery.of(context).size.width,
                                                  fit: BoxFit.cover,
                                                )),
                                            SizedBox(height: 12,),
                                            Text(
                                              b.title,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              parse(b.content).documentElement!.text,
                                              maxLines: 4,
                                              style: TextStyle(color: Colors.black54, fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return GestureDetector(
                                onTap: (){
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 24),
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: Image.network(
                                                  a.featuredmedia,
                                                  height: 200,
                                                  width: MediaQuery.of(context).size.width,
                                                  fit: BoxFit.cover,
                                                )),
                                            SizedBox(height: 12,),
                                            Text(
                                              a.title,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              parse(a.content).documentElement!.text,
                                              maxLines: 4,
                                              style: TextStyle(color: Colors.black54, fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
