import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/beauty/beauty.dart';
import 'package:flutter_wordpress_api_get_post/screens/beauty/hairStyle.dart';
import 'package:flutter_wordpress_api_get_post/screens/beauty/makeup.dart';
import 'package:flutter_wordpress_api_get_post/screens/beauty/skincare.dart';

class BeautyCard extends StatelessWidget {

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
                                Beauty(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/beauty.jpg"),
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
                                    "Beauty",
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
                                HairStyle(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Hair.jpg"),
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
                                    "Hair and Hairstyles",
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
                                SkinCare(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Skin.jpg"),
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
                                    "Skin care",
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
                                Makeup(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/makeup.jpg"),
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
                                    "Your makeup",
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