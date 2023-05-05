import 'package:flutter/material.dart';
import 'package:portofolio/views/bodyhalamanpertama.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class HalamanPertama extends StatefulWidget {
  const HalamanPertama({super.key});

  @override
  State<HalamanPertama> createState() => _HalamanPertamaState();
}

class _HalamanPertamaState extends State<HalamanPertama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Personal Info Employee'),
        centerTitle: true,
        backgroundColor: Colors.lime,
        elevation: 12,
        toolbarHeight: 80,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blueAccent, Colors.lime])),
          child: const BodyHalamanPertama()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await SessionManager().destroy();
          Navigator.of(context).popAndPushNamed('/view/halamandatapersonal');
        },
        backgroundColor: Colors.lime,
        child: const Icon(
          Icons.person_add_alt_1_sharp,
          size: 32,
        ),
      ),
    );
  }
}
