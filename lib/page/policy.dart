import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Policy extends StatelessWidget {
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
          "Privacy Policy",
          style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'If you require any more information or have any questions about our privacy policy, please feel free to contact us by email at contact@accosoi.com\n\nAt Self-Achievement (Accosoi.com), the privacy of our visitors is of extreme importance to us. This privacy policy document outlines the types of personal information is received and collected by www.accosoi.com and how it is used.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.robotoSlab(
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Log Files',
                    style: GoogleFonts.andada(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Like many other Web sites, www.accosoi.com makes use of log files. The information inside the log files includes internet protocol ( IP ) addresses, type of browser, Internet Service Provider ( ISP ), date/time stamp, referring/exit pages, and a number of clicks to analyze trends, administer the site, track user’s movement around the site, and gather demographic information. IP addresses and other such information are not linked to any information that is personally identifiable.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.robotoSlab(
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
