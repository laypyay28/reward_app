import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalty/reward_data.dart';


class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> history = Provider.of<RewardData>(context).getHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final entry = history[index];
          return ListTile(
            leading: Icon(Icons.history,),
            title: Text('${entry['action']} ${entry['type']}: ${entry['title'] ?? entry['users']}'),
            subtitle: Text('Points: ${entry['points']}'
            ),
            
          );
        },
      ),
    );
  }
}
