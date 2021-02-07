import 'package:detayli_film/Aksiyon.dart';
import 'package:detayli_film/Fantastik.dart';
import 'package:detayli_film/Korku.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var turler= ["korku","aksiyon","fantastik"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(

        itemCount: turler.length,
        itemBuilder: (context,index){

          return SizedBox(
            height: 80,
            child: GestureDetector(
              onTap: (){
                if(turler[index]== "korku"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Korku() ));
                }
                if(turler[index]=="aksiyon"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Aksiyon() ));
                }
                if(turler[index]=="fantastik"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Fantastik() ));
                }
              },
              child: Card(
                elevation: 10,
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(turler[index],style: TextStyle(color: Colors.blue,fontSize: 25),),
                  ],
                ),

              ),
            ),
          );
        },
      )

    );
  }
}
