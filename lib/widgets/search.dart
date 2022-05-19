import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress_api_get_post/widgets/posts_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

class SearchPost extends StatefulWidget {
  const SearchPost(item, String heroId, {Key? key}) : super(key: key);

  @override
  _SearchPostState createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  PostController n = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop('Done');
          },
        ),
        centerTitle: true,
        title: Text(
          "Search Posts",
          style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Obx(()=>n.isLoading.value ? Container(
      child: Center(child: CircularProgressIndicator(),),
    ): Container(
      child: ListView.builder(itemBuilder: (context, index){
          return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Image.network(n.postsList[index].featuredImage.mediam),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: Text(
                                parse(n.postsList[index].title
                                    .toString()).documentElement!.text,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child:Expanded(
                          child: Text(
                            parse(n.postsList[index].content
                              .toString()
                              .replaceAll("<p>", "")
                              .replaceAll("</p>", "")).documentElement!.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostsDetail(data: n.postsList[index]),
                          ),
                        );
                      },
                    ),
                  );
      }),
    )
    ),
    );
  }

}
class PostsDetail extends StatelessWidget {
  final data;
  const PostsDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(data.featuredImage.large,
                fit: BoxFit.cover,
              ),
            ),backgroundColor: Colors.transparent, elevation: 0.0, expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: newsDetailSection(),
            hasScrollBody: false,
          ),
        ],
      ),
    );
  }
  Widget newsDetailSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.date_range, size: 16),
                ),
                TextSpan(
                  text: "  ",
                ),
                TextSpan(
                  text: getCurrentDate(), style: TextStyle(fontSize: 16,color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            parse(data.title
                .toString()).documentElement!.text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.deepPurple[400],),
          ),
          SizedBox(child: Divider(color: Colors.deepPurple[400], thickness: 2,), width: 100,),
          SizedBox(height: 15),
          Expanded(
            child: Html(
              style: {
                "p": Style(fontSize: FontSize.medium),
                "a": Style(color: Colors.deepPurple[400], fontSize: FontSize.medium, fontWeight: FontWeight.w400, textDecoration: TextDecoration.underline),
                "h2": Style(fontSize: FontSize.larger, fontWeight: FontWeight.w900,),

              },
              data: data.content,
            ),
          ),
        ],
      ),
    );
  }
  String getCurrentDate() {
    var date1 = data.date.toString();
    var dateParse = DateTime.parse(date1);
    var formattedDate = "  ${dateParse.day}-${dateParse.month}-${dateParse.year}  ${dateParse.hour}-${dateParse.minute}";
    return formattedDate.toString();
  }
}