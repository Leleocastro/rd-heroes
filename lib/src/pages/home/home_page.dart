import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:rd_heroes/src/pages/home/widgets/hero_grid.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  bool _isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // carregar os produtos
    Provider.of<Heroes>(context, listen: false).loadHeroes().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _refreshHeroes(BuildContext context) {
    return Provider.of<Heroes>(context, listen: false).loadHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? Container(
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        searchController.clear();
                        _refreshHeroes(context);
                        setState(() {
                          _isSearching = !_isSearching;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: 'Pesquisar',
                  ),
                  onSubmitted: (value) {
                    if (_isSearching) {
                      Provider.of<Heroes>(context, listen: false)
                          .searchHeroes(value);
                    }
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                ),
              )
            : Text('Heróis'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Provider.of<Heroes>(context, listen: false)
                    .searchHeroes(searchController.text);
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshHeroes(context),
              child: HeroGrid(),
            ),
    );
  }
}
