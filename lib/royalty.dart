import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalty/reward_data.dart';

class RoyaltyPage extends StatefulWidget {
  @override
  _RoyaltyPageState createState() => _RoyaltyPageState();
}

class _RoyaltyPageState extends State<RoyaltyPage> {
  final TextEditingController pointsController = TextEditingController();

  final List<String> userNames = [
    'City Mart',
    'One Stop Mart',
    'G & G',
    'Easy Mart'
  ];
  String selectedUserName = 'City Mart'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Royalty Program'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: selectedUserName,
              decoration: InputDecoration(
                labelText: 'Merchant Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.store_mall_directory),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    selectedUserName = newValue;
                  }
                });
              },
              items: userNames.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: pointsController,
              decoration: InputDecoration(
                labelText: 'Points',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.star),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String points = pointsController.text;
                if (points.isNotEmpty) {
                  Provider.of<RewardData>(context, listen: false).addUser(selectedUserName, points);
                  pointsController.clear();
                } else {
                  print("Points field is empty");
                }
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<RewardData>(
  builder: (context, rewardData, child) {
    return ListView.builder(
      itemCount: rewardData.users.length,
      itemBuilder: (context, index) {
        // Provide default values or handle nulls
        final user = rewardData.users[index]['userName'] ?? 'Unknown User';
        final points = rewardData.users[index]['points'] ?? '0';

        return Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(user),
            subtitle: Text('Points: $points'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<RewardData>(context, listen: false).deleteUser(index);
              },
            ),
          ),
        );
      },
    );
  },
),

            ),
          ],
        ),
      ),
    );
  }
}
