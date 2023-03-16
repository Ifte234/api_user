import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api consuming for user data'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context , index){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              height: 140,
              color: Colors.orangeAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('id : 1'),
                  Text('name : Ifte'),
                  Text('email : 1'),
                  Text('zipcode : 1'),
                  Text('geo in street : 73289472'),
                  Text('phone : 18092458'),
                  Text('website : www.google.com'),
                  Text('company name : google'),







                ],
              ),
            );
          }),
    );
  }
}
