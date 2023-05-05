import 'package:flutter/material.dart';
import 'package:portofolio/models/datapersonal.dart';
import 'package:portofolio/models/datapersonalapi.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
//import 'package:flutter_session_manager/flutter_session_manager.dart';

class BodyHalamanPertama extends StatefulWidget {
  const BodyHalamanPertama({super.key});

  @override
  State<BodyHalamanPertama> createState() => _BodyHalamanPertamaState();
}

class _BodyHalamanPertamaState extends State<BodyHalamanPertama> {
  late List<DataPersonal> datapersonal;
  DataPersonalApi datapersonalapi = DataPersonalApi();

  bool _loading = true;

  Future<void> getData() async {
    datapersonal = await datapersonalapi.getData();
    setState(() {
      _loading = false;
    });
  }

  // Future<void> booleand() async {
  //   var info = await SessionManager().get('rollaction_id');
  //   var nama = await SessionManager().get('nama');
  //   var alamat = await SessionManager().get('alamat');
  //   var nohp = await SessionManager().get('nohp');
  //   return info;
  // }

  @override
  void initState() {
    super.initState();
    inisiasi();
    getData();
    //booleand();
  }

  Future inisiasi() async {
    await Future.delayed(Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.lightBlue, Colors.lime])),
      child: Stack(children: [
        Center(
          child: Icon(
            Icons.list_alt_sharp,
            color: Colors.grey[200],
            size: 350,
          ),
        ),
        Visibility(
          visible: true,
          child: Center(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(227, 229, 250, 110),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 6.0,
                                    spreadRadius: 2.0),
                              ]),
                          width: 400,
                          margin: const EdgeInsets.only(top: 30),
                          child: Stack(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: const CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 219, 224, 222),
                                    radius: 45,
                                    foregroundColor:
                                        Color.fromARGB(220, 5, 5, 5),
                                    child: Text('Employ'),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).popAndPushNamed(
                                              '/view/halamaneditdata',
                                              arguments: [
                                                datapersonal[index]
                                                    .id
                                                    .toString(),
                                                datapersonal[index].nik,
                                                datapersonal[index].nama,
                                                datapersonal[index].email,
                                                datapersonal[index].alamat
                                              ]);
                                        },
                                        child: Icon(
                                          Icons.edit_sharp,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 13),
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (await confirm(context,
                                              title: Text('Confirm'),
                                              content: Text(
                                                  'Yakin Anda Akan Menghapus?'),
                                              textOK: Text('Ya'),
                                              textCancel: Text('Tidak'))) {
                                            bool response =
                                                await datapersonalapi
                                                    .deleteData(
                                                        datapersonal[index]
                                                            .id
                                                            .toString());
                                            if (response) {
                                              Navigator.of(context)
                                                  .popAndPushNamed(
                                                      '/view/halamanpertama');
                                            } else {
                                              print('Gagal Delete');
                                            }
                                          }
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment(.5, 0),
                              child: Container(
                                width: 230,
                                margin: EdgeInsets.only(top: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'NIK : ${datapersonal[index].nik}',
                                    ),
                                    Text('Nama : ${datapersonal[index].nama}'),
                                    Text(
                                        'Alamat : ${datapersonal[index].alamat}'),
                                    Text(
                                      'Email : ${datapersonal[index].email}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                    itemCount: datapersonal.length,
                  ),
          ),
        ),
        // Visibility(
        //     visible: _show_button,
        //     child: GestureDetector(
        //       onTap: (() async {
        //         // show_button();
        //         setSession();
        //         // showSesi();
        //       }),
        //       child: Center(
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Icon(
        //               Icons.lock_outline,
        //               size: 45,
        //             ),
        //             Container(
        //                 height: 35,
        //                 alignment: Alignment.bottomLeft,
        //                 child: Text(
        //                   'CLICK TO OPEN DATA',
        //                   style: TextStyle(fontSize: 16),
        //                 ))
        //           ],
        //         ),
        //       ),
        //     ))
      ]),
    );
  }
}
