import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalty/reward_data.dart';

class RoyaltyRewardPage extends StatelessWidget {
  final TextEditingController _rewardTitleController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reward'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rewardTitleController,
              decoration: InputDecoration(
                labelText: 'Reward Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.card_giftcard),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _pointsController,
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
                if (_rewardTitleController.text.isNotEmpty &&
                    _pointsController.text.isNotEmpty) {
                  Provider.of<RewardData>(context, listen: false)
                      .addReward(_rewardTitleController.text, _pointsController.text);
                  _rewardTitleController.clear();
                  _pointsController.clear();
                }
              },
              child: Text('Reward'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            
            Expanded(
              child: Consumer<RewardData>(
                builder: (context, rewardData, child) {
                  return ListView.builder(
                    itemCount: rewardData.rewards.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(rewardData.rewards[index]['title']),
                          subtitle: Text('Points: ${rewardData.rewards[index]['points']}'),
                          trailing:  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<RewardData>(context, listen: false)
                          .deleteReward(index);
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
