import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/media/image.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class PersonProfileImageList {
  final int id;
  final List<MediaImageItem> profiles;
  PersonProfileImageList({
    this.id = 0,
    this.profiles = const [],
  });

  factory PersonProfileImageList.fromJson(Map<String, dynamic> json) =>
      _$PersonProfileImageListFromJson(json);
  Map<String, dynamic> toJson() => _$PersonProfileImageListToJson(this);
  
  @override
  String toString() {
    return json.encode(toJson());
  }
}
