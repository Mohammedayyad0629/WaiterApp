class AddressModle {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final List<Data>? data;
  final int? code;

  AddressModle({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  AddressModle.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        messageEn = json['message_en'] as String?,
        messageAr = json['message_ar'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        code = json['code'] as int?;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message_en': messageEn,
        'message_ar': messageAr,
        'data': data?.map((e) => e.toJson()).toList(),
        'code': code
      };
}

class Data {
  final int? id;
  final int? userId;
  final String? name;
  final String? mobile;
  final String? address;
  final String? longitude;
  final String? latitude;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Data({
    this.id,
    this.userId,
    this.name,
    this.mobile,
    this.address,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        name = json['name'] as String?,
        mobile = json['mobile'] as String?,
        address = json['address'] as String?,
        longitude = json['longitude'] as String?,
        latitude = json['latitude'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'mobile': mobile,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt
      };
}
