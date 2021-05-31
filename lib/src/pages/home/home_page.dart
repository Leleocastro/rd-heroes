import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/controllers/hero_controller.dart';
import 'package:rd_heroes/src/pages/home/widgets/hero_grid.dart';
import 'package:rd_heroes/src/utils/app_routes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  bool _isSearching = false;
  bool _isAscending = true;
  bool _isAscUsed = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<HeroesController>(context, listen: false)
        .loadHeroes()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _refreshHeroes(BuildContext context) {
    return Provider.of<HeroesController>(context, listen: false).loadHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? Container(
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
                      Provider.of<HeroesController>(context, listen: false)
                          .searchHeroes(value);
                    }
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                ),
              )
            : Text('Heroes'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _isAscUsed
                  ? Text(
                      _isAscending ? '↑' : '↓',
                      textAlign: TextAlign.end,
                    )
                  : Text(
                      'az',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 10),
                    ),
              IconButton(
                alignment: Alignment.centerLeft,
                iconSize: 20,
                icon: Icon(Icons.filter_alt),
                onPressed: () {
                  setState(() {
                    _isAscending =
                        Provider.of<HeroesController>(context, listen: false)
                            .alphabeticOrderBy(_isAscending);
                    _isAscUsed = true;
                  });
                },
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Provider.of<HeroesController>(context, listen: false)
                  .searchHeroes(searchController.text);
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          ),
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: TextButton(
                  child: Text('Male'),
                  onPressed: () {
                    Provider.of<HeroesController>(context, listen: false)
                        .searchByGenderHeroes('Male');
                  },
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  child: Text('Female'),
                  onPressed: () {
                    Provider.of<HeroesController>(context, listen: false)
                        .searchByGenderHeroes('Female');
                  },
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  child: Text('All'),
                  onPressed: () {
                    Provider.of<HeroesController>(context, listen: false)
                        .searchByGenderHeroes('');
                  },
                ),
              ),
            ],
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.all_inclusive,
        ),
        onPressed: () async {
          await _refreshHeroes(context);
          searchController.clear();
          Navigator.of(context).pushNamed(
            AppRoutes.HERO_DETAIL,
            arguments: Provider.of<HeroesController>(context, listen: false)
                .randomHero(),
          );
        },
      ),
    );
  }
}
