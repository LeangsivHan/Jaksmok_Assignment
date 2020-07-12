import 'dart:ui';

import 'package:assignment_jaksmok_app/assets/colors/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  Map bookInfo;
  DetailScreen({Key key, @required this.bookInfo}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState(bookInfo);
}

class _DetailScreenState extends State<DetailScreen> {
  Map bookInfo;

  _DetailScreenState(this.bookInfo);

  double sizeBoxForDetail = 12.0;

  Row bookDetail(String label, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            "$label:",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            "$info",
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  _launchURL(String wikipediaLink) async {
    if (await canLaunch(wikipediaLink)) {
      await launch(wikipediaLink);
    } else {
      throw 'Could not launch $wikipediaLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))),
        backgroundColor: base_color,
        title: AutoSizeText(
          'Detail',
          maxLines: 1,
          minFontSize: 20.0,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Image.network(
                bookInfo["imageUrl"],
                // fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              alignment: Alignment.center,
              child: Text(
                "${bookInfo["title"]}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  bookDetail("Author", bookInfo["author"]),
                  SizedBox(
                    height: sizeBoxForDetail,
                  ),
                  bookDetail("Real Years", bookInfo["realYears"]),
                  SizedBox(
                    height: sizeBoxForDetail,
                  ),
                  bookDetail("Year", bookInfo["year"]),
                  SizedBox(
                    height: sizeBoxForDetail,
                  ),
                  bookDetail("Country", bookInfo["country"]),
                  SizedBox(
                    height: sizeBoxForDetail,
                  ),
                  bookDetail("Language", bookInfo["language"]),
                  SizedBox(
                    height: sizeBoxForDetail,
                  ),
                  bookDetail("Pages", bookInfo["pages"].toString()),
                  SizedBox(
                    height: sizeBoxForDetail,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      color: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.grey[50])),
                      onPressed: () => _launchURL(bookInfo["wikipediaLink"]),
                      child: Text(
                        "For more information!",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 20.0,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
