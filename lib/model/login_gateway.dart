class LoginGateway {
  String response;
  String token;
  int deviceId;
  int userId;
  String account;
  String imeiNo;


  LoginGateway(
      {this.response,
        this.token,
        this.deviceId,
        this.userId,
        this.account,
        this.imeiNo,
      });

  LoginGateway.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    token = json['token'];
    deviceId = json['deviceId'];
    userId = json['userId'];
    account = json['account'];
    imeiNo = json['imeiNo'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['token'] = this.token;
    data['deviceId'] = this.deviceId;
    data['userId'] = this.userId;
    data['account'] = this.account;
    data['imeiNo'] = this.imeiNo;

    return data;
  }
}