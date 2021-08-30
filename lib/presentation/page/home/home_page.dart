import 'package:flutter/material.dart';
import 'package:movie_info/presentation/page/movie/trending/movie_trending_page.dart';
import 'package:movie_info/presentation/page/person/person_list_page.dart';
import 'package:movie_info/presentation/page/tv/tv_list_page.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 3 / 4,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Icon(Icons.movie)),
            ListTile(
              title: Text('My List'),
            ),
          ],
        ),
      ),
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabController.index,
          onTap: (index) {
            // tabController.animateTo(index);
            tabController.index = index;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
          ]),
      body: TabBarView(
        controller: tabController,
        children: [
          MovieTrendingPage(),
          TVListPage(),
          PersonListPage(),
        ],
      ),
    );
  }
}
