import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
part 'cat.g.dart';

@HiveType(typeId: 0)
class CatFact extends HiveObject {
  @HiveField(0)
  final String fact;
  CatFact(
    this.fact,
  );

  Map<String, dynamic> toMap() {
    return {
      'fact': fact,
    };
  }

  factory CatFact.fromMap(Map<String, dynamic> map) {
    return CatFact(
      map['fact'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatFact.fromJson(String source) =>
      CatFact.fromMap(json.decode(source));
}
