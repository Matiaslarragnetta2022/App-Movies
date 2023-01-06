import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: ((context, index, realIndex) =>
          MoviePosterImage(movie: movies[index])),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );

    // return SizedBox(
    //   width: double.infinity,
    //   height: size.height * 0.5,
    //   child: Swiper(
    //     itemCount: movies.length,
    //     layout: SwiperLayout.STACK,
    //     itemWidth: size.width * 0.6,
    //     itemHeight: size.height * 0.4,
    //     itemBuilder: (_, int index) {
    //       final movie = movies[index];
    //       // print(movie.fullPosterImg);
    //       return GestureDetector(
    //         onTap: (() => Navigator.pushNamed(context, 'details-screen',
    //             arguments: movie)),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(20),
    //           child: MoviePosterImage(movie: movie),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

class MoviePosterImage extends StatelessWidget {
  const MoviePosterImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'swiper-${movie.id}';
    return GestureDetector(
      onTap: (() =>
          Navigator.pushNamed(context, '/details-screen', arguments: movie)),
      child: Hero(
        tag: movie.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            // image: NetworkImage(movie.fullPosterImg),
            image: NetworkImage(movie.fullBackdropPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
