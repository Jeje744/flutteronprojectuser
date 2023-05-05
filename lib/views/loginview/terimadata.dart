import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:portofolio/models/loginapi.dart';

class TerimaData extends StatefulWidget {
  const TerimaData({super.key});

  @override
  State<TerimaData> createState() => _TerimaDataState();
}

class _TerimaDataState extends State<TerimaData> {
  LoginApi dataloginapi = LoginApi();

  var sesi;
  var _nama;
  var _alamat;
  var _nohp;
  @override
  void initState() {
    super.initState();
    getsesi();
    getnama();
    getalamat();
    getnohp();
  }

  void getsesi() async {
    var sesie = await SessionManager().get('niks');
    setState(() {
      sesi = sesie;
    });
  }

  void getnama() async {
    var nama = await SessionManager().get('nama');
    setState(() {
      _nama = nama;
    });
  }

  void getalamat() async {
    var alamat = await SessionManager().get('alamat');
    setState(() {
      _alamat = alamat;
    });
  }

  void getnohp() async {
    var nohp = await SessionManager().get('nohp');
    setState(() {
      _nohp = nohp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blue,
                Colors.lime,
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 22),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 37,
                              margin: EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Text('${_nama} '),
                                  Text('${sesi} '),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.person_sharp,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        alignment: Alignment(-.7, 0),
                        width: MediaQuery.of(context).size.width,
                        //double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Colors.blueAccent,
                                  Colors.lime,
                                ]),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: Offset(0.0, 11),
                                  blurRadius: 10.0,
                                  spreadRadius: -6.0)
                            ]),
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Alamat : ${_alamat}'),
                              Text('No HP : ${_nohp}'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 74, horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .popAndPushNamed('/view/cuti/calendar');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    size: 50,
                                  ),
                                  Text('Cuti')
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.medical_services_outlined,
                                  size: 50,
                                ),
                                Text('Sakit')
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  size: 47,
                                ),
                                Text('Gaji')
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await SessionManager().destroy();
                    Navigator.of(context)
                        .popAndPushNamed('/view/loginview/login');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(25)),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    width: 290,
                    height: 35,
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                )
              ],
            )));
  }
}
