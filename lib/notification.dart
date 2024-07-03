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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<String> notifications = [
    "New rewards added! Check them out now.",
    "Your friend just redeemed a reward. Start earning points!",
    "Exclusive offer: Double points for the next 24 hours.",
    "Don't forget to redeem your points before they expire!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
         leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
         backgroundColor: Colors.amber,
      ),
      
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              notifications[index],
              style: TextStyle(fontSize: 18),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(Icons.notifications, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
