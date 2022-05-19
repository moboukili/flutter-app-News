import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Disclaimer extends StatelessWidget {
  String content =
      "All information on this site is for information purposes only and should not be used as a basis for making any personal or business decisions, and it should not be seen by you as an alternative to specific specialist advice.\n\nThe Self Achievement Magazine website (accosi.com) retains ownership of this content which includes, but is not limited to, texts, graphics, and images. Any use of this material without official permission is strictly prohibited.";
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
            "Disclaimer",
            style: GoogleFonts.lora(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Text(
            content,
            style: GoogleFonts.robotoSlab(
              fontSize: 17,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ));
  }
}
