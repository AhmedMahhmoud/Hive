import 'package:redux_app/api/datasource.dart';

class CatRepo {
  final CatDataSource catDataSource;
  CatRepo({required this.catDataSource});
  getFact() async {
    return await catDataSource.getCatFact();
  }
}
