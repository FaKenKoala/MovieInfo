import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_info/application/bloc/movie/list/movie_home_bloc.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/infrastructure/util/color_util.dart';
import 'package:movie_info/presentation/page/movie/home/movie_home_page.dart';
import 'package:movie_info/presentation/page/person/person_list_page.dart';
import 'package:movie_info/presentation/page/search/search_page.dart';
import 'package:movie_info/presentation/page/tv/tv_list_page.dart';
import 'package:collection/collection.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

const movieOption = [
  'Trending',
  'Popular',
  'Now Playing',
  'Upcoming',
  'Top Rated'
];
const tvOption = [
  'Trending',
  'Popular',
  'Airing Today',
  'On The Air',
  'Top Rated'
];
const personOption = ['Trending', 'Popular'];

class _AppHomePageState extends State<AppHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final titles = ['Movie', 'TV', 'People', 'Search'];

  late List<List<String>> options;
  late List<int> selectOption;

  List<BlocBase> blocs = [];
  @override
  void initState() {
    super.initState();
    options = [movieOption, tvOption, personOption, []];
    selectOption = List.generate(options.length, (index) => 0);
    tabController = TabController(length: titles.length, vsync: this)
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MovieHomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<MovieHomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<MovieHomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<MovieHomeBloc>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          drawer: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 3 / 4,
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: ColorUtil.TertiaryColor,
                    ),
                    child: Icon(Icons.movie)),
                ListTile(
                  title: Text('My List'),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'by ',
                        style: TextStyle(
                          color: ColorUtil.PrimaryColor,
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(
                        'assets/images/tmdb_long_logo.png',
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Material(
            color: ColorUtil.PrimaryColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: TabBar(controller: tabController, tabs: [
                Tab(icon: Icon(Icons.movie)),
                Tab(icon: Icon(Icons.tv)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.search)),
              ]),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: PopupMenuButton<int>(
              offset: Offset(-20, 40),
              onSelected: (index) {
                if (selectOption[tabController.index] == index) {
                  return;
                }

                setState(() {
                  selectOption[tabController.index] = index;
                });
                if (tabController.index == 0) {
                  context
                      .read<MovieHomeBloc>()
                      .add(MovieHomeEvent.index(pos: index));
                }
              },
              itemBuilder: (_) {
                return options[tabController.index]
                    .mapIndexed((index, e) => PopupMenuItem<int>(
                        value: index,
                        child: Row(
                          children: [
                            Opacity(
                                opacity: selectedOption == index ? 1 : 0,
                                child: Icon(
                                  Icons.check,
                                  color: ColorUtil.PrimaryColor,
                                )),
                            SizedBox(width: 5),
                            Text('$e'),
                          ],
                        )))
                    .toList();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${titles[tabController.index]}'),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              MovieHomePage(),
              TVListPage(),
              PersonListPage(),
              SearchPage(),
            ],
          ),
        );
      }),
    );
  }

  get selectedOption => selectOption[tabController.index];
}