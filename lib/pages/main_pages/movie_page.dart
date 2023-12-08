import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/function/show_movie_function.dart';
import 'package:movie/pages/adds_page/add_docs_page.dart';
import 'package:movie/pages/all_movies_page/all_indea_movies.dart';
import 'package:movie/pages/all_movies_page/all_translation_movies.dart';
import 'package:movie/pages/all_movies_page/all_world_movies.dart';
import 'package:movie/pages/youtube_player_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:movie/widgets/costm_banner_widget.dart';
import 'package:movie/widgets/costm_movi_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:movie/pages/all_movies_page/All_uzbek_movies.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  ShowMovieFunction showMovieFunction = ShowMovieFunction();
  List<MovieModel> bannerMovieList = [];
  List<MovieModel> uzbekMovieList = [];
  List<MovieModel> translatoinMovieList = [];
  List<MovieModel> worldMovieList = [];
  List<MovieModel> indeaMovieList = [];
  LoadingStatus loadingStatus = LoadingStatus.initial;
  bool _isAppBArPinned = false;
  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  String appBarTitle = "";

  List<String> imagePaths = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnQpFrqXzDv0SnR7DNqVXqfUJqrXvysg2BffU6HTXhwlrd9REDewGKhiss-X1a6t3MGqQ&usqp=CAU',
    'https://i.playboard.app/p/041c9995705e74ec8d785b91d08bfe44/default.jpg',
    'https://internationalcenter.org/wp-content/uploads/2021/12/International-Film-blog-slider.png',
  ];
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<AppProvider>().getBannerMovies();
        context.read<AppProvider>().getUzbekAllMovies();
        context.read<AppProvider>().getTranslationMovive();
        context.read<AppProvider>().getWorldMovies();
        context.read<AppProvider>().getIndeaMovive();
      },
    );
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
          _animationController.reset();
          _animationController.forward();
        });
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isAppBArPinned = _scrollController.hasClients &&
          _scrollController.offset >= (144.0 - 2 * kToolbarHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textProvider = context.watch<AppProvider>();
    bannerMovieList = context.watch<AppProvider>().bannerMovieList;
    uzbekMovieList = context.watch<AppProvider>().uzbekMovieList;
    translatoinMovieList = context.watch<AppProvider>().translationMovieList;
    worldMovieList = context.watch<AppProvider>().worldMovieList;
    indeaMovieList = context.watch<AppProvider>().indeaMovieList;
    loadingStatus = context.watch<AppProvider>().loadingStatus;
    return LiquidPullToRefresh(
      backgroundColor: const Color(0xff0509d3),
      onRefresh: () {
        return context.read<AppProvider>().getUzbekAllMovies();
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text(
              _isAppBArPinned == false
                  ? appBarTitle = ""
                  : appBarTitle = "kino-mobile".tr(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            pinned: true,
            backgroundColor: _isAppBArPinned == true
                ? const Color(0xff0509d3)
                : Colors.white,
            actions: [
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AddDocsPage()));
                },
                icon: const Icon(Icons.add),
              ),
            ],
            expandedHeight: 144.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.only(left: 16.0),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Color(0xff0509d3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(88.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 56.0,
                        animation: true,
                        animationDuration: 5000,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 8.0,
                        percent: 0.6,
                        center: const CircleAvatar(
                          radius: 48.0,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAIio9v_wHT4NoqVcxtEZhyOR4GaT9E9DB8JqBDzG9P4Jfq6F6TfDmKy6fganq44PMg-E&usqp=CAU"),
                        ),
                        backgroundColor: const Color(0x91bebbbb),
                        progressColor: const Color(0xdd6904bd),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textProvider.nikName ?? "",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${textProvider.firstName ?? ""}  ${textProvider.name ?? ""}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  // color: Colors.blue,
                  width: double.infinity,
                  height: 192.0,
                  child: loadingStatus == LoadingStatus.loading
                      ? Center(
                          child: Lottie.asset("assets/loading.json"),
                        )
                      : ListView.builder(
                          itemCount: bannerMovieList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CostmBannerWidget(
                              movieModel: bannerMovieList[index],
                              onTap: () {
                                showYouTubePage(bannerMovieList[index]);
                              },
                              onLongPress: () {
                                showMovieFunction.showBannerInfo(
                                    bannerMovieList[index], context);
                              },
                            );
                          },
                        ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "uzbek-kinolar".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // showAllMoviePage(movieModel);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllUzbekMovies()));
                        },
                        child: Text(
                          "barchasi".tr(),
                          style: const TextStyle(
                            color: Color(0xff0509d3),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 192.0,
                  // color: Colors.blue,
                  child: loadingStatus == LoadingStatus.loading
                      ? Center(
                          child: Lottie.asset("assets/loading.json"),
                        )
                      : ListView.builder(
                          itemCount: uzbekMovieList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CostmMovieWidget(
                              movieModel: uzbekMovieList[index],
                              onTap: () {
                                showYouTubePage(uzbekMovieList[index]);
                              },
                              onLongPress: () {
                                showMovieFunction.showUzbekInfo(
                                    uzbekMovieList[index], context);
                              },
                            );
                          },
                        ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "tarjima-kinolar".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // showAllMoviePage(movieModel);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllTranslationMovie()));
                        },
                        child: Text(
                          "barchasi".tr(),
                          style: const TextStyle(
                            color: Color(0xff0509d3),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 192.0,
                  // color: Colors.blue,
                  child: loadingStatus == LoadingStatus.loading
                      ? Center(
                          child: Lottie.asset("assets/loading.json"),
                        )
                      : ListView.builder(
                          itemCount: translatoinMovieList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CostmMovieWidget(
                              movieModel: translatoinMovieList[index],
                              onTap: () {
                                showYouTubePage(translatoinMovieList[index]);
                              },
                              onLongPress: () {
                                showMovieFunction.showTranslationInfo(
                                    translatoinMovieList[index], context);
                              },
                            );
                          },
                        ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "jahon-kinolari".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // showAllMoviePage(movieModel);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllWorldMovies()));
                        },
                        child: Text(
                          "barchasi".tr(),
                          style: const TextStyle(
                            color: Color(0xff0509d3),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 192.0,
                  // color: Colors.blue,
                  child: loadingStatus == LoadingStatus.loading
                      ? Center(
                          child: Lottie.asset("assets/loading.json"),
                        )
                      : ListView.builder(
                          itemCount: worldMovieList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CostmMovieWidget(
                              movieModel: worldMovieList[index],
                              onTap: () {
                                showYouTubePage(worldMovieList[index]);
                              },
                              onLongPress: () {
                                showMovieFunction.showWorldInfo(
                                    worldMovieList[index], context);
                              },
                            );
                          },
                        ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "hind-kinolari".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // showAllMoviePage(movieModel);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllIndeaMovies()));
                        },
                        child: Text(
                          "barchasi".tr(),
                          style: const TextStyle(
                            color: Color(0xff0509d3),
                            fontSize: 16.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 192.0,
                  // color: Colors.blue,
                  child: loadingStatus == LoadingStatus.loading
                      ? Center(
                          child: Lottie.asset("assets/loading.json"),
                        )
                      : ListView.builder(
                          itemCount: indeaMovieList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CostmMovieWidget(
                              movieModel: indeaMovieList[index],
                              onTap: () {
                                showYouTubePage(indeaMovieList[index]);
                              },
                              onLongPress: () {
                                showMovieFunction.showIndeadInfo(
                                    indeaMovieList[index], context);
                              },
                            );
                          },
                        ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showYouTubePage(MovieModel movieModel) {
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
