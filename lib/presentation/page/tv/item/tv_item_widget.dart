import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/tv/tv.dart';

class TVItemWidget extends StatelessWidget {
  final TV tv;
  const TVItemWidget({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        child: Column(
          children: [
            Expanded(
                child: CachedNetworkImage(
              imageUrl: AppConfig.poster(tv.posterPath),
              fit: BoxFit.cover,
            )),
            Text(
              '${tv.name}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              '${tv.lastAirDate}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
