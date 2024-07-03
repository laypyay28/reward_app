import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SharePage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loyalty App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Loyalty App is a user-friendly mobile application designed to reward loyal customers. Our app makes it easy for businesses to manage loyalty programs and for customers to earn and redeem points. With Loyalty App, you can track your rewards, receive special offers, and enjoy exclusive benefits tailored just for you.',
            ),
            SizedBox(height: 20),
            Text(
              'Sharing Feature',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The sharing feature in Loyalty App allows users to effortlessly share their unique referral link with friends and family. By inviting others to join, users can earn additional rewards and help their network discover the benefits of Loyalty App. Simply enter the text you want to share, and with a quick tap of the "Share Link" button, your link is copied to the clipboard, ready to be shared through your favorite messaging app or social media platform.',
            ),
            SizedBox(height: 20),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter text to share',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {                
                final textToCopy = textController.text;
                if (textToCopy.isNotEmpty) {
                  Clipboard.setData(ClipboardData(text: textToCopy));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Link copied to clipboard')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              icon: Icon(Icons.share),
              label: Text('Share Link'),
            ),
          ],
        ),
      ),
    );
  }
}
