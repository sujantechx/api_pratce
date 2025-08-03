import 'dart:convert';

import 'package:api_pratce1/model_class/quate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quots extends StatefulWidget {
  const Quots({super.key});

  @override
  State<Quots> createState() => _QuotsState();
}

class _QuotsState extends State<Quots> {
  List <QuoteModel> quotes=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuotes();
  }

  void getQuotes() async{
     String url="https://dummyjson.com/quotes";

     http.Response res=await http.get(Uri.parse(url));

     if (res.statusCode ==200){
       dynamic mData=jsonDecode(res.body);
       quotes=QuotesDataModel.fromJson(mData).quotes;
     }
     setState(() {
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quote"),),
      body:quotes.isNotEmpty?ListView.builder(
        itemCount: quotes.length,
          itemBuilder: (context, index) =>Card(
            child: ListTile(
              leading: Text("${quotes[index].id}"),
              title: Text("${quotes[index].quote}"),
              subtitle: Text("${quotes[index].author}"),
            ),
          ),
      ): Center(
        child: Text("No Quotes yet!!"),
      ),
    );
  }
}
