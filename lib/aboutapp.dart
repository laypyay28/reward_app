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
      home: RewardsHome(),
    );
  }
}

class RewardsHome extends StatefulWidget {
  @override
  _RewardsHomePageState createState() => _RewardsHomePageState();
}

class _RewardsHomePageState extends State<RewardsHome> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About app'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child:         
            Container(
              width: 120,
              height: 80,
              child: ElevatedButton(                
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => VersionPage()));          
                 
                },
                style:                 
                 ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Text color
              elevation: 5, // Elevation
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), 
                // BorderRadius
              ),
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 30),              
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.info_outline,
                color: Colors.amber,
                size: 35,),
                SizedBox(height: 3),
                Text('Version',
                style: TextStyle(fontSize: 15,
                color: Colors.amber),), 
              ],
            ),                  
          ),
        ),
        
        ),
      
    );
  }
}

class VersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rewards App Version 1.0.0',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
