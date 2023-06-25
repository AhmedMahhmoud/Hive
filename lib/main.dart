import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:redux_app/api/model/cat.dart';
import 'package:redux_app/api/repo.dart';
import 'api/datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(SearchApp());
}

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchScreen(),
    );
  }
}

enum Itemfilters { all, shortLength, longLength }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CatFact? catFact;
  getCat() async {
    CatRepo catDataSource = CatRepo(catDataSource: CataDataSourceImp());
    var cat = await catDataSource.getFact();
    setState(() {
      catFact = cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Testing App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catFact == null ? const SizedBox() : Text(catFact!.fact.toString()),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    getCat();
                  },
                  child: const Center(
                    child: Text("Generate CAT fact"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
