import 'package:flutter/material.dart';
import 'package:khyatee_app/login/remember_me_screen.dart';

import '../strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                    child: Text(
                  Strings.logoText,
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color(0xFFEFEFEFCCCCCC),
                  ),
                )
                    //Image.asset('asset/images/logo.png'),
                    ),
                SizedBox(
                  height: 60.0,
                ),
                Center(
                  child: Text(
                    Strings.login,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: const Color(0xFFEFEFEF1C1A1A),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.0,
                      // phone
                      child: Center(
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: Strings.phone_number,
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: const Color(0xFFEFEFEFCCCCCC),
                            ),
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 5, right: 0, bottom: 15),
                              child: new SizedBox(
                                height: 4,
                                child: Image.asset(
                                  'asset/images/phone.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: TextField(
                          controller: passwordController,
                          // obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: Strings.password,
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: const Color(0xFFEFEFEFCCCCCC),
                            ),
                            prefixIcon: new Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 5, right: 0, bottom: 15),
                              child: new SizedBox(
                                height: 4,
                                child: Image.asset(
                                  'asset/images/password.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                            suffixIcon: new Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 5, right: 0, bottom: 15),
                              child: new SizedBox(
                                height: 4,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Image.asset(
                                    'asset/images/view.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
                 child: RememberMe(),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  /*  onTap: () async {
                    newLogin = await _loginApiService.login(
                        username: usernameController.text,
                        password: passwordController.text);

                    if (newLogin != null) {
                      if (newLogin.result) {
                        //    print(newLogin.result.toString());

                        showSendingProgressBar();
                        Future.delayed(const Duration(milliseconds: 3000), () {
                          setState(() {
                            hideSendingProgressBar();
                          });
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage(),
                            maintainState: false));
                      }
                    } else {
                      print("mckxxxkxkxkxkxkxkkx");
                      _showDialog();
                    }
                  },*/
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        Strings.login_button,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEF214D72),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
