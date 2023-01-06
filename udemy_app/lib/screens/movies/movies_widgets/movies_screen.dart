import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/providers/movies_provider.dart';
import 'package:udemy_app/screens/movies/search_delegate.dart';
import 'package:udemy_app/widgets/custom_drawer.dart';
import 'card_swiper.dart';
import 'movies_sliders.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final moviesPopularProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.searchengin),
              onPressed: (() => showSearch(
                  context: context, delegate: MovieSearchDelegate())),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
 decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.2,
                        0.5,
                        10
                      ],
                      colors: [
                         (Color(0xff2169A3)),
                       (Color(0xff9cd3d8)),
                       (Color(0xfff2f2f2)),
                      ]),
                 
                ),

            child: Column(
              children: [
                const SizedBox(height: 20,),
                CardSwiper(
                  movies: moviesProvider.onDisplayMovies,
                ),
                 const SizedBox(height: 30,), 
                MoviesSliders(
                  movies: moviesPopularProvider.popularMovies,
                  title: 'Populares',
                  onNextPage: () => moviesProvider.getPopularMovies(),
                ),
              ],
            ),
          ),
        ));
  }
}
