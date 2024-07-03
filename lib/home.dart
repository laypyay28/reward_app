import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalty/History.dart';
import 'package:royalty/Merchant.dart';
import 'package:royalty/Navbar.dart';
import 'package:royalty/Qr.dart';
import 'package:royalty/Reward.dart';
import 'package:royalty/gif_manage.dart';
import 'package:royalty/notification.dart';
import 'package:royalty/reward_data.dart';
import 'package:royalty/royalty.dart';
import 'package:royalty/support.dart';

class MainPage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const MainPage({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    HomePage(),
    QRpage(),
    supportpage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            iconSize: 40,
            color: Colors.white70,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications')),
              );
            },
          ),
        ],
        centerTitle: true,
        title: Text("Royalty Rewards"),
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
        child: Navbar(userName: widget.userName, userEmail: widget.userEmail), // Pass user info to Navbar
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "QR",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: "Support",
          ),
        ],
      ),
      body: pages[currentPage],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 2200,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Make button transparent
              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent), // Make overlay color transparent
              elevation: MaterialStateProperty.all<double>(0), // Remove elevation
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent), // Make shadow color transparent
               // Make text color transparent
            ),
               
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total Points',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    SizedBox(height: 6),
                    Consumer<RewardData>(
                      builder: (context, rewardData, child) {
                        
                        int totalPoints = 0;
                        for (var user in rewardData.users) {
      
                            int points = int.parse(user['points']);
      
      
                            if (points > 0) {
                               totalPoints += points;
                                    }
                                        }
                                
                        for (var rewards in rewardData.rewards) {
                          totalPoints -= int.parse(rewards['points']);
                        }
                         if (totalPoints < 0) {
                           return Text('Error: Reward points exceed total points.');
    }
                        for (var gifts in rewardData.gifts) {
                          int points = int.parse(gifts['points']);
      
      
                            if (points > 0) {
                               totalPoints += points;
                                    }
                          
                        }     
                        return Text(
                          '$totalPoints',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            MaterialButton(
              minWidth: 130,
              height: 50,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "History",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RoyaltyPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Text color
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.card_membership,
                              color: Colors.amber,
                              size: 35,
                            ),
                            SizedBox(height: 1),
                            Text(
                              'Program',
                              style: TextStyle(fontSize: 15, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 120,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RoyaltyRewardPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Text color
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.emoji_events,
                              color: Colors.amber,
                              size: 35,
                            ), // Icon
                            SizedBox(height: 3), // Add space between icon and text
                            Text(
                              'Rewards',
                              style: TextStyle(fontSize: 15, color: Colors.amber),
                            ), // Text
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 25),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Merchant()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Text color
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.amber,
                              size: 35,
                            ), // Icon
                            SizedBox(height: 3), // Add space between icon and text
                            Text(
                              'Merchant',
                              style: TextStyle(fontSize: 15, color: Colors.amber),
                            ), // Text
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 120,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageGiftsPage()));
                        },
                        style: ElevatedButton.styleFrom(
                           // Text color
                          elevation: 5, // Elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // BorderRadius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.card_giftcard,
                              color: Colors.amber,
                              size: 35,
                            ), // Icon
                            SizedBox(height: 3), // Add space between icon and text
                            Text(
                              'Gift',
                              style: TextStyle(fontSize: 15, color: Colors.amber),
                            ), // Text
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
