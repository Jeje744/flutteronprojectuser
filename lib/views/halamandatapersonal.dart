import 'package:flutter/material.dart';
import 'package:portofolio/views/bodyhalamandua.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class HalamandataPersonal extends StatefulWidget {
  const HalamandataPersonal({super.key});

  @override
  State<HalamandataPersonal> createState() => _HalamandataPersonalState();
}

class _HalamandataPersonalState extends State<HalamandataPersonal> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await confirm(context,
            title: Text('Confrim'),
            content: Text('Apakah Anda Ingin Keluar?'),
            textOK: Text('Ya'),
            textCancel: Text('Tidak'))) {
          await SessionManager().destroy();
          return await true;
        } else {
          return await false;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/view/halamanpertama');
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.navigate_before_rounded,
                    size: 40,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 16, top: 3),
                    child: Icon(
                      Icons.person_add_alt_1_sharp,
                      size: 30,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 7),
                      child: Text('Add New Employee')),
                ],
              ),
            ]),
            centerTitle: true,
            backgroundColor: Colors.lime,
            elevation: 12,
            toolbarHeight: 80,
          ),
          body: BodyHalamandua()),
    );
  }
}
