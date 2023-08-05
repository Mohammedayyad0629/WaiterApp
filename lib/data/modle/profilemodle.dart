class ProfileModle {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final Data? data;
  final int? code;

  ProfileModle({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  ProfileModle.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        messageEn = json['message_en'] as String?,
        messageAr = json['message_ar'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        code = json['code'] as int?;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message_en': messageEn,
        'message_ar': messageAr,
        'data': data?.toJson(),
        'code': code
      };
}

class Data {
  final int? id;
  final int? userId;
  final String? userNo;
  final String? name;
  final String? mobile;
  final String? email;
  final String? photo;
  final String? longitude;
  final String? latitude;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Data({
    this.id,
    this.userId,
    this.userNo,
    this.name,
    this.mobile,
    this.email,
    this.photo,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        userNo = json['user_no'] as String?,
        name = json['name'] as String?,
        mobile = json['mobile'] as String?,
        email = json['email'] as String?,
        photo = json['photo'] as String?,
        longitude = json['longitude'] as String?,
        latitude = json['latitude'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user_no': userNo,
        'name': name,
        'mobile': mobile,
        'email': email,
        'photo': photo,
        'longitude': longitude,
        'latitude': latitude,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt
      };
}
