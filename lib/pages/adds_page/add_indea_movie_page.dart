import 'package:flutter/material.dart';
import 'package:movie/data/movie_model.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class AddIndeaMoviePage extends StatefulWidget {
  const AddIndeaMoviePage({super.key, required this.movieModel});

  final MovieModel? movieModel;

  @override
  State<AddIndeaMoviePage> createState() => _AddIndeaMoviePageState();
}

class _AddIndeaMoviePageState extends State<AddIndeaMoviePage> {
  TextEditingController movieNameController = TextEditingController();

  TextEditingController movieDescretionController = TextEditingController();

  TextEditingController videoUrlController = TextEditingController();

  TextEditingController imagUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.movieModel != null) {
      movieNameController.text = widget.movieModel?.movieName ?? "";
      movieDescretionController.text = widget.movieModel?.movieDescretion ?? "";
      videoUrlController.text = widget.movieModel?.videoUrl ?? "";
      imagUrlController.text = widget.movieModel?.imagUrl ?? "";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kino qo'shish",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff0509d3),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: null,
              controller: movieNameController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                label: const Text("Kino nomi"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: null,
              controller: movieDescretionController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                label: const Text("Kino haqida (qisqacha)"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: null,
              controller: videoUrlController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                label: const Text("Video havolasi"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: null,
              controller: imagUrlController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                label: const Text("Rasm havolasi"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (movieNameController.text.isNotEmpty &&
                  movieDescretionController.text.isNotEmpty &&
                  videoUrlController.text.isNotEmpty &&
                  imagUrlController.text.isNotEmpty) {
                await context
                    .read<AppProvider>()
                    .addIndeaMovie(
                    movieNameController.text,
                    movieDescretionController.text,
                    videoUrlController.text,
                    imagUrlController.text)
                    .then((value) => Navigator.pop(context));
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: 48.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: const Color(0xff0509d3)),
              child: const Text(
                "Saqlash",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
