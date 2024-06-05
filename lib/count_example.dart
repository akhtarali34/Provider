import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/count_provioder.dart';

import 'provider/count_provioder.dart';



class CountExample extends StatefulWidget {
  const CountExample({super.key});
  @override
  State<CountExample> createState() => _CountExampleState();
}


class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer){
      final countProvider = Provider.of<CounterProvider>(context, listen: false);
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    print("this widget is build");
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    print("this widget can be build");
    return Scaffold(
      appBar: AppBar(title: Text("Provider "),),
      body: Center(
        child: Consumer<CounterProvider>(builder: (context,value, child){
         return Text(value.count.toString(), style: TextStyle(fontSize: 50),);
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
