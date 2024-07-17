import 'package:flutter/material.dart';

import '../models/notification_model.dart';

class Notifcationdata extends ChangeNotifier{
  List<ModelNotification> _notificationList = [
    ModelNotification(
        "You haven't trained in 3 hours",
        "Return Now and meet your daily word limit",
        "1 h ago",
        "Today"),
    ModelNotification(
        "You haven't trained in 1 Day",
        "Return Now and meet your daily word limit",
        "1 h ago",
        "Today"),
  ];
  List<ModelNotification> get notificationList => _notificationList;
  void addnotfication(ModelNotification not){
    notificationList.add(not);
    notifyListeners();
  }
}