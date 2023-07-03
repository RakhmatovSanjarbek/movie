import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie/pages/main_pages/home_page.dart';
import 'package:movie/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nekNameController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _sexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Lottie.asset('assets/sign_up.json'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ro'yxatdan o'tish",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0509d3),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
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
                      label: const Text("Taxallus"),
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
                        height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
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
                              hintText: "Familiya"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Iltimos, familiyangizni kiriting.';
                            }
                            return null;
                          },
                        ),
                        // color: Colors.blue,
                      ),
                      SizedBox(
                        height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
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
                              hintText: "Ism"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Iltimos, ismingizni kiriting.';
                            }
                            return null;
                          },
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
                        height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                gapPadding: 5.0),
                            label: const Text("Yoshi"),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Iltimos, yoshingizni kiriting.';
                            }
                            return null;
                          },
                        ),
                        // color: Colors.blue,
                      ),
                      SizedBox(
                        height: 64.0,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _sexController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  gapPadding: 5.0),
                              hintText: "Jinsi(Erkak yoki Ayol)"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Iltimos, jinsingizni kiriting.';
                            }
                            // if(value!="Erkak"||value!="Ayol"){
                            //   return '"Erkak" yoki "Ayol" ko\'rinishida kiriting';
                            // }
                            return null;
                          },
                        ),
                        // color: Colors.blue,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const Color(0xff20d305);
                        }
                        return const Color(0xff0509d3);
                      })),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MyHomePage()),
                              (route) => false);
                        }
                      },
                      child: const Text(
                        "Kirish",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
