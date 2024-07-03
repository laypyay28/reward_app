import 'package:flutter/material.dart';

class RewardData with ChangeNotifier {
  List<Map<String, dynamic>> rewards = [];
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> gifts = [];
  List<Map<String, dynamic>> history = [];
  int totalPoints = 0;

  // Add a reward to the rewards list
  void addReward(String title, String points) {
    if (title.isNotEmpty && points.isNotEmpty) {
      rewards.add({'title': title, 'points': points});
      _addToHistory(title, points, 'Reward', 'added');
      notifyListeners();
    }
  }

  // Add a user to the users list
  void addUser(String userName, String points) {
    if (userName.isNotEmpty && points.isNotEmpty) {
      users.add({'userName': userName, 'points': points});
      _addToHistory(userName, points, 'Royalty', 'added');
      notifyListeners();
    }
  }




  // Add a gift to the gifts list
  void addGift(String title, String points) {
    if (title.isNotEmpty && points.isNotEmpty) {
      gifts.add({'title': title, 'points': points});
      _addToHistory(title, points, 'Gift', 'added');
      notifyListeners();
    }
  }

  // Delete a reward from the rewards list
  void deleteReward(int index) {
    if (index >= 0 && index < rewards.length) {
      var deletedReward = rewards.removeAt(index);
      _addToHistory(deletedReward['title'], deletedReward['points'], 'Reward', 'deleted');
      notifyListeners();
    }
  }

  // Delete a user from the users list
  void deleteUser(int index) {
    if (index >= 0 && index < users.length) {
      var deletedUser = users.removeAt(index);
      _addToHistory(deletedUser['userName'], deletedUser['points'], 'Royalty', 'deleted');
      notifyListeners();
    }
  }

  // Delete a gift from the gifts list
  void deleteGift(int index) {
    if (index >= 0 && index < gifts.length) {
      var deletedGift = gifts.removeAt(index);
      _addToHistory(deletedGift['title'], deletedGift['points'], 'Gift', 'deleted');
      notifyListeners();
    }
  }

  // Claim a reward if enough points are available
  void claimReward(int index) {
    if (index >= 0 && index < rewards.length) {
      int points = int.parse(rewards[index]['points']);
      if (totalPoints >= points) {
        totalPoints -= points;
        _addToHistory(rewards[index]['title'], '-$points', 'Reward', 'claimed');
        rewards.removeAt(index);
        notifyListeners();
      }
    }
  }

  // Add an entry to the history list
  void _addToHistory(String title, String points, String type, String action) {
    history.add({
      'title': title,
      'points': points,
      'type': type,
      'action': action,
    });
  }

  // Get the history of actions
  List<Map<String, dynamic>> getHistory() {
    return history;
  }
}
