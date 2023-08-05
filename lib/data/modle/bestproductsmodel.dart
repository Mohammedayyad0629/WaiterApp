class BestProductsModel {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final List<Data>? data;
  final int? code;

  BestProductsModel({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  BestProductsModel.fromJson(Map<String, dynamic> json)
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
  final int? restaurantId;
  final int? categoryId;
  final String? name;
  final String? enName;
  final String? kaName;
  final String? description;
  final String? photo;
  final String? price;
  final int? offer;
  final dynamic offerValue;
  final dynamic timePrepare;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final int? rate;
  final int? cart;
  final int? wishlist;
  final int? rateCount;
  final int? rateDetails;
  // final int? countSeller;
  final dynamic restaurant;
  final Category? category;

  Data({
    this.id,
    this.restaurantId,
    this.categoryId,
    this.name,
    this.enName,
    this.kaName,
    this.description,
    this.photo,
    this.price,
    this.offer,
    this.offerValue,
    this.timePrepare,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.rate,
    this.cart,
    this.wishlist,
    this.rateCount,
    this.rateDetails,
    // this.countSeller,
    this.restaurant,
    this.category,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        restaurantId = json['restaurant_id'] as int?,
        categoryId = json['category_id'] as int?,
        name = json['name'] as String?,
        enName = json['en_name'] as String?,
        kaName = json['ka_name'] as String?,
        description = json['description'] as String?,
        photo = json['photo'] as String?,
        price = json['price'] as String?,
        offer = json['offer'] as int?,
        offerValue = json['offer_value'],
        timePrepare = json['time_prepare'],
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        rate = json['rate'] as int?,
        cart = json['cart'] as int?,
        wishlist = json['wishlist'] as int?,
        rateCount = json['rate_count'] as int?,
        rateDetails = json['rate_details'] as int?,
        // countSeller = json['count_seller'] as int?,
        restaurant = json['restaurant'],
        category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'restaurant_id': restaurantId,
        'category_id': categoryId,
        'name': name,
        'en_name': enName,
        'ka_name': kaName,
        'description': description,
        'photo': photo,
        'price': price,
        'offer': offer,
        'offer_value': offerValue,
        'time_prepare': timePrepare,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'rate': rate,
        'cart': cart,
        'wishlist': wishlist,
        'rate_count': rateCount,
        'rate_details': rateDetails,
        // 'count_seller': countSeller,
        'restaurant': restaurant,
        'category': category?.toJson()
      };
}

class Category {
  final int? id;
  final String? name;
  final String? nameAr;
  final dynamic nameKa;
  final String? photo;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Category({
    this.id,
    this.name,
    this.nameAr,
    this.nameKa,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Category.fromJson(Map<String, dynamic> json)
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
