import 'package:http/http.dart' as http;
import 'package:redux_app/api/model/cat.dart';
import 'package:redux_app/api/repo.dart';

abstract class CatDataSource {
  getCatFact();
}

class CataDataSourceImp implements CatDataSource {
  @override
  getCatFact() async {
    var response = await http.get(Uri.parse("https://catfact.ninja/fact"),
        headers: {'content-type': 'application/json'});
    CatFact catFact = CatFact.fromJson(response.body);
    return catFact;
  }
}
