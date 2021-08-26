import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/author/author.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  Review({
    this.author = '',
    required this.authorDetails,
    this.content = '',
    this.createdAt,
    this.id = '',
    this.updatedAt,
    this.url = '',
  });

  final String author;
  final Author authorDetails;
  final String content;
  final DateTime? createdAt;
  final String id;
  final DateTime? updatedAt;
  final String url;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
