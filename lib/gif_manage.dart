import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalty/reward_data.dart';

class ManageGiftsPage extends StatelessWidget {
  final TextEditingController _giftTitleController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gifts'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _giftTitleController,
              decoration: InputDecoration(
                labelText: 'Gift Code',
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
                if (_giftTitleController.text.isNotEmpty &&
                    _pointsController.text.isNotEmpty) {
                  Provider.of<RewardData>(context, listen: false)
                      .addGift(_giftTitleController.text, _pointsController.text);
                  _giftTitleController.clear();
                  _pointsController.clear();
                }
              },
              child: Text('Add Gift'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<RewardData>(
                builder: (context, rewardData, child) {
                  return ListView.builder(
                    itemCount: rewardData.gifts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Icon(Icons.card_giftcard,),
                          title: Text(rewardData.gifts[index]['title']),
                          subtitle: Text('Points: ${rewardData.gifts[index]['points']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Provider.of<RewardData>(context, listen: false)
                                  .deleteGift(index);
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
