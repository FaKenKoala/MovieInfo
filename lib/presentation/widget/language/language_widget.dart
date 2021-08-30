import 'package:flutter/material.dart';
import 'package:movie_info/domain/model/language/language.dart';

class LanguageWidget extends StatelessWidget {
  final List<Language> languages;
  const LanguageWidget({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      direction: Axis.horizontal,
      children:
          languages.map<Widget>((genre) => LanguageItemWidget(language: genre)).toList(),
    );
  }
}

class LanguageItemWidget extends StatelessWidget {
  final Language language;
  const LanguageItemWidget({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: Colors.redAccent[100],
        padding: const EdgeInsets.all(8),
        label: Text(
          '${language.name}',
          style: TextStyle(fontSize: 20),
        ));
  }
}
