import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:project/Providers/city_provider.dart';
import 'package:project/models/city_model.dart';
import 'package:provider/provider.dart';

class CreateAndUpdateUser extends StatefulWidget {
  const CreateAndUpdateUser({super.key});

  @override
  State<CreateAndUpdateUser> createState() => _CreateAndUpdateUserState();
}

// ignore: constant_identifier_names
enum SingingCharacter { Male, Female }

class _CreateAndUpdateUserState extends State<CreateAndUpdateUser> {
  int? selectedName;
  SingingCharacter? _character = SingingCharacter.Male;
  final dateController = TextEditingController();
  String dropdownVale = "Jordan";
  var items = [
    'عمان',
    'الزرقاء',
    'المفرق',
    'عجلون',
    'جرش',
    'مادبا',
    'عجلون',
    'جرش',
    'مادبا',
  ];
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
  String? drop;
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<CityProvider>(context, listen: false);
    provider.getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CityProvider>(context);
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
                    controller: emailController,
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
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال رقم الهاتف";
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
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال البريد الإلكتروني";
                      } else if (!EmailValidator.validate(value)) {
                        return "الرجاء إدخال البريد الإلكتروني بطريقة صحيحة";
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
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال إسم المستخدم";
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 0.7,
                        color: const Color(0xFF686868)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
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
                            child: Text(e.city),
                            value: e.id,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedName = value;
                            if (value != null) {
                              drop = "m";
                            }
                          });
                        }),
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
                          if (_keyForm.currentState!.validate()) {}
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

  void dropdownCallback(String? selectValue) {
    if (selectValue is String) {
      setState(
        () {
          dropdownVale = selectValue;
        },
      );
    }
  }
}
