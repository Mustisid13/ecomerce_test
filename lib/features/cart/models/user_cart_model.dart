// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';

class UserCartProduct {
  ProductDataModel? productDataModel;
  int? count;
  UserCartProduct({
    this.productDataModel,
    this.count,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productDataModel': productDataModel?.toJson(),
      'count': count,
    };
  }

  factory UserCartProduct.fromJson(Map<String, dynamic> map) {
    return UserCartProduct(
      productDataModel: map['productDataModel'] != null ? ProductDataModel.fromJson(map['productDataModel'] as Map<String,dynamic>) : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  

  UserCartProduct copyWith({
    ProductDataModel? productDataModel,
    int? count,
  }) {
    return UserCartProduct(
      productDataModel: productDataModel ?? this.productDataModel,
      count: count ?? this.count,
    );
  }
}
