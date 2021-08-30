import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_info/application/util/app_config.dart';
import 'package:movie_info/domain/model/person/person.dart';

class PersonItemWidget extends StatelessWidget {
  final Person person;
  const PersonItemWidget({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        child: Column(
          children: [
            Expanded(
                child: CachedNetworkImage(
              imageUrl: AppConfig.imageUrl(person.profilePath),
              fit: BoxFit.cover,
            )),
            Text(
              '${person.name}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              '${person.knownForDepartment}',
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
