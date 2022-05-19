import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wordpress_api_get_post/page/about.dart';
import 'package:flutter_wordpress_api_get_post/page/contact.dart';
import 'package:flutter_wordpress_api_get_post/page/disclaimer.dart';
import 'package:flutter_wordpress_api_get_post/page/policy.dart';
import 'package:flutter_wordpress_api_get_post/widgets/art.dart';
import 'package:flutter_wordpress_api_get_post/widgets/beauty.dart';
import 'package:flutter_wordpress_api_get_post/widgets/family.dart';
import 'package:flutter_wordpress_api_get_post/widgets/fashion.dart';
import 'package:flutter_wordpress_api_get_post/widgets/health.dart';


class Catalog extends StatefulWidget {
  Catalog({Key? key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                children: <Widget>[
                     Container(
                      width: width,
                      padding: EdgeInsets.only(top: 10),
                      child: DefaultTabController(
                          length: 5,
                          child: Column(
                            children: <Widget>[
                              TabBar(
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.only(
                                  top:0,
                                  right: -9,
                                  left: 0,
                                  bottom: 10,
                                ),
                                indicator: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.deepPurple[300]!,
                                      width: 2.5,

                                    )
                                  )
                                ),
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: Colors.deepPurple[300],
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                unselectedLabelColor: Colors.grey[400],
                                unselectedLabelStyle: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 17),

                                tabs: <Widget>[
                                  Tab(
                                    child: Text("Health & Fitness"),
                                  ),
                                  Tab(
                                    child: Text("Beauty"),
                                  ),
                                  Tab(
                                    child: Text("Family & Society"),
                                  ),
                                  Tab(
                                    child: Text("Art & celebrities"),
                                  ),
                                  Tab(
                                    child: Text("Fashion"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: height * 0.9,
                                child: TabBarView(
                                  children: <Widget>[
                                    HealthCard(),
                                    BeautyCard(),
                                    FamilyCard(),
                                    ArtCard(),
                                    FashionCard(),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                ],
              ),
            ),
          ),
        );
  }
  showMenu() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                    height: (50 * 6).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none, alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color: Theme.of(context).canvasColor,  width: 10)),
                                child: Center(
                                  child: ClipOval(
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage('assets/image/mini.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.announcement,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    title: Text('About',
                                        style: TextStyle(color: Theme.of(context).iconTheme.color,)
                                    ),
                                    onTap: () => selectedItem(context, 0),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    title: Text('Contact',
                                        style: TextStyle(color: Theme.of(context).iconTheme.color,)
                                    ),
                                    onTap: () => selectedItem(context, 1),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.policy,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    title: Text('Privacy Policy',
                                        style: TextStyle(color: Theme.of(context).iconTheme.color,)
                                    ),
                                    onTap: () => selectedItem(context, 2),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.airplay,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    title: Text('Disclaimer',
                                        style: TextStyle(color: Theme.of(context).iconTheme.color,)
                                    ),
                                    onTap: () => selectedItem(context, 3),
                                  ),
                                  ListTile(
                                    title: Text('Exit',
                                        style: TextStyle(color: Theme.of(context).iconTheme.color,)
                                    ),
                                    leading: Icon(Icons.exit_to_app,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    onTap: () => SystemNavigator.pop(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Center(
                      child: Text(
                        'version: 1.0',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        });
  }
}
