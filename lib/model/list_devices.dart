class DeviceList {
  int id;
  String mobileNumber;
  String deviceName;
  String deviceCode;
  String deviceType;
  String image;
  String location;
  String lng;
  String ltd;
  String deviceStatus;
  String date;
  String emptySince;
  String fillingSince;
  String fullSince;

  DeviceList(
      {this.id,
        this.mobileNumber,
        this.deviceName,
        this.deviceCode,
        this.deviceType,
        this.image,
        this.location,
        this.lng,
        this.ltd,
        this.deviceStatus,
        this.date,
        this.emptySince,
        this.fillingSince,
        this.fullSince});

  DeviceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNumber = json['mobile_number'];
    deviceName = json['device_name'];
    deviceCode = json['device_code'];
    deviceType = json['device_type'];
    image = json['image'];
    location = json['location'];
    lng = json['lng'];
    ltd = json['ltd'];
    deviceStatus = json['device_status'];
    date = json['date'];
    emptySince = json['empty_since'];
    fillingSince = json['filling_since'];
    fullSince = json['full_since'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile_number'] = this.mobileNumber;
    data['device_name'] = this.deviceName;
    data['device_code'] = this.deviceCode;
    data['device_type'] = this.deviceType;
    data['image'] = this.image;
    data['location'] = this.location;
    data['lng'] = this.lng;
    data['ltd'] = this.ltd;
    data['device_status'] = this.deviceStatus;
    data['date'] = this.date;
    data['empty_since'] = this.emptySince;
    data['filling_since'] = this.fillingSince;
    data['full_since'] = this.fullSince;
    return data;
  }
}