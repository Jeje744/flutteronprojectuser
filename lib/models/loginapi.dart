import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:portofolio/models/logindata.dart';
//import 'package:flutter_session_manager/flutter_session_manager.dart';

class LoginApi {
  var uri = 'http://10.0.2.2:8000/api/login';

  Future getDataLogin(String nik, String pass) async {
    try {
      var response =
          await http.post(Uri.parse(uri), body: {"nik": nik, "pass": pass});

      Map datas = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // List temp = [];

        // for (var el in datas['datas'].values) {
        //   temp.add(el);
        // }
        return datas['datas'];
      } else {
        Map data = {'rollaction_id': '0'};
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
