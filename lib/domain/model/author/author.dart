import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  Author({
    this.name = '',
    this.username = '',
    this.avatarPath = '',
    this.rating = 0.0,
  });

  final String name;
  final String username;
  final String avatarPath;
  final double rating;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
