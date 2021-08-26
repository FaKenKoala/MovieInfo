import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class MovieImage {
  final int id;
  final List<AppImage> backdrops;
  final List<AppImage> logos;
  final List<AppImage> posters;
  MovieImage(
      {this.id = 0,
      this.backdrops = const [],
      this.logos = const [],
      this.posters = const []});

  factory MovieImage.fromJson(Map<String, dynamic> json) =>
      _$MovieImageFromJson(json);
  Map<String, dynamic> toJson() => _$MovieImageToJson(this);
}

@JsonSerializable()
class AppImage {
  final double aspectRatio;
  final int height;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;
  AppImage({
    this.aspectRatio = 0.0,
    this.height = 0,
    this.iso6391 = '',
    this.filePath = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.width = 0,
  });

  factory AppImage.fromJson(Map<String, dynamic> json) =>
      _$AppImageFromJson(json);
  Map<String, dynamic> toJson() => _$AppImageToJson(this);
}
