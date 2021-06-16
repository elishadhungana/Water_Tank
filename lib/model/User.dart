class User {
  String message;
  User user;

  User({this.message, this.user});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String username;
  String password;
  String name;
  String address;
  String mobileNumber;
  String email;
  int status;
  String role;

  Data(
      {this.id,
        this.username,
        this.password,
        this.name,
        this.address,
        this.mobileNumber,
        this.email,
        this.status,
        this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    address = json['address'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    status = json['status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['status'] = this.status;
    data['role'] = this.role;
    return data;
  }
}
