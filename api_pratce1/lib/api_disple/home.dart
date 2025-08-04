import 'package:api_pratce1/api_disple/comment.dart';
import 'package:api_pratce1/api_disple/quots.dart';
import 'package:api_pratce1/api_disple/recipy.dart';
import 'package:api_pratce1/api_disple/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <dynamic> quotes=[];
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API pages"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Quots(),));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.pink.shade300
                      ),
                      child: Center(child: Text("Quotes",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),

                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Todo(),));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.pink.shade300
                      ),
                      child: Center(child: Text("Todo",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),

                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Comment(),));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.pink.shade300
                      ),
                      child: Center(child: Text("Comment",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),
                    ),
                  ),
                  SizedBox(height: 20,),

                ],
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecipePage(),));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.pink.shade300
                      ),
                      child: Center(child: Text("Recipes",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),

                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Todo(),));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.pink.shade300
                      ),
                      child: Center(child: Text("Todo",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),

                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Comment(),));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.pink.shade300
                      ),
                      child: Center(child: Text("Comment",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),
                    ),
                  ),
                  SizedBox(height: 20,),

                ],
              ),
            ),
          ],
        )
      ),

    );
  }
}
