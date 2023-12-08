import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/profile_page/edir_profile_page.dart';
import 'package:movie/pages/profile_page/language_translite_page.dart';
import 'package:movie/pages/sign_up_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool _isAppBArPinned = false;
  final ScrollController _scrollController = ScrollController();

  String appBarTitle = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
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
          // title: Text(
          //   _isAppBArPinned == false
          //       ? appBarTitle = ""
          //       : appBarTitle = "Kino mobile",
          //   style: const TextStyle(
          //       color: Colors.white, fontWeight: FontWeight.bold),
          // ),
          pinned: true,
          backgroundColor: _isAppBArPinned == true
              ? const Color(0xff0509d3)
              : Colors.white,
          expandedHeight: 144.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color:  Color(0xff0509d3),
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
                          "${textProvider.firstName ?? ""}, ${textProvider
                              .name ?? ""}",
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
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       isThemBool();
          //     },
          //     icon: themBool.themBool == false
          //         ? const Icon(
          //             Icons.dark_mode_outlined,
          //             color: Colors.white,
          //           )
          //         : const Icon(
          //             Icons.light_mode_outlined,
          //             color: Colors.white,
          //           ),
          //   ),
          // ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin:
                const EdgeInsets.only(top: 64.0, left: 24.0, right: 16.0),
                // color: Colors.blue,
                width: double.infinity,
                height: 400.0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const EditProfilePage()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        color: Colors.white,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 26.0,
                              backgroundColor: Color(0xFFCBAB2E),
                              child: Icon(
                                Icons.edit,
                                size: 32.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              "profilni-tahrirlash".tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const LanguageTranslitePage()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        color: Colors.white,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 26.0,
                              backgroundColor: Color(0xff3567c5),
                              child: Icon(
                                Icons.language,
                                size: 32.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              "til-sozlamalari".tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                        final Uri url = Uri(
                          scheme: 'tel',
                          path: "+998944856603"
                        );
                        if(await canLaunchUrl(url)){
                          await launchUrl(url);
                        }else{
                          print('Xatolik');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        margin: const EdgeInsets.only(
                            left: 16.0, right: 16.0),
                        color: Colors.white,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 26.0,
                              backgroundColor: Color(0xff59c535),
                              child: Icon(
                                Icons.phone,
                                size: 32.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              "boglanish".tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 80.0,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      // color: Colors.green,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 26.0,
                            backgroundColor: Color(0xff3589c5),
                            child: Icon(
                              Icons.info,
                              size: 32.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "dastur-haqida".tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const SignUpPage()), (route) => false);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        color: Colors.white,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 26.0,
                              backgroundColor: Color(0xFFCB2E2E),
                              child: Icon(
                              Icons.logout,
                                size: 32.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text(
                              "chiqish".tr(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
