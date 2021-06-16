import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/model/list_devices.dart';

import '../strings.dart';

class PumpList extends StatefulWidget {
  @override
  _PumpPageState createState() => _PumpPageState();
}

class _PumpPageState extends State<PumpList> {
  DeviceList newDeviceList = new DeviceList();

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
      body: ExpansionTile(
        title: Text(
          'elisa',
        ),
        leading: Icon(Icons.access_time_outlined),
        children: [
          Column(
            children: [
              Text("elisha dhungana"),
            ],
          )
        ],
        backgroundColor: Colors.red,
        initiallyExpanded: false,
      ),


   /*   Container(
        margin: EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0, top: 16.0),
        padding: EdgeInsets.all(8.0),
        height: 108,

        decoration: BoxDecoration(
            color: const Color(0xFFEFEFEFF2F7FA),
            borderRadius: BorderRadius.circular(20)),


        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                child: Image.asset(
                  'asset/images/pump.png',
                  height: 52,
                  width: 52,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                       "ID:123456",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: const Color(0xFFEFEFEFF195ACBE)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text(
                       "KIRLPSKAR CHOTU SHIP",
                        style: TextStyle(
                            color: const Color(0xFFEFEFEFF214D72),
                            fontSize: 12),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Text(
                        "STATUS",
                        style: TextStyle(
                            color: const Color(0xFFEFEFEFFF54461),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(

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
      ),*/
    );
  }
}
