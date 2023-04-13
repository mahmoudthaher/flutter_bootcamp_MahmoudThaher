import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:project/models/crud.dart';

class CrudDateTime extends StatefulWidget {
  const CrudDateTime({super.key});

  @override
  State<CrudDateTime> createState() => _CrudDateTimeState();
}

class _CrudDateTimeState extends State<CrudDateTime> {
  final collection = FirebaseFirestore.instance.collection("crud");
  DateTime selectedDate = DateTime.now();
  final _NameTextField = TextEditingController();
  final _SelectDateTextField = TextEditingController();
  final _SelectTimeTextField = TextEditingController();
  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
  String dropdownVale = "Business";
  var items = [
    'Business',
    'Personal',
    'Urgent',
  ];
  @override
  void initState() {
    super.initState();
    //  _getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud & Drop down & Time picker'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('Name'),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _NameTextField,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(child: Text('Type')),
                  SizedBox(
                    height: 65,
                    width: 120,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2024));
                              if (pickedDate != null) {
                                setState(() {
                                  _SelectDateTextField.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                });
                              }
                            },
                            child: const Text('Select Date'))),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        controller: _SelectDateTextField,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          child: const Text('Select Time'),
                          onPressed: () async {
                            TimeOfDay? pickedDate = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              //    initialEntryMode: TimePickerEntyMode.dialOnly
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _time = pickedDate;
                                _SelectTimeTextField.text =
                                    '${_time.format(context)}';
                              });
                            }
                          },
                        )),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        controller: _SelectTimeTextField,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _handleAddUserAction();
                },
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleAddUserAction() {
    EasyLoading.show(status: "Loading");
    CRUD user = CRUD(
        Name: _NameTextField.text,
        Type: dropdownVale,
        Date: _SelectDateTextField.text,
        Time: _SelectTimeTextField.text);
    collection.add(user.toJson()).then((value) {
      EasyLoading.dismiss();
      EasyLoading.showSuccess(value.id);
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
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
