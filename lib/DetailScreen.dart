import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';
import 'main.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.model}) : super(key: key);

  final Model model;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late  AnimationController rotationController;
  @override
  void initState() {

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    final curvedAnimation = CurvedAnimation(
      parent: rotationController,
      curve: Curves.fastOutSlowIn,
    );
    rotationController.repeat();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300.withOpacity(
                          (Provider.of<ThemeProvider>(context).isDrak) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      widget.model.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ),
                SizedBox(height: 15),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
                  child: Center(
                    child: Container(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          widget.model.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 120,right: 120),
                  padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300.withOpacity(
                          (Provider.of<ThemeProvider>(context).isDrak) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                  child: Row(
                    children: [
                      Text('Position:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                      SizedBox(width: 8,),
                      Text(widget.model.position,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                    ],
                  )
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.only(left: 115,right: 115),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300.withOpacity(
                          (Provider.of<ThemeProvider>(context).isDrak) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('Velocity:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                        SizedBox(width: 6,),
                        Text(widget.model.velocity,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                      ],
                    )
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.only(left: 110,right: 110),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300.withOpacity(
                          (Provider.of<ThemeProvider>(context).isDrak) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('Distance:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                        SizedBox(width: 8,),
                        Text(widget.model.distance,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                      ],
                    )
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300.withOpacity(
                          (Provider.of<ThemeProvider>(context).isDrak) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Text(widget.model.description),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}