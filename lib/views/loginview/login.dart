import 'package:flutter/material.dart';
import 'package:portofolio/models/loginapi.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKeys = GlobalKey<FormState>();
    final TextEditingController _nik = TextEditingController();
    final TextEditingController _pass = TextEditingController();

    LoginApi dataloginapi = LoginApi();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () async {
            await SessionManager().destroy();
            Navigator.of(context).popAndPushNamed('/view/allmenu');
          },
          child: Icon(
            Icons.arrow_back,
            size: 27,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.blueAccent, Colors.lime])),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 190, bottom: 28),
                child: SizedBox(
                  child: Center(
                    child: Text(
                      'EMPLOYEE POWER',
                      style: TextStyle(fontSize: 38, color: Colors.lime[100]),
                    ),
                  ),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: 200,
                  child: Form(
                      key: _formKeys,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: SizedBox(
                                width: 280,
                                child: TextFormField(
                                  controller: _nik,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Input Some Text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'NIK',
                                      hintStyle: TextStyle(
                                          color: Color.fromRGBO(
                                              255, 255, 255, .5))),
                                )),
                          ),
                          Center(
                            child: Container(
                              width: 280,
                              child: TextFormField(
                                controller: _pass,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Input Some Text';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, .5))),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 40,
                              width: 280,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              alignment: Alignment.center,
                            ),
                            onTap: () async {
                              if (_formKeys.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Processing login')));
                              }
                              var response = await dataloginapi.getDataLogin(
                                  _nik.text, _pass.text);

                              if (response['rollaction_id'] == 1) {
                                await SessionManager()
                                    .set('niks', '${_nik.text}');
                                await SessionManager()
                                    .set('nama', '${response['name']}');
                                await SessionManager()
                                    .set('alamat', '${response['alamat']}');
                                await SessionManager()
                                    .set('nohp', '${response['nohp']}');

                                Navigator.of(context).popAndPushNamed(
                                    '/view/loginview/terimadata');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login Failed!')));
                              }
                            },
                          )
                        ],
                      )),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
