import 'package:flutter/material.dart';
import 'package:portofolio/models/datapersonalapi.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
//import 'package:flutter_session_manager/flutter_session_manager.dart';

class HalamanEditData extends StatefulWidget {
  const HalamanEditData({super.key});

  @override
  State<HalamanEditData> createState() => _HalamanEditDataState();
}

class _HalamanEditDataState extends State<HalamanEditData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _alamat = TextEditingController();

  DataPersonalApi datapersonalapi = DataPersonalApi();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    if (args[1].toString().isNotEmpty) {
      _nik.text = args[1].toString();
    }
    if (args[2].isNotEmpty) {
      _nama.text = args[2];
    }
    if (args[3].isNotEmpty) {
      _email.text = args[3];
    }
    if (args[4].isNotEmpty) {
      _alamat.text = args[4];
    }
    return WillPopScope(
      onWillPop: () async {
        if (await confirm(context,
            title: Text('Confirm'),
            content: Text('Apakah Anda Akan Keluar?'),
            textOK: Text('Ya'),
            textCancel: Text('Tidak'))) {
          //await SessionManager().destroy();
          return await true;
        } else {
          return await false;
        }
      },
      child: Scaffold(
        body: Stack(children: [
          Container(
            alignment: Alignment(.9, .2),
            child: Icon(
              Icons.manage_accounts_outlined,
              size: 450,
              color: Colors.grey[200],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 70),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.lime,
                        child: Icon(
                          Icons.manage_accounts_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                              width: 280,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Some Text';
                                  }
                                  return null;
                                },
                                controller: _nik,
                                decoration: InputDecoration(
                                  hintText: 'NIK',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )),
                        ),
                        Center(
                          child: SizedBox(
                              width: 280,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Some Text';
                                  }
                                  return null;
                                },
                                controller: _nama,
                                decoration: InputDecoration(
                                  hintText: 'Nama',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )),
                        ),
                        Center(
                          child: SizedBox(
                              width: 280,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Some Text';
                                  }
                                  return null;
                                },
                                controller: _email,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )),
                        ),
                        Center(
                          child: SizedBox(
                              width: 280,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Some Text';
                                  }
                                  return null;
                                },
                                controller: _alamat,
                                decoration: InputDecoration(
                                  hintText: 'Alamat',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 280,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Processing Update Data')));
                                }
                                bool response = await datapersonalapi.putData(
                                    args[0].toString(),
                                    _nik.text,
                                    _nama.text,
                                    _email.text,
                                    _alamat.text);
                                if (response) {
                                  Navigator.of(context)
                                      .popAndPushNamed('/view/halamanpertama');
                                } else {
                                  print('Update Gagal');
                                }
                              },
                              child: Text(
                                'EDIT',
                                style: TextStyle(fontSize: 15),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lime),
                            ),
                          ),
                        )
                      ],
                    )),
                Align(
                    heightFactor: 3.5,
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed('/view/halamanpertama');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.portrait_sharp,
                            size: 35,
                            color: Colors.lime,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(color: Colors.lime, fontSize: 18),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
