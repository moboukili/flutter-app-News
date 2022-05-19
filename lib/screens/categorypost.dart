import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:flutter_wordpress_api_get_post/page/about.dart';
import 'package:flutter_wordpress_api_get_post/page/contact.dart';
import 'package:flutter_wordpress_api_get_post/page/disclaimer.dart';
import 'package:flutter_wordpress_api_get_post/page/policy.dart';
import 'package:flutter_wordpress_api_get_post/services/mycategory.dart';
import 'package:html/parser.dart';
import 'package:flutter_wordpress_api_get_post/screens/postdetail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class CategoryPost extends StatefulWidget {

  CategoryPost({Key? key}) : super(key: key);

  @override
  _CategoryPostState createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {

  MyCategory postService = MyCategory();
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
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text(
          'Life Style',
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
           margin: EdgeInsets.only(top: 4.0),
           child: FutureBuilder<List>(
             future: postService.getCategoryPost(),
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 if (snapshot.data?.length == 0) {
                   return Center(
                     child: Text("0 Post"),
                   );
                 }
                 return ScrollWrapper(
                   promptTheme: const PromptButtonTheme(
                       icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                       color: Colors.deepPurpleAccent),
                   builder: (context, properties) => SmartRefresher(
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
                     onLoading: postService.deleteCacheContents,
                     onRefresh: postService.deleteCacheContents,
                     child: ListView.builder(
                         controller: properties.scrollController,
                         scrollDirection: properties.scrollDirection,
                         reverse: properties.reverse,
                         primary: properties.primary,
                         itemCount: snapshot.data?.length,
                         itemBuilder: (context, i) {
                           return InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) =>
                                       PostDetail(data: snapshot.data?[i], heroId: '',),
                                 ),
                               );
                             },
                             child: Container(
                               margin: EdgeInsets.only(bottom: 15.0),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black12,
                                       blurRadius: 1.0,
                                     ),
                                   ]),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Container(
                                     height: 200.0,
                                     width: double.infinity,
                                     decoration: BoxDecoration(
                                       //let's add the height
                                       image: DecorationImage(
                                           image: NetworkImage(snapshot.data![i]["_embedded"]
                                           ["wp:featuredmedia"][0]["source_url"]),
                                           fit: BoxFit.cover),
                                     ),
                                   ),
                                   SizedBox(
                                     height: 8.0,
                                   ),
                                   Container(
                                     padding: EdgeInsets.all(6.0),
                                     margin: EdgeInsets.only(left: 10.0,top: 3),
                                     decoration: BoxDecoration(
                                       color: Colors.red,
                                       borderRadius: BorderRadius.circular(20.0),
                                     ),
                                     child: Text(
                                       parse(snapshot.data![i]["_embedded"]["wp:term"][0][0]["name"]
                                           .toString()).documentElement!.text,
                                       style: TextStyle(
                                         color: Colors.white,
                                       ),
                                     ),
                                   ),
                                   SizedBox(
                                     height: 8.0,
                                   ),
                                   Container(
                                       padding: EdgeInsets.all(6.0),
                                       margin: EdgeInsets.only(left: 5.0),
                                       child: Text(
                                         parse(snapshot.data![i]['title']['rendered']
                                             .toString()).documentElement!.text,
                                         style: TextStyle(
                                           color: Colors.black,
                                           fontWeight: FontWeight.w500,
                                           fontSize: 16.0,
                                         ),
                                       )
                                   ),
                                 ],
                               ),
                             ),
                           );
                         }
                     ),
                   ),
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
                       return ListTile(
                         title: SizedBox(
                           width: double.infinity,
                           child: Container(

                             margin: EdgeInsets.only(bottom: 15.0),
                             decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black12,
                                     blurRadius: 1.0,
                                   ),
                                 ]),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   height: 200.0,
                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                   ),
                                 ),
                                 SizedBox(
                                   height: 8.0,
                                 ),
                                 Container(
                                   padding: EdgeInsets.all(6.0),
                                   margin: EdgeInsets.only(left: 10.0,top: 3),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20.0),
                                   ),
                                 ),
                                 Container(
                                   height: 25,
                                   width: 180,
                                   padding: EdgeInsets.all(6.0),
                                   decoration: BoxDecoration(
                                     color: Colors.black26,
                                     borderRadius: BorderRadius.circular(30.0),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 8.0,
                                 ),
                                 Container(
                                   height: 20,
                                   padding: EdgeInsets.all(6.0),
                                   decoration: BoxDecoration(
                                     color: Colors.black26,
                                   ),
                                 ),
                               ],
                             ),
                           ),
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
     );
  }

}
