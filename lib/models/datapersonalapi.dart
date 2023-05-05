import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portofolio/models/datapersonal.dart';

class DataPersonalApi {
  var uri = 'http://10.0.2.2:8000/api/karyawans';

  Future getData() async {
    // var uri = 'http://127.0.0.1:8000/api/karyawans';
    var response = await http.get(Uri.parse(uri));

    Map data = jsonDecode(response.body);
    print(data);
    List temp = [];
    for (var e in data['karyawans']) {
      temp.add(e);
    }
    return DataPersonal.datapersonalapi(temp);
  }

  Future postData(String nik, String nama, String email, String alamat) async {
    try {
      final response = await http.post(Uri.parse(uri), body: {
        "nik": nik,
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "created_at": DateTime.now().toString(),
        "updated_at": DateTime.now().toString()
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(
      String id, String nik, String nama, String email, String alamat) async {
    try {
      final response = await http.put(Uri.parse(uri + '/' + id), body: {
        "nik": nik,
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "created_at": DateTime.now().toString(),
        "updated_at": DateTime.now().toString()
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse(uri + '/' + id));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
