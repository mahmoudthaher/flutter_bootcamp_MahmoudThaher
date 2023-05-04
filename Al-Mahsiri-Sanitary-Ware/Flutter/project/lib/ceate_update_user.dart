import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/retry.dart';
import 'package:project/Providers/city_provider.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:project/controllers/api_helper.dart';
import 'package:project/controllers/user_controller.dart';
import 'package:project/models/city_model.dart';
import 'package:project/models/user_model.dart';
import 'package:provider/provider.dart';

class CreateAndUpdateUser extends StatefulWidget {
  const CreateAndUpdateUser({super.key});

  @override
  State<CreateAndUpdateUser> createState() => _CreateAndUpdateUserState();
}

// ignore: constant_identifier_names
enum SingingCharacter { Male, Female }

class _CreateAndUpdateUserState extends State<CreateAndUpdateUser> {
  int checkemail = 0;
  int checkphoneNumber = 0;
  int checkuserName = 0;
  UserModel? user;
  int? selectedName;
  String? cityname;
  SingingCharacter? _character = SingingCharacter.Male;
  final dateController = TextEditingController();
  bool obscureText = true;
  bool obscureText2 = true;
  final _keyForm = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final dateofdateController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  late bool visible = false;

  @override
  void initState() {
    super.initState();
    var provider = Provider.of<CityProvider>(context, listen: false);
    provider.getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CityProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    List<CityModel> cities = provider.cities;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            // onChanged: () {
            //   setState(() {
            //     if (_keyForm.currentState!.validate()) {
            //       visible = true;
            //     } else {
            //       visible = false;
            //     }
            //   });
            // },
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/loginPage');
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 33,
                            color: Color(0xFF1b0f0b),
                          ),
                        ),
                      ),
                    ),
                    Text('data22'),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: firstnameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'الإسم الأول',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال الإسم الأول";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: lastnameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'الإسم الأخير',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال الإسم الأخير";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: phoneNumberController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.phone,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'رقم الهاتف',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      checkPhoneNumber();
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال رقم الهاتف";
                      } else if (checkphoneNumber == 1) {
                        return "رقم الهاتف موجود مسبقا";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.emailAddress,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'البريد الإلكتروني',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      checkEmail();
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال البريد الإلكتروني";
                      } else if (!EmailValidator.validate(value)) {
                        return "الرجاء إدخال البريد الإلكتروني بطريقة صحيحة";
                      } else if (checkemail == 1) {
                        return "الايميل موجود مسبقا";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: userNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'إسم المستخدم',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      checkUserName();
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال إسم المستخدم";
                      } else if (checkuserName == 1) {
                        return "إسم المستخدم موجود مسبقا";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: addressController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'الموقع',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال الموقع";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 0.7,
                        color: const Color(0xFF686868)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 25),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        value: selectedName,
                        hint: const Text(
                          'اختار المنطقة',
                          style: TextStyle(
                              fontSize: 20,
                              height: 2,
                              color: Color(0xFF686868)),
                        ),
                        items: cities.map((e) {
                          return DropdownMenuItem(
                            value: e.id,
                            child: Text(e.city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedName = value;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          // validate the selected option4
                          if (value == null) {
                            return 'الرجاء ادخال المدينة';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          cityname = value.toString();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 0.7,
                        color: const Color(0xFF686868)),
                  ),
                  child: Row(
                    children: [
                      SizedBox.fromSize(
                        size: const Size.fromRadius(20),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: const Text('ذكر'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: const Text('انثى'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    obscureText: !obscureText,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      hintText: 'كلمة المرور',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 30, left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال كلمة المرور";
                      } else if (value.length < 8) {
                        return "كلمة المرور يجب ان تكون مكونة من 8 خانات على الأقل";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextFormField(
                    // controller: repasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 20, height: 2),
                    keyboardType: TextInputType.name,
                    obscureText: !obscureText2,
                    cursorHeight: 50,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      hintText: 'إعادة كلمة المرور',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 30, left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      errorStyle: const TextStyle(
                        fontSize: 15.0,
                      ),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText2 = !obscureText2;
                          });
                        },
                        child: obscureText2
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إعادة إدخال كلمة المرور";
                      } else if (value != passwordController.text) {
                        return "كلمة المرور غير متطابقة";
                      }
                      return null;
                    },
                  ),
                ),
                Visibility(
                  // visible: visible,
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_keyForm.currentState!.validate()) {
                            _keyForm.currentState!.save();
                            // _character = SingingCharacter.Female; لتغير مكان الاختيار
                            //  _character!.index
                            //يمكن تزبط
                            //if address ==0 _character = SingingCharacter.Female

                            try {
                              //EasyLoading.dismiss();
                              EasyLoading.show(status: "Loading");

                              UserController()
                                  .create(userProvider.createUser(
                                      firstnameController.text,
                                      lastnameController.text,
                                      phoneNumberController.text,
                                      emailController.text,
                                      userNameController.text,
                                      addressController.text,
                                      selectedName!.toString(),
                                      (_character!.index + 1).toString(),
                                      1.toString(),
                                      passwordController.text))
                                  .then((value) {})
                                  .catchError((ex) {});
                              EasyLoading.dismiss();
                              EasyLoading.showInfo("Done");
                            } catch (error) {
                              EasyLoading.dismiss();
                              EasyLoading.showError(error.toString());
                            }
                          }
                        });
                      },
                      child: Text(
                        'Submit',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkEmail() async {
    final email = emailController.text;
    dynamic json = await ApiHelper().getRequest2("api/Users/email/$email");
    final count = json.isEmpty ? 0 : 1;
    setState(() {
      checkemail = count;
    });
  }

  Future<void> checkPhoneNumber() async {
    final phoneNumber = phoneNumberController.text;
    dynamic json =
        await ApiHelper().getRequest2("api/Users/phonenumber/$phoneNumber");
    final count = json.isEmpty ? 0 : 1;
    setState(() {
      checkphoneNumber = count;
    });
  }

  Future<void> checkUserName() async {
    final userName = userNameController.text;
    dynamic json =
        await ApiHelper().getRequest2("api/Users/username/$userName");
    final count = json.isEmpty ? 0 : 1;
    setState(() {
      checkuserName = count;
    });
  }
}
