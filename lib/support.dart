import "package:flutter/material.dart";

class supportpage extends StatelessWidget{ 
  const supportpage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar( 
          centerTitle: true,
          
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to Support',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'If you have any questions or need assistance, please feel free to contact us:',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('laypyay17931@gmail.com'),
              onTap: () {
                // Implement email functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+9740989018'),
              onTap: () {
                // Implement phone functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Sanchaung , Yangon'),
              onTap: () {
                // Implement map functionality
              },
            ),
          ],
        ),
      ),
    );
    
}
}