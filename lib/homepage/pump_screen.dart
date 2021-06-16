import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:khyatee_app/allImages.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/model/list_devices.dart';
import 'package:khyatee_app/model/login_gateway.dart';
import 'package:khyatee_app/model/sms_khyatee.dart';
import 'package:khyatee_app/strings.dart';

class PumpScreen extends StatefulWidget {
  @override
  _pumpScreenState createState() => _pumpScreenState();
}

class _pumpScreenState extends State<PumpScreen> {
  DeviceList newDeviceList = new DeviceList();
  LoginApiService _serviceAPI = LoginApiService();
  List<DeviceList> _deviceListPump = [];
  String pump;
  bool _isVisible;
  bool statustrue = true;
  bool statusfalse = false;
  int onCLickPumpIndex;
  int onCLickToogle;
  bool changeAddIcon = false;
  bool _isVisibleDetails = false;
  bool isSwitchOn = false;

  String account;
  String password;
  String imeiNo;

  LoginGateway newLoginGateway = new LoginGateway();
  SmsKhyatee _smsKhyatee = new SmsKhyatee();

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
    print("object_____________________________");
    var dataPump = await _serviceAPI.deviceList(deviceType: "pump");

/*
   await _serviceAPI.loginGateway(
        account: "khyateesms",
        password: "khyateesms",
        imeiNo: "123456789012345");
    if (newLoginGateway != null) {
      print(newLoginGateway.imeiNo);
    }*/

    //////////////////

