class Login {
  bool result;
  int expiration;

  Login({this.result, this.expiration});

  Login.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['expiration'] = this.expiration;
    return data;
  }
}
