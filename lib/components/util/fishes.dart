import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fish/components/util/fishes_type.dart';

class fishes {
  int id; //raw id ikan
  int user_id; //user id yang nulis si ikan dari user.dart
  int author_id;
  int fish_type_ID;
  String fish_name;
  String fish_desc;
  String fish_price;
  String image_path;
  String author_name;
  String fish_type;

  File? fish_image;

  fishes({
    required this.id,
    required this.user_id,
    required this.author_id,
    required this.fish_type_ID,
    required this.fish_name,
    required this.fish_desc,
    required this.fish_price,
    required this.image_path,
    required this.author_name,
    required this.fish_type,
  });

  factory fishes.fromJSON(Map<String, dynamic> json) {
    return fishes(
      id: json['id'] as int,
      user_id: json['authorId'] as int,
      author_id: json['authorId'] as int,
      fish_type_ID: json['typeId'] as int,
      fish_name: json['fishName'].toString(),
      fish_desc: json['fishDesc'].toString(),
      fish_price: json['fishPrice'].toString(),
      image_path: json['imgPath'].toString(),
      author_name: json['authorName'].toString(),
      fish_type: json['authorName'].toString(),
    );
  }
}
