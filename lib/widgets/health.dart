import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress_api_get_post/screens/health/agility.dart';
import 'package:flutter_wordpress_api_get_post/screens/health/fitness.dart';
import 'package:flutter_wordpress_api_get_post/screens/health/health.dart';
import 'package:flutter_wordpress_api_get_post/screens/health/healthFitness.dart';
import 'package:flutter_wordpress_api_get_post/screens/health/mentalHealth.dart';
import 'package:flutter_wordpress_api_get_post/screens/health/publicHealth.dart';

class HealthCard extends StatelessWidget {

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
                                  Agility(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/image_categories/Agility.jpg"),
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
                                      "Agility and diet",
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
                                  Fitness(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/image_categories/Fitness.jpg"),
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
                                      "Fitness and diet",
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
                                  Health(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/image_categories/health.jpg"),
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
                                      "Health",
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
                                  HealthFitness(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/image_categories/health_fitness.jpg"),
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
                                      "Health and Fitness",
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
                                  MentalHealth(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/image_categories/Mental.jpg"),
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
                                      "Mental health",
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
                                  PublicHealth(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/image_categories/Public.jpg"),
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
                                      "Public health",
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