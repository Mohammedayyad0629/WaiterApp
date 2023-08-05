class MealsProductsRestaurantModle {
  final bool? status;
  final String? messageEn;
  final String? messageAr;
  final Data? data;
  final int? code;

  MealsProductsRestaurantModle({
    this.status,
    this.messageEn,
    this.messageAr,
    this.data,
    this.code,
  });

  MealsProductsRestaurantModle.fromJson(Map<String, dynamic> json)
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
  final int? currentPage;
  final List<Meals>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Data.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Meals.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)
            ?.map((dynamic e) => Links.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPageUrl = json['next_page_url'],
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total
      };
}

class Meals {
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

  Meals({
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
  });

  Meals.fromJson(Map<String, dynamic> json)
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
        countSeller = json['count_seller'].toString();

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
        'count_seller': countSeller
      };
}

class Links {
  final dynamic url;
  final String? label;
  final bool? active;

  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;

  Map<String, dynamic> toJson() =>
      {'url': url, 'label': label, 'active': active};
}
