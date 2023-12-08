import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/pages/youtube_player_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/costm_all_movie_page.dart';

class AllWorldMovies extends StatefulWidget {
  const AllWorldMovies({super.key});

  @override
  State<AllWorldMovies> createState() => _AllWorldMoviesState();
}

class _AllWorldMoviesState extends State<AllWorldMovies> {
  List<MovieModel> worldMovieList = [];
  LoadingStatus loadingStatus = LoadingStatus.initial;

  @override
  Widget build(BuildContext context) {
    worldMovieList = context.watch<AppProvider>().worldMovieList;
    loadingStatus = context.watch<AppProvider>().loadingStatus;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff0509d3),
        title: const Text(
          "Barcha jahon kinolar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: loadingStatus == LoadingStatus.loading
          ? Center(
        child: Lottie.asset("assets/loading.json"),
      )
          : LiquidPullToRefresh(
        backgroundColor: const Color(0xff0509d3),
        onRefresh: () {
          return context.read<AppProvider>().getWorldMovies();
        },
        child: ListView.builder(
            itemCount: worldMovieList.length,
            itemBuilder: (BuildContext context, int index) {
              return CostmMovies(
                movieModel: worldMovieList[index],
                onTap: () {
                  showTouTubePage(worldMovieList[index]);
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff0509d3),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(CupertinoIcons.house_fill,color: Colors.white,size: 24.0,),
      ),
    );
  }

  void showTouTubePage(MovieModel movieModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => YouTubePlayerScreen(
          videoUrl: movieModel.videoUrl ?? "",
          movieName: movieModel.movieName ?? "",
          movieDiscretion: movieModel.movieDescretion ?? "",
        ),
      ),
    );
  }
}

