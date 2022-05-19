import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/family/boysGirls.dart';
import 'package:flutter_wordpress_api_get_post/screens/family/culture.dart';
import 'package:flutter_wordpress_api_get_post/screens/family/familySociety.dart';
import 'package:flutter_wordpress_api_get_post/screens/family/lifeStyle.dart';
import 'package:flutter_wordpress_api_get_post/screens/family/maritalRelationships.dart';
import 'package:flutter_wordpress_api_get_post/screens/family/youWork.dart';

class FamilyCard extends StatelessWidget {

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
                                FamilySociety(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Family.jpg"),
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
                                    "Family and Society",
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
                                BoysGirls(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Boys.jpg"),
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
                                    "Boys and Girls",
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
                                Culture(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/Culture_Science.jpg"),
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
                                    "Culture and Science",
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
                                LifeStyle(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/lifestyle.jpg"),
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
                                    "Life Style",
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
                                MaritalRelationships(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/relationships.jpg"),
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
                                    "Marital relationships",
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
                                YouWork(),
                          ),
                        );
                      },
                      child: Container(
                        height: 114,
                        width: 149,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/image_categories/work.jpg"),
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
                                    "You and work",
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