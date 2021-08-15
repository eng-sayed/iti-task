import 'package:flutter/material.dart';
import 'package:iti_flutter_task_http/model/model_post.dart';
import 'package:iti_flutter_task_http/services/services_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<Posts> posts = [];

getData()async{

posts = await ServicesPost().getAllPots() ;
setState(() {

});

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context,i){
              return posts.length==0?Center(
                child: Text('No Data' ,textScaleFactor: 3,
                style: TextStyle(
                  fontSize: 20,

                ),),
              ): Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  ${posts[i].id}-${posts[i].title}',
                        style: TextStyle(
                            fontSize: 21,
                          fontWeight: FontWeight.bold
                        ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(posts[i].body,textScaleFactor: 1.1,
                          style: TextStyle(
                              //fontSize: 20
                          )),
                    ),
                    SizedBox(child: Divider(
                      thickness: .9,
                    ),)
                  ],
                ),
              );
            },
          ),


        ),
      ),

    );
  }
}
