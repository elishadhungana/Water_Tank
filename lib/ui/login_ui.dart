import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:khyatee_app/homepage/home_page_screen.dart';
import 'package:khyatee_app/model/login_model.dart';
import 'package:khyatee_app/ui/home_page.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/common/progress_bar.dart';

import '../strings.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Login newLogin = new Login();
  bool isLoggedIn = false;

  LoginApiService _loginApiService = LoginApiService();


  ProgressBar _sendingMsgProgressBar;


  bool _passwordVisible;
  bool _throwshotaway=false;

  @override
  void initState() {
    super.initState();
    _sendingMsgProgressBar = ProgressBar();
    usernameController.text = "9845678900" ;
    passwordController.text  ="123456";
    _passwordVisible=false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _sendingMsgProgressBar.hide();
    super.dispose();
  }

  void showSendingProgressBar() {
    _sendingMsgProgressBar.show(context);
  }

  void hideSendingProgressBar() {
    _sendingMsgProgressBar.hide();
  }


  void containerCommon(){

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
                  /*prefixIcon: new Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 5, right: 0, bottom: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'asset/images/phone.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                    Text(
                                      '+977 ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),*/

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
      );

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

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
                              /*prefixIcon: new Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 5, right: 0, bottom: 15),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'asset/images/phone.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                    Text(
                                      '+977 ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),*/

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
                            obscureText: _passwordVisible,
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
                                    onTap: (){

                                      setState(() {
                                        _passwordVisible = !_passwordVisible;

                                      });
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
                    margin: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0, right: 4.0),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  value: _throwshotaway,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _throwshotaway= value;

                                    });
                                  },
                                ),
                              ),

                              Text(
                                Strings.remember,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),

                          Container(
                            margin: const EdgeInsets.only(left:4.0),
                            child: Text(
                              Strings.forgot_password,
                              style: TextStyle(

                                  color: const Color(0xFFEFEFEF648CBF),
                                  fontSize: 16),
                            ),
                          ),

                        ],

                        ),
                      ),
                    ),

                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () async {
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
                              builder: (context) => HomePageScreen(),
                              maintainState: false));
                        }
                      } else {
                        _showDialog();
                      }
                    },
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
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Username or Password do not match."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
