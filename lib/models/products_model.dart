import 'package:muhammad_uzair_flutter_trainee_test/constants/CommonKeys.dart';

class ProductsModel {
  int? _id;
  String? _title;
  num? _price;
  String? _description;
  String? _category;
  String? _image;
  Rating? _rating;

  int? get id => _id;

  String? get title => _title;

  num? get price => _price;

  String? get description => _description;

  String? get category => _category;

  String? get image => _image;

  Rating? get rating => _rating;

  ProductsModel({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _image = image;
    _rating = rating;
  }

  ProductsModel.fromJson(dynamic json) {
    _id = json[CommonKeys.PRODUCT_ID];
    _title = json[CommonKeys.PRODUCT_TITLE];
    _price = json[CommonKeys.PRODUCT_PRICE];
    _description = json[CommonKeys.PRODUCT_DESCRIPTION];
    _category = json[CommonKeys.PRODUCT_CATEGORY];
    _image = json[CommonKeys.PRODUCT_IMAGE];
    _rating = json[CommonKeys.PRODUCT_RATING] != null ? Rating.fromJson(json[CommonKeys.PRODUCT_RATING]) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[CommonKeys.PRODUCT_ID] = _id;
    map[CommonKeys.PRODUCT_TITLE] = _title;
    map[CommonKeys.PRODUCT_PRICE] = _price;
    map[CommonKeys.PRODUCT_DESCRIPTION] = _description;
    map[CommonKeys.PRODUCT_CATEGORY] = _category;
    map[CommonKeys.PRODUCT_IMAGE] = _image;
    if (_rating != null) {
      map[CommonKeys.PRODUCT_RATING] = _rating?.toJson();
    }
    return map;
  }
}

class Rating {
  num? _rate;
  int? _count;

  num? get rate => _rate;

  int? get count => _count;

  Rating({
    num? rate,
    int? count,
  }) {
    _rate = rate;
    _count = count;
  }

  Rating.fromJson(dynamic json) {
    _rate = json[CommonKeys.PRODUCT_RATING_RATE];
    _count = json[CommonKeys.PRODUCT_RATING_COUNT];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[CommonKeys.PRODUCT_RATING_RATE] = _rate;
    map[CommonKeys.PRODUCT_RATING_COUNT] = _count;
    return map;
  }
}
