import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/pages/youtube_player_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/costm_all_movie_page.dart';

class AllIndeaMovies extends StatefulWidget {
  const AllIndeaMovies({super.key});

  @override
  State<AllIndeaMovies> createState() => _AllIndeaMoviesState();
}

class _AllIndeaMoviesState extends State<AllIndeaMovies> {
  List<MovieModel> ideaMovieList = [];
  LoadingStatus loadingStatus = LoadingStatus.initial;

  @override
  Widget build(BuildContext context) {
    ideaMovieList = context.watch<AppProvider>().indeaMovieList;
    loadingStatus = context.watch<AppProvider>().loadingStatus;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff0509d3),
        title: const Text(
          "Barcha hind kinolar",
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
                return context.read<AppProvider>().getIndeaMovive();
              },
              child: ListView.builder(
                  itemCount: ideaMovieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CostmMovies(
                      movieModel: ideaMovieList[index],
                      onTap: () {
                        showTouTubePage(ideaMovieList[index]);
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
