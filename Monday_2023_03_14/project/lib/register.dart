import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

class regiter_page extends StatefulWidget {
  const regiter_page({super.key});

  @override
  State<regiter_page> createState() => _regiter_pageState();
}

enum SingingCharacter { Male, Female }

class _regiter_pageState extends State<regiter_page> {
  SingingCharacter? _character = SingingCharacter.Male;
  final dateController = TextEditingController();
  String dropdownVale = "Jordan";
  var items = [
    'Jordan',
    'Palestine',
    'Iraq',
  ];
  bool obscureText = true;
  final _keyForm = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final dateofdateController = TextEditingController();
  final passwordController = TextEditingController();
  late bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Regiter Page',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Form(
              key: _keyForm,
              onChanged: () {
                setState(() {
                  if (_keyForm.currentState!.validate()) {
                    visible = true;
                  } else {
                    visible = false;
                  }
                });
              },
              child: Column(
                children: [
                  TextFormField(
                    controller: fullnameController,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        visible = false;
                        return "Please enter an Full Name";
                      }
                      visible = true;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an Email Address";
                      } else if (!EmailValidator.validate(value)) {
                        return "Please enter the Valid Email Address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 65,
                    child: InputDecorator(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropdownVale,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: dropdownCallback,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text('Male'),
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
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Female'),
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
                  TextFormField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Date of Birth',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an Date of Birth";
                      }
                      return null;
                    },
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an Password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: visible,
                    child: Container(
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void dropdownCallback(String? selectValue) {
    if (selectValue is String) {
      setState(() {
        dropdownVale = selectValue;
      });
    }
  }
}
