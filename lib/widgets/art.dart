import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/art/artCelebrity.dart';
import 'package:flutter_wordpress_api_get_post/screens/art/celebrityNews.dart';
import 'package:flutter_wordpress_api_get_post/screens/art/worldCelibrities.dart';

class ArtCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArtCelebrity(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Art_celebrities.jpg"),
                              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.overlay),
                              fit: BoxFit.cover,
                              alignment: Alignment.center),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black.withOpacity(.1),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: FittedBox(
                                  child: Text(
                                    "Art and celebrities",
                                    style: TextStyle(
                                      fontFamily: "Avenir",
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CelebrityNews(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Celebrity_News.jpg"),
                              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.overlay),
                              fit: BoxFit.cover,
                              alignment: Alignment.center),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black.withOpacity(.1),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: FittedBox(
                                  child: Text(
                                    "Celebrity News",
                                    style: TextStyle(
                                      fontFamily: "Avenir",
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WorldCelebrities(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/World_Celebrities.jpg"),
                              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.overlay),
                              fit: BoxFit.cover,
                              alignment: Alignment.center),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black.withOpacity(.1),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: FittedBox(
                                  child: Text(
                                    "World Celebrities",
                                    style: TextStyle(
                                      fontFamily: "Avenir",
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]

    );
  }
}