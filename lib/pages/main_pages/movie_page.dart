import 'package:flutter/material.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:movie/widgets/translite_movie_widget.dart';
import 'package:movie/widgets/uzbek_movie_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  bool _isAppBArPinned = false;
  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  String appBarTitle="";

  List<String> imagePaths = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnQpFrqXzDv0SnR7DNqVXqfUJqrXvysg2BffU6HTXhwlrd9REDewGKhiss-X1a6t3MGqQ&usqp=CAU',
    'https://i.playboard.app/p/041c9995705e74ec8d785b91d08bfe44/default.jpg',
    'https://internationalcenter.org/wp-content/uploads/2021/12/International-Film-blog-slider.png',
  ];
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: Text(_isAppBArPinned == false ? appBarTitle="" :appBarTitle="Kino mobile",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          pinned: true,
          backgroundColor:
              _isAppBArPinned == true ? const Color(0xff0509d3) : Colors.white,
          actions: const [
            Icon(Icons.add,color: Colors.white,),
            SizedBox(
              width: 16.0,
            )
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
                      children:  [
                        Text(
                          textProvider.nikName??"",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${textProvider.firstName??""}, ${textProvider.name??""}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              FadeTransition(
                opacity: _animation,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      imagePaths[currentImageIndex],
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const UzbekMovieWidget(),
              const TransliteMovieWidget(),
              const SizedBox(height: 100.0,)
            ],
          ),
        ),
      ],
    );
  }
}