    setState(() {
      _deviceListPump = dataPump;
    });
  }

  //login gateway
  @override
  void initState() {
    super.initState();
    fetchApi();
    _isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    child: _isVisible == true
                        ? Container(child: AllImages.minusImage)
                        : Container(child: AllImages.addImageUU),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      onCLickPumpIndex = index;
                                      onCLickToogle = index;
                                      print(onCLickPumpIndex);
                                      _isVisibleDetails = !_isVisibleDetails;
                                    });
                                  },
                                  child: Container(
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
                                    decoration:
                                        _deviceListPump[index].deviceStatus ==
                                                "ON"
                                            ? decorationBoxGreen
                                            : decorationBoxRED,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          child: Image.asset(
                                            'asset/images/horipump.png',
                                            height: 30,
                                            width: 30,
                                          ),
                                          backgroundColor:
                                              const Color(0xFFEFEFEFF5BE6F6),
                                        ),
                                        Container(
                                          //  color: Colors.yellow,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'ID ' +
                                                      _deviceListPump[index]
                                                          .mobileNumber,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11,
                                                      color: const Color(
                                                          0xFFEFEFEFF195ACBE)),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 2.0),
                                                child: Text(
                                                  _deviceListPump[index]
                                                      .deviceName,
                                                  //+_deviceList[index].deviceName,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xFFEFEFEFF214D72),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 2.0),
                                                child: Text(
                                                  'STATUS ' +
                                                      _deviceListPump[index]
                                                          .deviceStatus,
                                                  style: TextStyle(
                                                      color: _deviceListPump[
                                                                      index]
                                                                  .deviceStatus ==
                                                              'ON'
                                                          ? const Color(
                                                              0xFFEFEFEFF83C264)
                                                          : const Color(
                                                              0xFFEFEFEFFF54461),
                                                      fontSize: 11),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: _isVisibleDetails == true &&
                                                  index == onCLickPumpIndex
                                              ? Image.asset(
                                                  'asset/images/minus.png',
                                                  height: 20,
                                                  width: 20,
                                                )
                                              : Image.asset(
                                                  'asset/images/add.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                index == onCLickPumpIndex
                                    ? Visibility(
                                        visible: _isVisibleDetails,
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(8.0),

                                              padding: EdgeInsets.all(12.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(02),
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 4.0),
                                                          child: CircleAvatar(
                                                            child: Image.asset(
                                                              'asset/images/pump.png',
                                                              height: 30,
                                                              width: 30,
                                                            ),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFEFEFEFF5BE6F6),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 12.0),
                                                          child: Text(
                                                            'ID',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xFFEFEFEFF195ACBE)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 2.0),
                                                          child: Text(
                                                            _deviceListPump[
                                                                    index]
                                                                .mobileNumber,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xFFEFEFEFF1C1A1A)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 12.0),
                                                          child: Text(
                                                            'NAME',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xFFEFEFEFF195ACBE)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 2.0),
                                                          child: Text(
                                                            _deviceListPump[
                                                                    index]
                                                                .deviceName,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xFFEFEFEFF1C1A1A)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 12.0),
                                                          child: Text(
                                                            'MOBILE',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xFFEFEFEFF195ACBE)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 2.0),
                                                          child: Text(
                                                            _deviceListPump[
                                                                    index]
                                                                .mobileNumber,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 44,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 12.0),
                                                          child: Text(
                                                            'STATUS ' +
                                                                _deviceListPump[
                                                                        index]
                                                                    .deviceStatus,
                                                            style: TextStyle(
                                                                color: const Color(
                                                                    0xFFEFEFEFFF54461)),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 4.0),
                                                          child: Text(
                                                            'LOCATION',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xFFEFEFEFF195ACBE)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 2.0),
                                                          child: Text(
                                                            _deviceListPump[
                                                                    index]
                                                                .location,
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
                                            index == onCLickPumpIndex
                                                ? Container(
                                                    margin: EdgeInsets.all(8.0),
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
                                                                    right: 8.0),
                                                            child: Text(
                                                              'CHANGE STATUS',
                                                              style: TextStyle(
                                                                  fontSize: 13,
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
                                                            valueFontSize: 12.0,
                                                            toggleSize: 22.0,
                                                            value:/* _deviceListPump[
                                                                            index]
                                                                        .deviceStatus ==
                                                                    "ON"
                                                                ? statustrue
                                                                : statusfalse,*/ statusfalse,
                                                            borderRadius: 16.0,
                                                            padding: 4.0,
                                                            // toggleColor: const Color(0xFFEFEFEFF1C1A1A),
                                                            activeColor:
                                                                const Color(
                                                                    0xFFEFEFEFF83C264),
                                                            //#83C264
                                                            showOnOff: true,
                                                            onToggle: (val) {
                                                              print(val);
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    // return object of type Dialog
                                                                    return AlertDialog(
                                                                      title: new Text(
                                                                          "Do you want to change status?"),
                                                                      actions: <
                                                                          Widget>[
                                                                        // usually buttons at the bottom of the dialog
                                                                        new FlatButton(
                                                                          child:
                                                                              new Text("YES"),
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {


                                                                              if (index == onCLickToogle ) {
                                                                                print(index);
                                                                                statusfalse =val;
                                                                              }
                                                                              Navigator.of(context).pop();
                                                                              print("successful");
                                                                            });
                                                                            await _serviceAPI.sendSMS(
                                                                                phone_number: "9864474777",
                                                                                messages: "ID = " + _deviceListPump[index].mobileNumber.toString() + "  with device code " + _deviceListPump[index].deviceCode + " status change to " + _deviceListPump[index].deviceStatus,
                                                                                device_id: "237");
                                                                          },
                                                                        ),
                                                                        new FlatButton(
                                                                          child:
                                                                              new Text("NO"),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        )
                                                                      ],
                                                                    );
                                                                    // _showDialog();
                                                                  });
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    //    height: 50,
                                                    //  color: Colors.red,
                                                  )
                                                : Container(),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Do you want to change status?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("YES"),
              onPressed: () async {
                Navigator.of(context).pop();
                print("successful");
                await _serviceAPI.sendSMS(
                    phone_number: "9864474777",
                    // messages: "This is pending sms from react native APP.",
                    device_id: "237");

                if (_smsKhyatee != null) {
                  print(_smsKhyatee.messages);
                }
              },
            ),

            new FlatButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
