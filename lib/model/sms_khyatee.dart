class SmsKhyatee {
  String response;
  List<Messages> messages;

  SmsKhyatee({this.response, this.messages});

  SmsKhyatee.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['messages'] != null) {
      messages = new List<Messages>();
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  int id;
  String organizationId;
  String messageId;
  int messageIdNo;
  int deviceId;
  String phoneNumber;
  String messages;
  String status;
  String log;
  String createdAt;
  String updatedAt;

  Messages(
      {this.id,
        this.organizationId,
        this.messageId,
        this.messageIdNo,
        this.deviceId,
        this.phoneNumber,
        this.messages,
        this.status,
        this.log,
        this.createdAt,
        this.updatedAt});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organization_id'];
    messageId = json['message_id'];
    messageIdNo = json['message_id_no'];
    deviceId = json['device_id'];
    phoneNumber = json['phone_number'];
    messages = json['messages'];
    status = json['status'];
    log = json['log'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_id'] = this.organizationId;
    data['message_id'] = this.messageId;
    data['message_id_no'] = this.messageIdNo;
    data['device_id'] = this.deviceId;
    data['phone_number'] = this.phoneNumber;
    data['messages'] = this.messages;
    data['status'] = this.status;
    data['log'] = this.log;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
