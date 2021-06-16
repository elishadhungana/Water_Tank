
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expanded_tile/tileController.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/model/list_devices.dart';

import '../strings.dart';

////////////////////////////////////////////////////////////////////////////

class NewHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<NewHomePage> {
  ExpandedTileController expandedTileController = new ExpandedTileController();
  DeviceList newDeviceList = new DeviceList();
  LoginApiService _serviceAPI = LoginApiService();
  List<DeviceList> _deviceList = [];
  bool _isVisible = false;
  bool status1 = false;
  bool status2 = true;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;
  bool isSwitchOn = false;

  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;

  //expansion
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  void initState() {
    super.initState();
    // _populateNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var textMobileNum;
    return Theme(
        data: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: _textColor),
            bodyText2: TextStyle(color: _textColor),
          ),
        ),
        child: Scaffold(
          backgroundColor: _scaffoldBgcolor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              Strings.home,
              style: TextStyle(fontSize: 16),
            ),
            brightness: Brightness.light,
            backgroundColor: const Color(0xFFEFEFEFF214D72),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ExpansionTileCard(
                    initialPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                    contentPadding: EdgeInsets.all(16.0),
                    finalPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                    expandedColor: const Color(0xFFEFEFEFF2F7FA),
                    baseColor: const Color(0xFFEFEFEFF2F7FA),
                    elevation: 0.0,

                    /*  backgroundColor: const Color(0xFFEFEFEFF2F7FA),
                tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),*/
                    leading: Image.asset(
                      'asset/images/newpump.png',
                      height: 54,
                      width: 54,
                    ),
                    trailing: InkWell(
                            onTap: () async {
                    print("apiiiiiiiiiiiiiiiiiiii");

                    var data =
                    await _serviceAPI.deviceList();
                    setState(() {
                      _deviceList=data;
                    }
                    );
                  },
                      child: Image.asset(
                        'asset/images/add.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    title: Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 4.0, bottom: 8.0, top: 4.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    Strings.pumps,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color(0xFFEFEFEFF1C1A1A)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    Strings.lorem,
                                    style: TextStyle(
                                        color: const Color(0xFFEFEFEFF303C48),
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /*Padding(
                          padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [

                            Container(
                              height: 150,
                              color: Colors.red,

                            ),
                            Container(

                              height: 150,
                              color: Colors.red,

                            )
                          ],

                        ),

                      )*/
                        ],
                      ),
                    ),
                    /*   title: Container(
                  height: 150,
                  color: Colors.pink,
                ),*/
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 24.0, right: 24.0, top: 4.0, bottom: 8.0),
                        padding: EdgeInsets.all(12.0),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFEFEFFFFFFFFF)),
                        //#FFFFFF
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset(
                                'asset/images/pump.png',
                                height: 36,
                                width: 36,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                child: Container(
                                  //  color: Colors.yellow,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
/*                              ListView.builder(shrinkWrap: true,itemBuilder: (context, index) {
                                    return textMobileNum= Text(_deviceList[index].mobileNumber);
                                  },
                                    itemCount: _deviceList.length,
                                  ),*/

                                      Container(
                                        child: Text(
                                          "9845678900",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: const Color(
                                                  0xFFEFEFEFF195ACBE)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 2.0),
                                        child: Text(
                                          "KIRLPSKAR CHOTU SHIP",
                                          style: TextStyle(
                                              color: const Color(
                                                  0xFFEFEFEFF214D72),
                                              fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 2.0),
                                        child: Text(
                                          "STATUS OFF",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Image.asset(
                                'asset/images/add.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _isVisible,
                        child: Column(
                          children: [
                            Container(
                              width: 280,
                              margin: EdgeInsets.only(
                                  left: 24.0,
                                  right: 24.0,
                                  top: 4.0,
                                  bottom: 8.0),

                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(02),
                                  color: const Color(0xFFEFEFEFFFFFFFFF)),

                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 4.0),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'asset/images/pump.png',
                                              height: 36,
                                              width: 36,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 12.0),
                                          child: Text(
                                            'ID',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF195ACBE)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 2.0),
                                          child: Text(
                                            '9865056610',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF1C1A1A)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 12.0),
                                          child: Text(
                                            'NAME',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF195ACBE)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 2.0),
                                          child: Text(
                                            'Elisha Dhungana',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF1C1A1A)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 12.0),
                                          child: Text(
                                            'MOBILE',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF195ACBE)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 2.0),
                                          child: Text(
                                            '9845290753',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF1C1A1A)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 44,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 12.0),
                                          child: Text(
                                            'STATUS \n OFF',
                                            style: TextStyle(
                                                color: const Color(
                                                    0xFFEFEFEFFF54461)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 4.0),
                                          child: Text(
                                            'LOCATION',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(
                                                    0xFFEFEFEFF195ACBE)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0, top: 2.0),
                                          child: Text(
                                            'Nayabazar Kathmandu ',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: const Color(
                                                    0xFFEFEFEFF1C1A1A)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //    height: 50,
                              //  color: Colors.red,
                            ),
                            Container(
                              width: 280,
                              margin: EdgeInsets.only(
                                  left: 24.0,
                                  right: 24.0,
                                  top: 4.0,
                                  bottom: 8.0),
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(02),
                                  color: const Color(0xFFEFEFEFFFFFFFFF)),

                              child: Container(
                                height: 25,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Text(
                                        'CHANGE STATUS',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(
                                                0xFFEFEFEFF1C1A1A)), //#1C1A1A
                                      ),
                                    ),
                                    /* Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0 ),
                                  child: Text(
                                    'ON/OF',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: const Color(0xFFEFEFEFF1C1A1A)),
                                  ),
                                ),*/

                                    FlutterSwitch(
                                      width: 55.0,
                                      height: 68.0,
                                      valueFontSize: 12.0,
                                      toggleSize: 22.0,
                                      value: status1,
                                      borderRadius: 16.0,
                                      padding: 4.0,
                                      // toggleColor: const Color(0xFFEFEFEFF1C1A1A),
                                      activeColor:const Color(0xFFEFEFEFF83C264),  //#83C264
                                      showOnOff: true,
                                      onToggle: (val) {
                                        setState(() {
                                          status1 = val;

                                          //  _showDialog();

                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              //    height: 50,
                              //  color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // view for tanks ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            TANKS
                //
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ExpansionTileCard(
                    initialPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                    contentPadding: EdgeInsets.all(16.0),
                    finalPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                    expandedColor: const Color(0xFFEFEFEFF2F7FA),
                    baseColor: const Color(0xFFEFEFEFF2F7FA),

                    //  backgroundColor: const Color(0xFFEFEFEFF2F7FA),
                    //  tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),
                    leading: Image.asset(
                      'asset/images/newtank.png',
                      height: 54,
                      width: 54,
                    ),
                    trailing: Image.asset(
                      'asset/images/add.png',
                      height: 30,
                      width: 30,
                    ),
                    title: Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Padding(
                            //padding: const EdgeInsets.all(4.0),
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 4.0, bottom: 8.0, top: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    Strings.tanks,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color(0xFFEFEFEFF1C1A1A)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    Strings.lorem,
                                    style: TextStyle(
                                        color: const Color(0xFFEFEFEFF303C48),
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(24.0),
                        padding: EdgeInsets.all(24.0),
                        height: 108,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFEFEFEFFFFFFFFF)),
                        //#FFFFFF
                        child: Row(
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
                                          color:
                                          const Color(0xFFEFEFEFF195ACBE)),
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
                                      "STATUS ON",
                                      style: TextStyle(
                                          color: const Color(0xFFEFEFEFFF54461),
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Image.asset(
                                'asset/images/add.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(
                      _deviceList[index].mobileNumber,
                    );
                  },
                  itemCount: _deviceList.length,
                ),
              ],
            ),
          ),
        ));





  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("DO YOU WANT TO CHANGE THE STATUS"),
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



class ExpandedTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
