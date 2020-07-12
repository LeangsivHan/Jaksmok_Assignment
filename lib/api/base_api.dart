import 'package:assignment_jaksmok_app/constants/constants.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

class BaseApi {
  String endpoint;
  Map data;

  BaseApi({this.endpoint});

  // Error Handling
  Future<void> get_data() async {
    //make the request
    String username = 'sampleId';
    String password = 'Secret';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    // print(basicAuth);

    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': basicAuth
    };

    try {
      Response response =
          await get(BASE_URL + endpoint, headers: {'authorization': basicAuth});
      print(response.statusCode);
      print(response.body);

      data = json.decode(response.body);
    } catch (e) {
      print("Exception Caught: $e");
      data = null;
    }
  }
}

// Future<Map<dynamic, dynamic>> base_api(String endpoint) async {
//   String username = 'sampleId';
//   String password = 'Secret';
//   String basicAuth =
//       'Basic ' + base64Encode(utf8.encode('$username:$password'));
//   // print(basicAuth);

//   Map<String, String> headers = {
//     'content-type': 'application/json',
//     'accept': 'application/json',
//     'authorization': basicAuth
//   };

//   try {
//     Response response =
//         await get(BASE_URL + endpoint, headers: {'authorization': basicAuth});
//     print(response.statusCode);
//     print(response.body);

//     return json.decode(response.body);
//   } catch (e) {
//     print("Exception Caught: $e");
//     return null;
//   }
// }
