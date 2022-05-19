import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  @override
  _ContactState createState() => _ContactState();
}

class TextFields extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? type;

  TextFields(
      {required this.controller,
      required this.name,
      required this.validator,
      this.maxLines,
      this.type});
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.0), borderSide: BorderSide.none);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: type,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[300],
          filled: true,
          labelText: name,
          focusedErrorBorder: border,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder: border,
        ),
        // The validator receives the text that the user has entered.
        validator: validator,
      ),
    );
  }
}

class _ContactState extends State<Contact> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }
  _launchURL(String value) async {
    const url = 'https://www.facebook.com/accosoi/';
    const url2 = 'https://www.instagram.com/accosoi_/';
    const url3 = 'https://twitter.com/accosoi_';
    const url4 = 'https://www.accosoi.com/';
    if (value == 'facebook') {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (value == 'instagram') {
      if (await canLaunch(url2)) {
        await launch(url2);
      } else {
        throw 'Could not launch $url2';
      }
    } else if (value == 'twitter') {
      if (await canLaunch(url3)) {
        await launch(url3);
      } else {
        throw 'Could not launch $url3';
      }
    }
    else if (value == 'site') {
      if (await canLaunch(url4)) {
        await launch(url4);
      } else {
        throw 'Could not launch $url4';
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          "Contact",
          style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: (() {
              setState(() {
                _enableBtn = _formKey.currentState!.validate();
              });
            }),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/image/app_logo.png",
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Theme.of(context).accentColor, decoration: TextDecoration.underline),
                              text: "Accosoi.com",
                              recognizer: TapGestureRecognizer()..onTap =  () {
                                _launchURL('site');
                              }
                          ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(

                        icon:  SvgPicture.asset("assets/svg/facebook.svg", fit:BoxFit.fill, color: Colors.deepPurple),
                        onPressed: () {
                          _launchURL('facebook');
                        },),
                      IconButton(
                          icon: SvgPicture.asset("assets/svg/instagram.svg",fit:BoxFit.fill, color: Colors.deepPurple),
                          onPressed: (){
                            _launchURL('instagram');
                          }),
                      IconButton(
                          icon: SvgPicture.asset("assets/svg/twitter.svg",fit:BoxFit.fill, color: Colors.deepPurple),
                          onPressed: (){
                            _launchURL('twitter');
                          }),
                    ]
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Subject",
                      prefixIcon: Icon(Icons.subject),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: subjectController,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Subject is required';
                      }
                      return null;
                    })),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    })),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Message",
                    prefixIcon: Icon(Icons.message),
                  ),
                  controller: messageController,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      setState(() {
                        _enableBtn = true;
                      });
                      return 'Message is required';
                    }
                    return null;
                  }),
                ),
                SizedBox(
                  height: 60,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      height: 60, width: double.infinity),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5);
                          else if (states.contains(MaterialState.disabled))
                            return Colors.grey;
                          return Colors
                              .deepPurpleAccent; // Use the component's default.
                        },
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      "Send",
                      style: GoogleFonts.lora(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    onPressed: _enableBtn
                        ? (() async {
                            String smtpServerName = 'smtp.gmail.com';
                            int smtpPort = 465;
                            String smtpUserName = 'accosoiinfo@gmail.com';
                            String smtpPassword = "Epmventure";
                            final smtpServer = SmtpServer (
                              smtpServerName,
                              port: smtpPort,
                              ssl: true,
                              ignoreBadCertificate: false,
                              allowInsecure: false,
                              username: smtpUserName,
                              password: smtpPassword,
                            );
                            final message = Message()
                              ..from = Address(emailController.text, emailController.text)
                              ..recipients.add(smtpUserName)
                              ..subject = subjectController.text
                              ..html = messageController.text;

                            try {
                              final sendReport =
                                  await send(message, smtpServer);
                              // ignore: deprecated_member_use
                              _scaffoldKey.currentState!.showSnackBar(SnackBar(
                                content: Text(
                                    'Your message has been sent successfully'),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 10),
                                action: SnackBarAction(
                                  label: 'Click',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  textColor: Colors.white,
                                  disabledTextColor: Colors.grey,
                                ),
                              ));
                              print('Message sent: ' + sendReport.toString());
                            } on MailerException catch (e) {
                              print('Message not sent.');
                              for (var p in e.problems) {
                                print('Problem: ${p.code}: ${p.msg}');
                              }
                            }
                            var connection = PersistentConnection(smtpServer);
                            await connection.send(message);
                            await connection.close();
                          })
                        : null,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
