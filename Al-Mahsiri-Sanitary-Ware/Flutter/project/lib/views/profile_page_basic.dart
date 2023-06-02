// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/category_provider.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:project/views/profile_page.dart';
import 'package:project/views/reset_password_page.dart';
import 'package:provider/provider.dart';

class ProfilePageBasic extends StatefulWidget {
  const ProfilePageBasic({super.key});

  @override
  State<ProfilePageBasic> createState() => _ProfilePageBasicState();
}

class _ProfilePageBasicState extends State<ProfilePageBasic> {
  Widget _currentPage = const ProfilePageBasic();
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: _currentPage is ProfilePageBasic
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40,
                            ),
                            InkWell(
                                onTap: () async {
                                  FlutterSecureStorage storage =
                                      const FlutterSecureStorage();
                                  await storage.deleteAll();
                                  Provider.of<CategoryProvider>(context,
                                          listen: false)
                                      .name = "";
                                  userProvider.user = null;

                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/bottomnavigation",
                                  );
                                  EasyLoading.dismiss();
                                  EasyLoading.showSuccess(
                                      "تم تسجيل الخروج بنجاح");
                                },
                                child: Row(
                                  children: const [
                                    Text(
                                      'لتسجيل خروج انقر هنا',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.logout,
                                      color: Colors.black,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              backgroundColor: Colors.blue[700]),
                          onPressed: () {
                            setState(() {
                              _currentPage = ProfilePage(onBack: () {
                                setState(() {
                                  _currentPage = ProfilePageBasic();
                                });
                              });
                            });
                          },
                          child: const Text(
                            'تحديث المعلومات الشخصية',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              backgroundColor: Colors.blue[700]),
                          onPressed: () {
                            setState(() {
                              _currentPage = RestPasswordPage(
                                onBack: () {
                                  setState(() {
                                    _currentPage = ProfilePageBasic();
                                  });
                                },
                              );
                            });
                          },
                          child: const Text(
                            'تغير كلمة المرور',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : _currentPage,
      ),
    );
  }
}
