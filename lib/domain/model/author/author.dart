import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  Author({
    this.name = '',
    this.username = '',
    this.avatarPath = '',
    this.rating,
  });

  final String name;
  final String username;
  final String avatarPath;
  final int? rating;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
