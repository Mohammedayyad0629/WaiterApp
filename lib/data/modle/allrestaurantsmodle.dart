class AllRestaurantsModle {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final List<Data>? data;
  final int? code;

  AllRestaurantsModle({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  AllRestaurantsModle.fromJson(Map<String, dynamic> json)
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
  final String? userNo;
  final int? categoryId;
  final String? name;
  final String? description;
  final String? email;
  final String? mobile;
  final String? commission;
  final String? deliveryCost;
  final int? status;
  final int? statusOpen;
  final String? photo;
  final String? latitude;
  final String? longitude;
  final String? from;
  final String? to;
  final dynamic address;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final int? open;
  final String? rate;
  final String? rateCount;

  final String? statusOpenProfile;

  Data({
    this.id,
    this.userId,
    this.userNo,
    this.categoryId,
    this.name,
    this.description,
    this.email,
    this.mobile,
    this.commission,
    this.deliveryCost,
    this.status,
    this.statusOpen,
    this.photo,
    this.latitude,
    this.longitude,
    this.from,
    this.to,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.open,
    this.rate,
    this.rateCount,
    this.statusOpenProfile,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        userNo = json['user_no'] as String?,
        categoryId = json['category_id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        email = json['email'] as String?,
        mobile = json['mobile'] as String?,
        commission = json['commission'] as String?,
        deliveryCost = json['delivery_cost'] as String?,
        status = json['status'] as int?,
        statusOpen = json['status_open'] as int?,
        photo = json['photo'] as String?,
        latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?,
        from = json['from'] as String?,
        to = json['to'] as String?,
        address = json['address'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        open = json['open'] as int?,
        rate = json['rate'].toString(),
        rateCount = json['rate_count'].toString(),
        statusOpenProfile = json['status_open_profile'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user_no': userNo,
        'category_id': categoryId,
        'name': name,
        'description': description,
        'email': email,
        'mobile': mobile,
        'commission': commission,
        'delivery_cost': deliveryCost,
        'status': status,
        'status_open': statusOpen,
        'photo': photo,
        'latitude': latitude,
        'longitude': longitude,
        'from': from,
        'to': to,
        'address': address,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'open': open,
        'rate': rate,
        'rate_count': rateCount,
        'status_open_profile': statusOpenProfile
      };
}
