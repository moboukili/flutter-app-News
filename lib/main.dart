import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wordpress_api_get_post/widgets/maintab.dart';
import 'package:flutter_wordpress_api_get_post/widgets/onboard_data.dart';
import 'package:flutter_wordpress_api_get_post/widgets/size_configs.dart';
import 'package:flutter_wordpress_api_get_post/widgets/theme_provider.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String SETTINGS_BOX = "settings";
bool? seenOnboard;
    void main() async {
      await Hive.initFlutter();
      await Hive.openBox(SETTINGS_BOX);
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SharedPreferences pref = await SharedPreferences.getInstance();
    seenOnboard = pref.getBool('seenOnboard') ?? false;
    runApp (MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: seenOnboard == true ? HomePage() : SplashScreen()

    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer doIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
        width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xffFC9D45) : Color(0xff573353),
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }
@override
void initState() {
 // TODO: implement initState
  super.initState();
  setSeenonboard();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex:9,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingContents.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      Text(
                          onboardingContents[index].title,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: SizeConfig.blockSizeH! * 7,
                          color: Color(0xff573353),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      Container(
                        height: sizeV * 50,
                        child: Image.asset(onboardingContents[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                        style: TextStyle(
                          color: Color(0xff573353),
                          fontSize: SizeConfig.blockSizeH! * 4.5,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: onboardingContents[index].text),

                        ],
                      ),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 1,
                child: Column(
                  children: [
                    currentPage == onboardingContents.length - 1
                    ? MyTextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                HomePage())
                        );
                      },
                      buttonName: 'Get Started',
                      bgColor: Color(0xffFC9D45),)
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OnBoardNavBtn(
                          name: 'Skip',
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                            HomePage())
                            );
                          },
                        ),
                        Row(
                          children: List.generate(
                              onboardingContents.length,
                              (index) => doIndicator(index),
                          ),
                        ),
                        OnBoardNavBtn(
                          name: 'Next',
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(
                                  milliseconds: 400
                                ),
                                curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ],
        )
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor})
      : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,
      ),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: TextStyle(
              color: Color(0xff573353),
              fontSize: SizeConfig.blockSizeH! * 4.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
        ),
      ),
    );
  }
}


class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style:  TextStyle(
            color: Color(0xff573353),
            fontSize: SizeConfig.blockSizeH! * 4.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
void initState(){
  super.initState();
  initPlatformState();
}
static final String oneSignalAppId = "881b956a-181e-4b72-b92e-6c0e63540538";
@override
Widget build(BuildContext context) {
  return GetMaterialApp(
    title: 'Accosoi',
    themeMode: ThemeMode.system,
    theme: MyThemes.lightTheme,
    darkTheme: MyThemes.darkTheme,
    home: MainTab(),
    debugShowCheckedModeBanner: false,
  );
}


Future<void> initPlatformState() async {
  if (!mounted) return;

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
    this.setState(() {
    });
  });

  OneSignal.shared
      .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
  });

  OneSignal.shared.setEmailSubscriptionObserver(
          (OSEmailSubscriptionStateChanges changes) {
        print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
      });

  await OneSignal.shared.setAppId(oneSignalAppId);
 }
}
