import 'package:assignment_jaksmok_app/api/base_api.dart';
import 'package:assignment_jaksmok_app/assets/colors/colors.dart';
import 'package:assignment_jaksmok_app/views/loading.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bookData;

  void requestData() async {
    BaseApi baseApi = BaseApi(endpoint: 'books');
    await baseApi.get_data();
    setState(() {
      bookData ??= baseApi.data["content"];
    });
    // print("Data = $bookData");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0))),
          backgroundColor: base_color,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print("MENU BAR");
                },
              ),
              Center(
                child: SizedBox(
                  child: AutoSizeText(
                    'Homepage',
                    maxLines: 1,
                    minFontSize: 20.0,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Image(
                image: AssetImage('lib/assets/pngs/Jaksmok_logo.png'),
                height: 40.0,
                width: 40.0,
              )
            ],
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: bookData == null ? 0 : bookData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Loading(
                          id: bookData[index]["id"],
                        )));
                // print(bookData[index]["imageUrl"]);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 60.0,
                          child: Image.network(
                            bookData[index]["imageUrl"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              bookData[index]["title"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(bookData[index]["author"]),
                          ],
                        ),
                      ),
                      // Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
