import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nekNameController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _sexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Profilni tahrirlash",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xff0509d3),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Taxallus*",style: TextStyle(color: Colors.red,fontSize: 11.0),),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nekNameController,
                    onChanged: (newValue) {
                      final textProvider = context.read<AppProvider>();
                      textProvider.nikNameText(newValue);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          gapPadding: 5.0),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Iltimos, taxallusingizni kiriting.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Familiya*",style: TextStyle(color: Colors.red,fontSize: 11.0),),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _firstNameController,
                              onChanged: (newValue) {
                                final textProvider = context.read<AppProvider>();
                                textProvider.firstNameText(newValue);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    gapPadding: 5.0),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Iltimos, familiyangizni kiriting.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        // color: Colors.blue,
                      ),
                      SizedBox(
                        // height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Ism*",style: TextStyle(color: Colors.red,fontSize: 11.0),),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                              onChanged: (newValue) {
                                final textProvider = context.read<AppProvider>();
                                textProvider.nameText(newValue);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      gapPadding: 5.0),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Iltimos, ismingizni kiriting.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        // color: Colors.blue,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Yosh*",style: TextStyle(color: Colors.red,fontSize: 11.0),),
                            TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    gapPadding: 5.0),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Iltimos, yoshingizni kiriting.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        // color: Colors.blue,
                      ),
                      SizedBox(
                        // height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Jins*",style: TextStyle(color: Colors.red,fontSize: 11.0),),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _sexController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  gapPadding: 5.0,
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Iltimos, jinsingizni kiriting.';
                                } else if (value != 'Erkak' && value != 'Ayol') {
                                  return 'Erkak yoki Ayol ko\'rinishida kiriting.';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        // color: Colors.blue,
                      )
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24.0),
                  alignment: Alignment.center,
                  height: 48.0,
                  decoration:  BoxDecoration(
                      color: const Color(0xff0509d3),
                      borderRadius: BorderRadius.circular(16.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.save_as,color: Colors.white,),
                      const SizedBox(width: 16.0,),
                      Text("uzgarishlarni-saqlash".tr(),style: const TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
