import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:flutter_wordpress_api_get_post/services/health/fitness.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:flutter_wordpress_api_get_post/screens/postdetail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';


class Fitness extends StatefulWidget {

  Fitness({Key? key}) : super(key: key);

  @override
  _FitnessState createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  FitnessApi postService = FitnessApi();
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop('Done');
          },
        ),
        centerTitle: true,
        title: Text(
          "Fitness and diet",
          style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 4.0),
        child: FutureBuilder<List>(
          future: postService.getAllPage(),
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
