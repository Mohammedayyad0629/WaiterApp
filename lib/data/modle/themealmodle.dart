class TheMealModle {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final Data? data;
  final int? code;

  TheMealModle({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  TheMealModle.fromJson(Map<String, dynamic> json)
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
  final String? countSeller;
  final Restaurant? restaurant;
  final List<SimilarMeals>? similarMeals;
  final List<dynamic>? extras;

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
    this.countSeller,
    this.restaurant,
    this.similarMeals,
    this.extras,
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
        countSeller = json['count_seller'].toString(),
        restaurant = (json['restaurant'] as Map<String, dynamic>?) != null
            ? Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>)
            : null,
        similarMeals = (json['similar_meals'] as List?)
            ?.map(
                (dynamic e) => SimilarMeals.fromJson(e as Map<String, dynamic>))
            .toList(),
        extras = json['extras'] as List?;

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
        'count_seller': countSeller,
        'restaurant': restaurant?.toJson(),
        'similar_meals': similarMeals?.map((e) => e.toJson()).toList(),
        'extras': extras
      };
}

class Restaurant {
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
  final int? rate;
  final int? rateCount;
  final String? rateDetails;
  final String? statusOpenProfile;

  Restaurant({
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
    this.rateDetails,
    this.statusOpenProfile,
  });

  Restaurant.fromJson(Map<String, dynamic> json)
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
        rate = json['rate'] as int?,
        rateCount = json['rate_count'] as int?,
        rateDetails = json['rate_details'].toString(),
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
        'rate_details': rateDetails,
        'status_open_profile': statusOpenProfile
      };
}

class SimilarMeals {
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
  final String? countSeller;
  final Restaurant2? restaurant;

  SimilarMeals({
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
    this.countSeller,
    this.restaurant,
  });

  SimilarMeals.fromJson(Map<String, dynamic> json)
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
        countSeller = json['count_seller'].toString(),
        restaurant = (json['restaurant'] as Map<String, dynamic>?) != null
            ? Restaurant2.fromJson(json['restaurant'] as Map<String, dynamic>)
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
        'count_seller': countSeller,
        'restaurant': restaurant?.toJson()
      };
}

class Restaurant2 {
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
  final int? rate;
  final int? rateCount;
  final String? rateDetails;
  final String? statusOpenProfile;

  Restaurant2({
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
    this.rateDetails,
    this.statusOpenProfile,
  });

  Restaurant2.fromJson(Map<String, dynamic> json)
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
        rate = json['rate'] as int?,
        rateCount = json['rate_count'] as int?,
        rateDetails = json['rate_details'].toString(),
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
        'rate_details': rateDetails,
        'status_open_profile': statusOpenProfile
      };
}
