import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todoapp/controller/NoteHelper.dart';
import 'package:todoapp/view/homescreen.dart';

import '../constant.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String? title, description;
  String dateTime = "Date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: textcolor,
            size: 27,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "ADD",
          style: TextStyle(
            color: textcolor,
            fontSize: fontLarge,
          ),
        ),
        centerTitle: true,
        backgroundColor: primarydarkcolor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(RadiusCircular),
          bottomLeft: Radius.circular(RadiusCircular),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Title",
                  labelStyle: TextStyle(color: green),
                  fillColor: primarydarkcolor,
                  labelText: "Title",
                  helperStyle: TextStyle(color: primarydarkcolor),
                  contentPadding: EdgeInsets.all(DPadding),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(DPadding)),
                      borderSide:
                          BorderSide(color: primarydarkcolor, width: 0.5)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(DPadding)),
                      borderSide:
                          BorderSide(color: primarydarkcolor, width: 0.5)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(DPadding)),
                      borderSide:
                          BorderSide(color: primarydarkcolor, width: 0.5)),
                ),
                onChanged: (val) {
                  setState(() {
                    title = val;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Date",
                    style: TextStyle(color: textcolor),
                  )),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                    maxTime: DateTime(2031, 1, 1),
                    minTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                    onChanged: (date) {
                      setState(() {
                        dateTime = "${date.year}-${date.month}-${date.day}";
                      });
                    },
                    onConfirm: (date) {
                      setState(() {
                        dateTime = "${date.year}-${date.month}-${date.day}";
                      });
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                      border: Border.all(color: primarydarkcolor, width: 0.5)),
                  child: Text(
                    "$dateTime",
                    style: TextStyle(color: textcolor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: "Enter Dicription",
                  labelStyle: TextStyle(color: green),
                  fillColor: primarydarkcolor,
                  labelText: "Dicription",
                  helperStyle: TextStyle(color: primarydarkcolor),
                  contentPadding: EdgeInsets.all(DPadding),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(DPadding)),
                      borderSide:
                          BorderSide(color: primarydarkcolor, width: 0.5)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(DPadding)),
                      borderSide:
                          BorderSide(color: primarydarkcolor, width: 0.5)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(DPadding)),
                      borderSide:
                          BorderSide(color: primarydarkcolor, width: 0.5)),
                ),
                onChanged: (val) {
                  setState(() {
                    description = val;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: primarydarkcolor),
                  onPressed: () {
                    Note().insertdb({
                      "description": description,
                      "title": title,
                      "date": dateTime,
                      "done": "0"
                    }).then((value) {
                      print("sss $value");
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: textcolor,
                    size: 18,
                  ),
                  label: const Text(
                    "ADD",
                    style: TextStyle(color: textcolor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
