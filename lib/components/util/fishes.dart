import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fish/components/util/fishes_type.dart';

class fishes {
  int fish_id; //raw id ikan
  int user_id; //user id yang nulis si ikan dari user.dart
  int fish_type_ID;
  String fish_name;
  String type;
  String author_name;
  String fish_desc;
  String fish_price;
  String image_path;

  fishes({
    required this.fish_id,
    required this.user_id,
    required this.fish_type_ID,
    required this.type,
    required this.fish_name,
    required this.author_name,
    required this.fish_desc,
    required this.fish_price,
    required this.image_path,
  });

  factory fishes.fromJSON(Map<String, dynamic> json) {
    return fishes(
      fish_id: json['fish_id'] as int,
      user_id: json['user_id'] as int,
      fish_type_ID: json['fish_type_id'] as int,
      fish_name: json['fish_name'].toString(),
      author_name: json['username'].toString(),
      type: json['type_name'].toString(),
      fish_desc: json['fish_desc'].toString(),
      fish_price: json['fish_price'].toString(),
      image_path: json['fish_image_path'].toString(),
    );
  }
}
