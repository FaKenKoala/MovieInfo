import 'package:flutter/material.dart';
import 'package:movie_info/domain/model/genre/genre.dart';

class GenreWidget extends StatelessWidget {
  final List<Genre> genres;
  const GenreWidget({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      direction: Axis.horizontal,
      children:
          genres.map<Widget>((genre) => GenreItemWidget(genre: genre)).toList(),
    );
  }
}

class GenreItemWidget extends StatelessWidget {
  final Genre genre;
  const GenreItemWidget({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: Colors.tealAccent[200],
        padding: const EdgeInsets.all(8),
        label: Text(
          '${genre.name}',
          style: TextStyle(fontSize: 20),
        ));
  }
}
