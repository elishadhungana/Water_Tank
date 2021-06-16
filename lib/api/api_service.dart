import 'package:dio/dio.dart';
import 'package:khyatee_app/model/list_devices.dart';
import 'package:khyatee_app/model/login_gateway.dart';
import 'package:khyatee_app/model/login_model.dart';
import 'package:khyatee_app/model/sms_khyatee.dart';

class LoginApiService {
  final dio = Dio();
  Login loginUser;
  DeviceList _deviceList;

  Future<Login> login({
    String username,
    String password,
  }) async {
    try {
      var response = await dio.post(
        //'http://khyatee.himalayanhackers.com/node/api/users/login',
        'http://khyatee.himalayanhackers.com/node/api/users/login',
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        print("User Logged in");
        loginUser = Login.fromJson(response.data);
        return loginUser;
      } else {
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response.data.toString());
      }
      return null;
    }
  }

  Future<List<DeviceList>> deviceList({String deviceType}) async {//
    List<DeviceList> newList = [];
    try {
      var response = await dio.post(
        //"http://khyatee.himalayanhackers.com/node/api/machine_info/list_devices",
        'http://192.168.1.246:3012/api/machine_info/list_devices',

        data: {"device_type": deviceType},

        // "https://api.mocki.io/v1/1867ec66",
      );
      if (response.statusCode == 200) {
        print(response.data);
        response.data.forEach((e) {
          newList.add(DeviceList.fromJson(e));
        });
        return newList;
      } else {
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response.data.toString());
      }
      return null;
    }
  }



  Future<List<SmsKhyatee>> sendSMS(
      {String phone_number, String messages, String device_id}) async {
    print("API&&&&&&&&&&&&&&&&7");

    //{String deviceType}
    List<SmsKhyatee> smsKhyateeList = [];
    try {
      //  dio.options.headers['Content-Type'] = 'application/json';
      //dio.options.headers["authorization"] = "5a8a47970a8d9e19d361bf97d89ee00cd8356c3b";
      var response = await dio.post(
        "https://smsgateway.himalayantechies.com/api/messages/send",
        options: Options(
          headers: {
            "Content-Type":"application/json",
            "authorization": "5a8a47970a8d9e19d361bf97d89ee00cd8356c3b"
          },
        ),
        data: [{
          "phone_number": phone_number,
          "messages": messages,
          "device_id": device_id
        }],
      );
    print(response.data);

      if (response.statusCode == 201) {
        print("objectdata printed");
        print(response.data);
        response.data.forEach((e) {
          smsKhyateeList.add(SmsKhyatee.fromJson(e));
        });
        return smsKhyateeList;
      } else {
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response.data.toString());
      }
      return null;
    }
  }
}
