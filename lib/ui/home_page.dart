import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expanded_tile/tileController.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/model/list_devices.dart';

import '../allImages.dart';
import '../strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExpandedTileController expandedTileController = new ExpandedTileController();
  DeviceList newDeviceList = new DeviceList();
  LoginApiService _serviceAPI = LoginApiService();
  List<DeviceList> _deviceListPump = [];
  List<DeviceList> _deviceListTank = [];
  String pump;
  bool _isVisible;
  bool status1 = false;
  bool status2 = true;
  int onCLickPumpIndex;

  bool changeAddIcon = false;

  bool _isVisibleDetails = false;
  bool isSwitchOn = false;

  //tank visible
  bool _isVisibleTankList;
  bool _isvisibletankDetails;

  Color _textColor = Colors.black;
  Color _scaffoldBgcolor = Colors.white;

  Decoration decorationBoxRED = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          color: const Color(0xFFEFEFE214E56464),
          //#214D723B
          width: 2),
      color: const Color(0xFFEFEFEFFFFE9ED));

  Decoration decorationBoxGreen = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
          color: const Color(0xFFEFEFE21483C264),
          //#214D723B
          width: 2),
      color: const Color(0xFFEFEFEFFECF6E7));

  fetchApi() async {
    //var dataTank = await _serviceAPI.deviceList(deviceType: "tank");
   // var dataPump = await _serviceAPI.deviceList(deviceType: "pump");

    // var data = await _serviceAPI.deviceList();
    // print("print______________________$data");
    setState(() {
     // _deviceListPump = dataPump;
     // _deviceListTank = dataTank;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchApi();
    _isVisible = false;
    _isVisibleTankList = false;
    _isvisibletankDetails=false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                //view for pumps +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ PUMPS
                InkWell(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20.0, bottom: 8.0, right: 20.0, top: 20.0),
                    padding: EdgeInsets.all(8.0),
                    height: 90,

                    //#C6C6C8 #F2F7FA
                    decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEFF2F7FA),
                        borderRadius: BorderRadius.circular(20)),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Image.asset(
                              'asset/images/newpump.png',
                              height: 48,
                              width: 48,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
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
                                    "Pumps Details",
                                    style: TextStyle(
                                        color: const Color(0xFFEFEFEFF214D72),
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(child: AllImages.addImageUU),
                            /*child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              child: Container(child: AllImages.addImageUU),
                            ),*/
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //view for list +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ LIST

                //list ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                Visibility(
                  visible: _isVisible,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.all(4.0),

                    //#C6C6C8 #F2F7FA
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEFF2F7FA),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Column(
                      children: [
                        //LIST 1
                        Container(
                          //#FFFFFF
                          child: Column(
                            children: [
                              Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _deviceListPump.length,
                                  /* > 3
                                      ? 3
                                      : _deviceListPump.length,*/
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        _deviceListPump[index].deviceStatus ==
                                                'ON'
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4.0,
                                                    bottom: 4.0),
                                                padding: EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12.0,
                                                    top: 14.0,
                                                    bottom: 14.0),
                                                decoration: decorationBoxGreen,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CircleAvatar(
                                                        child: Image.asset(
                                                          'asset/images/pumplist.png',
                                                          height: 30,
                                                          width: 30,
                                                        ),
                                                        backgroundImage: AssetImage(
                                                            'asset/images/circleimage.png')),
                                                    Container(
                                                      //  color: Colors.yellow,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'ID ' +
                                                                  _deviceListPump[
                                                                          index]
                                                                      .mobileNumber,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 11,
                                                                  color: const Color(
                                                                      0xFFEFEFEFF195ACBE)),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.0),
                                                            child: Text(
                                                              _deviceListPump[
                                                                      index]
                                                                  .deviceName,
                                                              //+_deviceList[index].deviceName,
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFFEFEFEFF214D72),
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          _deviceListPump[index]
                                                                      .deviceStatus ==
                                                                  'ON'
                                                              ? Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    'STATUS ' +
                                                                        _deviceListPump[index]
                                                                            .deviceStatus,
                                                                    // _deviceList[index].id.toString(),
                                                                    style: TextStyle(
                                                                        color: const Color(0xFFEFEFEFF83C264),

                                                                        //#F54461
                                                                        fontSize: 11),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    'STATUS ' +
                                                                        _deviceListPump[index]
                                                                            .deviceStatus,
                                                                    // _deviceList[index].id.toString(),
                                                                    style: TextStyle(
                                                                        //#83C264
                                                                        //#F54461
                                                                        color: const Color(0xFFEFEFEFFF54461),
                                                                        fontSize: 11),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            onCLickPumpIndex =
                                                                index;

                                                            _isVisibleDetails =
                                                                !_isVisibleDetails;

                                                            print(
                                                                _isVisibleDetails);
                                                          });
                                                        },
                                                        child: Container(
                                                          child: Image.asset(
                                                            'asset/images/add.png',
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4.0,
                                                    bottom: 4.0),
                                                padding: EdgeInsets.only(
                                                    left: 12.0,
                                                    right: 12.0,
                                                    top: 14.0,
                                                    bottom: 14.0),
                                                decoration: decorationBoxRED,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CircleAvatar(
                                                        child: Image.asset(
                                                          'asset/images/pumplist.png',
                                                          height: 30,
                                                          width: 30,
                                                        ),
                                                        backgroundImage: AssetImage(
                                                            'asset/images/circleimage.png')),
                                                    Container(
                                                      //  color: Colors.yellow,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'ID ' +
                                                                  _deviceListPump[
                                                                          index]
                                                                      .mobileNumber,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 11,
                                                                  color: const Color(
                                                                      0xFFEFEFEFF195ACBE)),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.0),
                                                            child: Text(
                                                              _deviceListPump[
                                                                      index]
                                                                  .deviceName,
                                                              //+_deviceList[index].deviceName,
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFFEFEFEFF214D72),
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          _deviceListPump[index]
                                                                      .deviceStatus ==
                                                                  'ON'
                                                              ? Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    'STATUS ' +
                                                                        _deviceListPump[index]
                                                                            .deviceStatus,
                                                                    // _deviceList[index].id.toString(),
                                                                    style: TextStyle(
                                                                        color: const Color(0xFFEFEFEFF83C264),

                                                                        //#F54461
                                                                        fontSize: 11),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    'STATUS ' +
                                                                        _deviceListPump[index]
                                                                            .deviceStatus,
                                                                    // _deviceList[index].id.toString(),
                                                                    style: TextStyle(
                                                                        //#83C264
                                                                        //#F54461
                                                                        color: const Color(0xFFEFEFEFFF54461),
                                                                        fontSize: 11),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            onCLickPumpIndex =
                                                                index;

                                                            _isVisibleDetails =
                                                                !_isVisibleDetails;
                                                          });
                                                        },
                                                        child: Container(
                                                          child: Image.asset(
                                                            'asset/images/add.png',
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        index == onCLickPumpIndex
                                            ? Visibility(
                                                //////// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ PUMP DETAILS
                                                visible: _isVisibleDetails,

                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),

                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(02),
                                                          color: const Color(
                                                              0xFFEFEFEFFFFFFFFF)),

                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top: 4.0),
                                                                  child: CircleAvatar(
                                                                      child: Image.asset(
                                                                        'asset/images/pump.png',
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                      ),
                                                                      backgroundImage: AssetImage('asset/images/circleimage.png')),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top:
                                                                          12.0),
                                                                  child: Text(
                                                                    'ID',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF195ACBE)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top: 2.0),
                                                                  child: Text(
                                                                    _deviceListPump[
                                                                            index]
                                                                        .mobileNumber,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF1C1A1A)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top:
                                                                          12.0),
                                                                  child: Text(
                                                                    'NAME',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF195ACBE)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top: 2.0),
                                                                  child: Text(
                                                                    'Elisha Dhungana',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF1C1A1A)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top:
                                                                          12.0),
                                                                  child: Text(
                                                                    'MOBILE',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF195ACBE)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top: 2.0),
                                                                  child: Text(
                                                                    _deviceListPump[
                                                                            index]
                                                                        .mobileNumber,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF1C1A1A)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 44,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top:
                                                                          12.0),
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
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top: 4.0),
                                                                  child: Text(
                                                                    'LOCATION',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color(
                                                                            0xFFEFEFEFF195ACBE)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                      top: 2.0),
                                                                  child: Text(
                                                                    _deviceListPump[
                                                                            index]
                                                                        .location,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
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
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(02),
                                                          color: const Color(
                                                              0xFFEFEFEFFFFFFFFF)),

                                                      child: Container(
                                                        height: 25,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0),
                                                              child: Text(
                                                                'CHANGE STATUS',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: const Color(
                                                                        0xFFEFEFEFF1C1A1A)), //#1C1A1A
                                                              ),
                                                            ),
                                                            FlutterSwitch(
                                                              width: 55.0,
                                                              height: 68.0,
                                                              valueFontSize:
                                                                  12.0,
                                                              toggleSize: 22.0,
                                                              value: status1,
                                                              borderRadius:
                                                                  16.0,
                                                              padding: 4.0,
                                                              // toggleColor: const Color(0xFFEFEFEFF1C1A1A),
                                                              activeColor:
                                                                  const Color(
                                                                      0xFFEFEFEFF83C264),
                                                              //#83C264
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
                                              )
                                            : Container(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        //list more details ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  MORE DETAILS
                      ],
                    ),
                  ),
                ),

                // view for tanks ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            TANKS
                Container(
                  margin: EdgeInsets.only(
                      left: 20.0, bottom: 8.0, right: 20.0, top: 16.0),
                  padding: EdgeInsets.all(8.0),
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEFF2F7FA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Image.asset(
                            'asset/images/newtank.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "TANKS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: const Color(0xFFEFEFEFF1C1A1A)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 2.0),
                                child: Text(
                                  "Tanks Details",
                                  style: TextStyle(
                                      color: const Color(0xFFEFEFEFF214D72),
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isVisibleTankList = !_isVisibleTankList;
                              });
                            },
                            child: Container(
                              child: Container(child: AllImages.addImage),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // view for tanks____details ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++            TANKS-details
                Visibility(
                  visible: _isVisibleTankList,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.all(8.0),

                    //#C6C6C8 #F2F7FA
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFEFF2F7FA),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Column(
                      children: [
                        //LIST 1
                        Container(
                          //#FFFFFF
                          child: Column(
                            children: [
                              Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _deviceListTank.length > 3
                                      ? 3
                                      : _deviceListTank.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 4.0,
                                              bottom: 4.0),
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 8.0,
                                              bottom: 8.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: const Color(
                                                      0xFFEFEFE214D723B),
                                                  //#214D723B
                                                  width: 0.5),
                                              color: Colors.white),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                  child: Image.asset(
                                                    'asset/images/layertank.png',
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  backgroundImage: AssetImage(
                                                      'asset/images/layer.png')),
                                              Container(
                                                //  color: Colors.yellow,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 2.0),
                                                      child: Text(
                                                        _deviceListTank[index]
                                                            .deviceName,
                                                        //+_deviceList[index].deviceName,
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xFFEFEFEFF214D72),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _isvisibletankDetails = !_isvisibletankDetails;
                                                    });
                                                  },
                                                  child: Container(
                                                    child: Image.asset(
                                                      'asset/images/add.png',
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                   Visibility(
                                          visible: _isvisibletankDetails,
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4.0,
                                                    bottom: 4.0),
                                                padding: EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 8.0,
                                                    bottom: 8.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFFEFEFE214CAF0F8),
                                                        //#214D723B
                                                        width: 0.5),
                                                    color: const Color(
                                                        0xFFF54461)),
                                                //#CAF0F8
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CircleAvatar(
                                                            child: Image.asset(
                                                              'asset/images/layertank.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'asset/images/layer.png')),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      24.0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                2.0),
                                                                    child: Text(
                                                                      "Empty Since",
                                                                      //+_deviceList[index].deviceName,
                                                                      style:
                                                                          TextStyle(
                                                                        color: const Color(
                                                                            0xFF95ACBE),
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                2.0),
                                                                    child: Text(
                                                                      _deviceListTank[index]
                                                                          .emptySince,
                                                                      //+_deviceList[index].deviceName,
                                                                      style:
                                                                          TextStyle(
                                                                        color: const Color(
                                                                            0xFFEFEFEFF1C1A1A),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 4.0,
                                                    bottom: 4.0),
                                                padding: EdgeInsets.only(
                                                    left: 8.0,
                                                    right: 8.0,
                                                    top: 8.0,
                                                    bottom: 8.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFFEFEFE214CAF0F8),
                                                        //#214D723B
                                                        width: 0.5),
                                                    color: const Color(
                                                        0xFFEFEFE214F54461)),
                                                //#CAF0F8
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CircleAvatar(
                                                            child: Image.asset(
                                                              'asset/images/layertank.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'asset/images/layer.png')),
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      24.0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                2.0),
                                                                    child: Text(
                                                                      "Full Since",
                                                                      //+_deviceList[index].deviceName,
                                                                      style:
                                                                          TextStyle(
                                                                        color: const Color(
                                                                            0xFFEFEFEFF95ACBE),
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                2.0),
                                                                    child: Text(
                                                                      _deviceListTank[index]
                                                                          .fullSince,
                                                                      //+_deviceList[index].deviceName,
                                                                      style:
                                                                          TextStyle(
                                                                        color: const Color(
                                                                            0xFFEFEFEFF1C1A1A),
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              ///////////////////////////
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ExpandedTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
