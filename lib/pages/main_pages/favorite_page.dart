import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final boolProvider = context.watch<AppProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saqlanganlar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xff0509d3),
        actions: const [
          Icon(Icons.search,color: Colors.white,size: 24.0,),
          SizedBox(width: 16.0,)
        ],
      ),
      body: boolProvider.isSaveUzbek == false
          ? Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16.0),
              child: Lottie.asset('assets/empty.json'),
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  height: 120.0,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          "https://i.ytimg.com/vi/YVzms2PDeoM/maxresdefault.jpg",
                          width: 160.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "Shoqol",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Shoqol (o'zbek film)",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xffb0b0b0),
                                fontWeight: FontWeight.w500),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          isSaveUzbek();
                        },
                        icon: boolProvider.isSaveUzbek == false
                            ? const Icon(Icons.favorite_border)
                            : const Icon(
                                Icons.favorite,
                                color: Color(0xffea0707),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void isSaveUzbek() {
    context.read<AppProvider>().isSaveUzbekBool(context);
  }
}
