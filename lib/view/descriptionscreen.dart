import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../constant.dart';
class DescriptionScreen extends StatefulWidget {
  var id;
  var description;
  var title;
  var date;
  var done;

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();

  DescriptionScreen({
    required this.id,
    required this.description,
    required this.title,
    required this.date,
    required this.done,
  });
}

class _DescriptionScreenState extends State<DescriptionScreen> {
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
          "Description",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.title}",
                style: TextStyle(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: 20,

              ),
              ),
              Text("${widget.date}",
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,

                ),
              ),
              Text("${widget.description}",

                style: TextStyle(
                  color:green ,
                  fontSize: 16,


                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Share.share(' ${widget.title} \n ${widget.description}');

        },
        backgroundColor: primarydarkcolor,
        child: const Icon(Icons.share,color: textcolor,),

      ),
    );
  }
}
