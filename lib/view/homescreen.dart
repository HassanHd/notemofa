import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/controller/NoteHelper.dart';

import '../constant.dart';
import 'descriptionscreen.dart';
import 'formScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Note().db.then((value) {
      print("value$value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      appBar: AppBar(
        title: const Text(
          "ToDo",
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: Note().getdb(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return (snapshot.data.length == 0)
                  ? const Center(
                      child: Text(
                      "Your ToDo list is Empty 😒🤷‍♂️",
                      style: TextStyle(color: Colors.green),
                    ))
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                          color: Colors.transparent,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                return DescriptionScreen(
                                    id: "${snapshot.data[index].id}",
                                    description: "${snapshot.data[index].description}",
                                    title: "${snapshot.data[index].title}",
                                    date: "${snapshot.data[index].date}",
                                    done: "${snapshot.data[index].done}");
                              }));
                            },
                            title: Text(
                              "${snapshot.data[index].title}",
                              style: const TextStyle(color: textcolor),
                            ),
                            subtitle: Text(
                              "${snapshot.data[index].date}",
                              style: const TextStyle(color: textcolor),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Note()
                                    .deletedb(snapshot.data[index].id)
                                    .then((value) {
                                  setState(() {
                                    print("value$value");
                                  });
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: red,
                                size: 25,
                              ),
                            ),
                          ),
                        );
                      },
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: primarycolor,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return FormScreen();
          }));
        },
        backgroundColor: primarydarkcolor,
        child: const Icon(
          Icons.add,
          color: textcolor,
        ),
      ),
    );
  }
}
