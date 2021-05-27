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
        title: Text(widget.title),
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
