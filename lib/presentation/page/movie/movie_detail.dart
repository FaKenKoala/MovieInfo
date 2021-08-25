import 'package:flutter/material.dart';
import 'package:movie_info/domain/model/movie/movie.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  const MovieDetail({Key? key,required this.movie}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
