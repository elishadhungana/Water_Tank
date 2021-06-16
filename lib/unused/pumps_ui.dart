import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/model/list_devices.dart';
import '../strings.dart';

class PumpsPage extends StatefulWidget {
  @override
  _PumpPageState createState() => _PumpPageState();
}

class _PumpPageState extends State<PumpsPage> {
  DeviceList newDeviceList = new DeviceList();
  LoginApiService _serviceAPI = LoginApiService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.home,
          style: TextStyle(fontSize: 16),
        ),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFEFEFEFF214D72),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                padding: EdgeInsets.all(8.0),
                height: 100,

                //#C6C6C8 #F2F7FA
                decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEFF2F7FA),
                    borderRadius: BorderRadius.circular(20)),

                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          'asset/images/pump.png',
                          height: 48,
                          width: 48,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                Strings.pumps,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: const Color(0xFFEFEFEFF95ACBE)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Text(
                                Strings.lorem,
                                style: TextStyle(
                                    color: const Color(0xFFEFEFEFF214D72),
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Text(
                                Strings.status,
                                style: TextStyle(
                                    color: const Color(0xFFEFEFEFFF54461),
                                    fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {

                        },
                        child: Container(
                          child: Image.asset(
                            'asset/images/add.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
