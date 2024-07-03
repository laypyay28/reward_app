import 'package:flutter/material.dart';
import 'package:royalty/aboutapp.dart';
import 'package:royalty/main.dart';
import 'package:royalty/review.dart';
import 'package:royalty/share.dart';

class Navbar extends StatelessWidget {
  final String userName;
  final String userEmail;

  const Navbar({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child: ListView( 
        
        children: [ 
          
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(), 

            icon: Icon(Icons.arrow_back,
            color: Colors.black,),
             label: Text( "   Profile",
            style: TextStyle( fontSize: 20,
            color: Colors.black) ,),
            style: ElevatedButton.styleFrom( 
              elevation: 30,
              alignment: Alignment.topLeft
            ),
          

           ),
           Container( 
            height:150,
            child:
        
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Row(
              children: [
              Text("Email :"),
                  Text(userEmail),
                   ],
                   ),
            currentAccountPicture: CircleAvatar( 
              child: ClipOval(child: Icon(Icons.person,
              size:70,
              )),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
          ),
           ),

          ListTile( 
            leading: Icon(Icons.apps,
            color: Colors.black,),
            title: Text('About App'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RewardsHome()));
              // Handle onTap
            },
          ),
          ListTile( 
            leading: Icon(Icons.share,
            color: Colors.black,),
            title: Text('Share'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SharePage()));
              // Handle onTap
            },
          ),         

          ListTile( 
            
            leading: Icon(Icons.reviews,
            color: Colors.black,),
            title: Text('Review'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));
              // Handle onTap
            },           
          ),
          ListTile( 
            
            leading: Icon(Icons.logout,
            color: Colors.black,),
            title: Text('Log Out'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              // Handle onTap
            },                                 
          ),
    
        ],
      )

    );
  }
}
