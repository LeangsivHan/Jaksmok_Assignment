import 'package:assignment_jaksmok_app/api/base_api.dart';
import 'package:assignment_jaksmok_app/assets/colors/colors.dart';
import 'package:assignment_jaksmok_app/views/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  int id;
  Loading({Key key, @required this.id}) : super(key: key);
  @override
  _LoadingState createState() => _LoadingState(id);
}

class _LoadingState extends State<Loading> {
  int id;
  Map bookInfo;

  _LoadingState(this.id);

  void requestData() async {
    BaseApi baseApi = BaseApi(endpoint: 'books/$id');
    await baseApi.get_data();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailScreen(
              bookInfo: baseApi.data,
            )));
  }

  @override
  void initState() {
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: base_color,
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
