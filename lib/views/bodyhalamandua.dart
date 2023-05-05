import 'package:flutter/material.dart';
import 'package:portofolio/models/datapersonalapi.dart';

class BodyHalamandua extends StatefulWidget {
  @override
  State<BodyHalamandua> createState() => _BodyHalamanduaState();
}

class _BodyHalamanduaState extends State<BodyHalamandua> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _alamat = TextEditingController();

  DataPersonalApi datapersonalapi = DataPersonalApi();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.blueAccent, Colors.lime])),
      child: Stack(children: [
        Center(
          child: Container(
              child: Icon(
            Icons.person_add_alt_1_sharp,
            size: 450,
            color: Colors.grey[350],
          )),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 180),
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
                                  color: Colors.white,
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
                                  color: Colors.white,
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
                                  color: Colors.white,
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
                                  color: Colors.white,
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
                                              Text('Processing Post Data')));
                                }
                                bool response = await datapersonalapi.postData(
                                    _nik.text,
                                    _nama.text,
                                    _email.text,
                                    _alamat.text);
                                if (response) {
                                  print('Post Gagal');
                                } else {
                                  Navigator.of(context)
                                      .popAndPushNamed('/view/halamanpertama');
                                }
                              },
                              child: Text('POST'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lime),
                            ),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
