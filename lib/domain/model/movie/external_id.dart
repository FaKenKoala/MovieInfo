import 'dart:convert';

class ExternalId {
  final Map<String, dynamic> externalId;

  ExternalId({
    this.externalId = const {},
  });

  factory ExternalId.fromJson(Map<String, dynamic> json) {
    return ExternalId(externalId: json);
  }

  Map<String, dynamic> toJson() => externalId;

  @override
  String toString() {
    return json.encode(externalId);
  }
}
