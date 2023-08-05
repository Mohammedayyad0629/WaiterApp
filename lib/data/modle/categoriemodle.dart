class AllCategriesModel {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final List<Data>? data;
  final int? code;

  AllCategriesModel({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  AllCategriesModel.fromJson(Map<String, dynamic> json)
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
  final String? name;
  final String? nameAr;
  final dynamic nameKa;
  final String? photo;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Data({
    this.id,
    this.name,
    this.nameAr,
    this.nameKa,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        nameAr = json['name_ar'] as String?,
        nameKa = json['name_ka'],
        photo = json['photo'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_ar': nameAr,
        'name_ka': nameKa,
        'photo': photo,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt
      };
}
