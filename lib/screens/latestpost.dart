import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wordpress_api_get_post/page/about.dart';
import 'package:flutter_wordpress_api_get_post/page/contact.dart';
import 'package:flutter_wordpress_api_get_post/page/disclaimer.dart';
import 'package:flutter_wordpress_api_get_post/page/policy.dart';
import 'package:html/parser.dart';
import 'package:flutter_wordpress_api_get_post/screens/postdetail.dart';
import 'package:flutter_wordpress_api_get_post/services/post.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class LatestPost extends StatefulWidget {

  LatestPost({Key? key}) : super(key: key);

  @override
  _LatestPostState createState() => _LatestPostState();
}

class _LatestPostState extends State<LatestPost> {

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
  void initState() {
    super.initState();
    postService.getAllPost();
  }
  ScrollController listScrollController = ScrollController();
  Post postService = Post();
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Self Achievement',
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
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("pull up load");
            }
            else if(mode==LoadStatus.loading){
              body =  Container();
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("release to load more");
            }
            else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onLoading: postService.deleteCachePupPost,
        onRefresh: postService.deleteCacheContents,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              padding: EdgeInsets.only(left: 10),
              child: FutureBuilder<List>(
                future: postService.getPupPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length == 0) {
                      return Center(
                        child: Text("0 Post"),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PostDetail(data: snapshot.data?[i], heroId: '',)
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(snapshot.data![i]["_embedded"]
                                            ["wp:featuredmedia"][0]["source_url"]),
                                          )),
                                    ),
                                    Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                          color: Colors.black54,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                                  .toString()).documentElement!.text.length > 12
                                                  ? parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                                  .toString()).documentElement!.text.substring(0, 10) + '...'
                                                  : parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                                  .toString()).documentElement!.text,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              parse(snapshot.data![i]['title']['rendered']
                                                  .toString()).documentElement!.text.length > 18
                                                  ? parse(snapshot.data![i]['title']['rendered']
                                                  .toString()).documentElement!.text.substring(0, 15) + '...'
                                                  : parse(snapshot.data![i]['title']['rendered']
                                                  .toString()).documentElement!.text,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Shimmer.fromColors(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(8.0),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.black12,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                        },
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'For You',
                style: TextStyle(
                    fontFamily: 'Times',
                  color: Theme.of(context).accentColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10),
              child: FutureBuilder<List>(
                future: postService.getAllPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length == 0) {
                      return Center(
                        child: Text("0 Post"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PostDetail(data: snapshot.data?[i], heroId: '',)
                              ));
                            },
                            child: Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width - 40,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      offset: Offset(1, 1),
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(snapshot.data![i]["_embedded"]
                                        ["wp:featuredmedia"][0]["source_url"]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                                    .toString()).documentElement!.text.length > 17
                                                    ? parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                                    .toString()).documentElement!.text.substring(0, 15) + '...'
                                                    : parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                                    .toString()).documentElement!.text,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('HH:mm', 'en_US')
                                                    .format(DateTime.parse(snapshot.data![i]['date'])).toString(),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            parse(snapshot.data![i]['title']['rendered']
                                                .toString()).documentElement!.text.length > 20
                                                ? parse(snapshot.data![i]['title']['rendered']
                                                .toString()).documentElement!.text.substring(0, 17) + '...'
                                                : parse(snapshot.data![i]['title']['rendered']
                                                .toString()).documentElement!.text,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            parse(snapshot.data![i]['_embedded']['author'][0]['slug']
                                                .toString()).documentElement!.text,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Shimmer.fromColors(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return  Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width - 40,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      offset: Offset(1, 1),
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                      color: Colors.black12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 12,
                                                width: 70,
                                                padding: EdgeInsets.all(6.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              Container(
                                                height: 10,
                                                width: 35,
                                                padding: EdgeInsets.all(6.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 15,
                                            width: 150,
                                            padding: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              color: Colors.black26,
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                            width: 40,
                                            padding: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              color: Colors.black26,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                        },
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}