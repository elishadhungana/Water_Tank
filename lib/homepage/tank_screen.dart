import 'package:flutter/material.dart';
import 'package:khyatee_app/api/api_service.dart';
import 'package:khyatee_app/model/list_devices.dart';

import '../allImages.dart';

class TankScreen extends StatefulWidget {
  @override
  _TankScreenState createState() => _TankScreenState();
}

class _TankScreenState extends State<TankScreen> {
  DeviceList newDeviceList = new DeviceList();
  LoginApiService _serviceAPI = LoginApiService();
  List<DeviceList> _deviceListTank = [];
  String pump;
  bool status1 = false;
  bool status2 = true;
  int onClickTankIndex;

  bool changeAddIcon = false;

  bool isSwitchOn = false;

  //tank visible
  bool _isVisibleTankList;
  bool _isvisibletankDetails;

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
    var dataTank = await _serviceAPI.deviceList(deviceType: "tank");
    //var dataTank = await _serviceAPI.deviceList();

    // var data = await _serviceAPI.deviceList();
    // print("print______________________$data");
    setState(() {
      _deviceListTank = dataTank;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchApi();
    _isVisibleTankList = true;
    _isvisibletankDetails = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isVisibleTankList = !_isVisibleTankList;

            });
          },
          child: Container(
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
                  _isVisibleTankList==true?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: AllImages.minusImage),
                  ):Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: AllImages.addImageUU),
                  )
                ],
              ),
            ),
          )
        ),
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
                          itemCount: _deviceListTank.length,
                          /*> 3
                              ? 3
                              : _deviceListTank.length,*/
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      onClickTankIndex = index;

                                      _isvisibletankDetails =
                                          !_isvisibletankDetails;
                                    });
                                  },
                                  child: Container(
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
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color:
                                                const Color(0xFFEFEFE214D723B),
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
                                          backgroundColor: const Color(0xFFEFEFEFFD7E3FC),),
                                        Container(
                                          //  color: Colors.yellow,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 2.0),
                                                child: Text(
                                                  _deviceListTank[index]
                                                      .deviceName,
                                                  //+_deviceList[index].deviceName,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xFFEFEFEFF214D72),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                         _isvisibletankDetails==true &&  index == onClickTankIndex?
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'asset/images/minus.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ): Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'asset/images/add.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                index == onClickTankIndex
                                    ? Visibility(
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
                                                      BorderRadius.circular(1),
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                          child: Image.asset(
                                                            'asset/images/group.png',
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                          backgroundColor: const Color(0xFFEFEFEFFCAF0F8)),
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
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
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    "Empty Since",
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
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    _deviceListTank[
                                                                            index]
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
                                                      BorderRadius.circular(1),
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
                                                          child: Image.asset(
                                                            'asset/images/group.png',
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                         backgroundColor: const Color(
                                                             0xFFEFEFEFF214D72) ,),
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
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
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
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
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                  child: Text(
                                                                    _deviceListTank[
                                                                            index]
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
}
