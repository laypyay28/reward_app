import 'package:flutter/material.dart';

void main() {
  runApp(RewardsApp());
}

class RewardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rewards App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Merchant(),
    );
  }
}

class Merchant extends StatefulWidget {
  @override
  _RewardsHomePageState createState() => _RewardsHomePageState();
}

class _RewardsHomePageState extends State<Merchant> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Merchant'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center( 
        child:  ListView( 
        
        children: [ 
          
          
           

          ListTile( 
            leading: Icon(Icons.store,
            color: Colors.amber,),
            title: Text('City mart'),
            onTap: () {
             
            },
          ),
          ListTile( 
            leading: Icon(Icons.store,
            color: Colors.amber,),
            title: Text('1 stop'),
            onTap: () {
              
            },
          ),         

          ListTile( 
            
            leading: Icon(Icons.store,
            color: Colors.amber,),
            title: Text('Easy mart'),
            onTap: () {
              
            },           
          ),
          ListTile( 
            
            leading: Icon(Icons.store,
            color: Colors.amber,),
            title: Text('Buy and Go'),
            onTap: () {
             
            },                                 
          ),
    
        ],
      ),
      ),
    );
  }
}
