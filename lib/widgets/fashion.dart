import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/fashion/fashion.dart';
import 'package:flutter_wordpress_api_get_post/screens/fashion/forMan.dart';
import 'package:flutter_wordpress_api_get_post/screens/fashion/style.dart';

class FashionCard extends StatelessWidget {

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
                                Fashion(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/fashion_trends.jpg"),
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
                                    "Fashion",
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
                                ForMan(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/choose-mens.jpg"),
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
                                    "For man",
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
                                Style(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/style.jpeg"),
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
                                    "Style",
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