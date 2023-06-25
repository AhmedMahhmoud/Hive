import 'package:hive_flutter/hive_flutter.dart';

import '../model/cat.dart';

class HiveService {
  HiveService._();

  // Singleton instance
  static final HiveService _instance = HiveService._();

  // Factory constructor to return the singleton instance
  factory HiveService() => _instance;
  registerAdapters() {
    Hive.registerAdapter(CatFactAdapter());
  }

  openBoxes() async {
    print("is box opened ${Hive.isBoxOpen("cat")}");
    await Hive.openLazyBox("cats");
  }

  insertIntoBox(item) async {
    final catsBox = Hive.box("cats");
    await catsBox.add(item);
  }
}
