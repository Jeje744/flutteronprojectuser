import 'package:flutter/material.dart';

class AllMenu extends StatelessWidget {
  const AllMenu({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime reseved = DateTime.now();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.lightBlue, Colors.lime])),
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "EMPLOYEE POWER",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 44, color: Colors.lime[100]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Text(
                        'Please Login',
                        style: TextStyle(
                            color: Colors.lime[100],
                            fontSize: 18,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                child: Icon(
                                  Icons.login_sharp,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .popAndPushNamed('/view/loginview/login');
                              },
                            ),
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                print('Okay');
                              },
                            ),
                            Text(
                              "LEAVE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Employee Power @${reseved.year}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
