import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  String content =
      "The Magazine looks forward to using this platform and its mechanisms as a tool that contributes to caring for the well-being of the human and the family in accordance with the best international standards.\nWith this goal in mind, Self-Achievement (Accosoi.com) seeks to gain and maintain user confidence by:\n \n•   Publication of Evidence-Based practices, approved by responsible professional institutions and bodies.\n•   Providing licensed content from the most prestigious and international bodies and universities, and providing it to the user for free.\n•   Respecting copyright, intellectual property, and professional and ethical work assets.\n•   Respecting individual privacy as per the privacy policy.\n•   Keeping up with the latest scientific developments and constantly updating the published contents to provide the most accurate and up-to-date information.\n\nThe Self-Achievement (Accosoi.com) magazine and its products are managed by a group of professionals, administrators, editors, programmers, designers, advertisers, marketers, and administrators per the highest professional and ethical standards to ensure the quality of content and services provided are continuously maintained and developed.\n\n The Self-Achievement (Accosoi.com) notes the importance of seeking the advice of qualified specialists and professionals before starting any treatment and when facing any medical or non-medical problem, as the information on the website are all informative and not intended to be a substitute for a doctor’s visit and professional advice and should not be considered as well.\n\nIt is not permissible to copy, distribute, reproduce, display, amend, translate, publish, transmit, sell, distribute or commercially benefit from any of the materials published on the Self-Achievement (Accosoi.com) magazine, in whole or in part, nor It may be presented to any third party without obtaining prior written permission from the magazine.";

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
          "About",
          style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Container(
          child: ReadMoreText(
            content,
            trimLines: 8,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            style: GoogleFonts.robotoSlab(
              fontSize: 17,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
