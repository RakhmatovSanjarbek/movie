import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class LanguageTranslitePage extends StatefulWidget {
  const LanguageTranslitePage({super.key});

  @override
  State<LanguageTranslitePage> createState() => _LanguageTranslitePageState();
}

class _LanguageTranslitePageState extends State<LanguageTranslitePage> {
  int selectLans = 0;

  @override
  Widget build(BuildContext context) {
    final selectLang = context.watch<AppProvider>().selectLang;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "til-sozlamalari".tr(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0509d3),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            width: double.infinity,
            height: 240.0,
            decoration: BoxDecoration(
                color: const Color(0xfff0f2f8),
                borderRadius: BorderRadius.circular(32.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8.0,
                  ),
                ],
                border: Border.all(color: const Color(0xff9ea2a2), width: 1.0)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                            radius: 24.0,
                            backgroundImage: NetworkImage(
                                'https://tfi.uz/photos/1/photos/flag-1024x512.jpg')),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          "O'zbekcha",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AppProvider>().selectLang = 0;
                        setState(() {
                          selectLans = 0;
                        });
                      },
                      child: Container(
                        width: 28.0,
                        height: 28.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(16.0),
                            color: selectLang == 0
                                ? const Color(0xff0509d3)
                                : const Color(0xfff0f2f8)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                            radius: 24.0,
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/800px-Flag_of_Russia.svg.png?20120812011549')),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          "Русский",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AppProvider>().selectLang = 1;
                        setState(() {
                          selectLans = 1;
                        });
                      },
                      child: Container(
                        width: 28.0,
                        height: 28.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(16.0),
                            color: selectLang == 1
                                ? const Color(0xff0509d3)
                                : const Color(0xfff0f2f8)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                            radius: 24.0,
                            backgroundImage: NetworkImage(
                                'https://a.warbletoncouncil.org/science/bandera-del-reino-unido-historia-y-significado-3.webp')),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          "English",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AppProvider>().selectLang = 2;
                        setState(() {
                          selectLans = 2;
                        });
                      },
                      child: Container(
                        width: 28.0,
                        height: 28.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(16.0),
                            color: selectLang == 2
                                ? const Color(0xff0509d3)
                                : const Color(0xfff0f2f8)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              saveChanges();
            },
            child: Container(
              margin:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
              alignment: Alignment.center,
              height: 48.0,
              decoration: BoxDecoration(
                  color: const Color(0xff0509d3),
                  borderRadius: BorderRadius.circular(16.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.save_as,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "uzgarishlarni-saqlash".tr(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void saveChanges() {
    switch (selectLans) {
      case 0:
        context.locale = const Locale('uz', 'UZ');
        EasyLocalization.of(context)?.setLocale(const Locale('uz', 'UZ'));
        break;
      case 1:
        context.locale = const Locale('ru', 'RU');
        EasyLocalization.of(context)?.setLocale(const Locale('ru', 'RU'));
        break;
      case 2:
        context.locale = const Locale('en', 'EN');
        EasyLocalization.of(context)?.setLocale(const Locale('en', 'EN'));
        break;
    }
  }
}
