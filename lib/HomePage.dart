import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/Model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> samplePost= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api consuming for user data'),
      ),
      body: FutureBuilder(

        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                  itemCount: samplePost.length,
                  itemBuilder: (context , index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.all(10),
                      height: 240,
                      color: Colors.orangeAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('id : ${samplePost[index].id}'),
                          Text('name : ${samplePost[index].name}'),
                          Text('email : ${samplePost[index].email}'),
                          Text('zipcode : ${samplePost[index].address!.zipcode}'),
                          Text('geo in address : ${samplePost[index].address?.geo}'),
                          Text('phone : ${samplePost[index].phone}'),

                          Text('website : ${samplePost[index].website}'),
                          Text('company name : ${samplePost[index].company?.name}'
                              '                                   \n '),
                        ],
                      ),
                    );
                  });
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },

      )

    );
  }
 Future<List<Model>> getData()async{
 final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
 var data = jsonDecode(response.body.toString());
 if(response.statusCode == 200){
   for(Map index in data){
     print('Response : ::::  ${response}');
print('data :::::  ${data}');
     samplePost.add(Model.fromJson(index));
     print(samplePost);
   }
   return samplePost;
 }else{
   return samplePost;
 }
  }
}
