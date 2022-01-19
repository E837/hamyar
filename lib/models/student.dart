import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:hamyar/models/group_roll_call.dart';
import 'package:hamyar/models/roll_call.dart';
import 'package:hamyar/models/tuition.dart';

class Student with ChangeNotifier {
  String id = const Uuid().v1();
  Map<String, String> phone;
  String name;
  DateTime joinDate;
  List<RollCall> presenceStatus = [];
  List<Tuition> paymentsStatus = [];
  List<GroupRollCall> groupsStatus = [];
  String? avatar; // todo: should be in file format

  Student({
    required this.phone,
    required this.name,
    required this.joinDate,
    this.avatar,
  });

  void addRollCallStat(RollCall newStat) {
    presenceStatus.add(newStat);
    notifyListeners();
  }

  void addPayment(Tuition tuition) {
    paymentsStatus.add(tuition);
    notifyListeners();
  }

  void addGroupStat(GroupRollCall groupStat) {
    groupsStatus.add(groupStat);
    notifyListeners();
  }
}
