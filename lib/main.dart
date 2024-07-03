
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalty/History.dart';
import 'package:royalty/Reward.dart';
import 'package:royalty/gif_manage.dart';
import 'package:royalty/login.dart';
import 'package:royalty/reward_data.dart';
import 'package:royalty/royalty.dart';
import 'package:royalty/signup.dart';
// ignore: depend_on_referenced_packages



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RewardData()),
      ],
      child: MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

      title: 'Login and Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/royalty': (context) => RoyaltyPage(),
        '/reward': (context) => RoyaltyRewardPage(),
        '/gifts': (context) => ManageGiftsPage(),
        '/history': (context) => HistoryPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea( 
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding:EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[ 
            
            Container(

              height: MediaQuery.of(context).size.height /3,
              decoration: const BoxDecoration( 
                image:DecorationImage( 
                  image: AssetImage("images/laypyay.png")
                )
              ),
            ),
            SizedBox(height: 170,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                MaterialButton(
                  minWidth:  double.infinity,
                  height: 60,
                  onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> loginpage()));
                  },
                  shape: RoundedRectangleBorder( 
                    side:BorderSide( 
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text( 
                    "Login",
                    style: TextStyle( 
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )
                  ),

                )
              ],
            ),
            

            Column(
              children: <Widget>[ 
                MaterialButton(
                  minWidth:  double.infinity,
                  height: 60,
                  onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                  },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder( 
                    side:BorderSide( 
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text( 
                    "Sign up",
                    style: TextStyle( 
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )
                  ),

                )
              ],
            ),
            


          ],
        ),
      ),

      
    ),
   
  );
}
}
