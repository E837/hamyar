import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:hamyar/models/group_roll_call.dart';
import 'package:hamyar/models/roll_call.dart';
import 'package:hamyar/models/tuition.dart';
import 'package:hamyar/models/date.dart';

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

  void _addRollCallStat(RollCall newStat) {
    presenceStatus.add(newStat);
    notifyListeners();
  }

  void _modifyRollCallStat(RollCall rollCall) {
    final index = findRollCallByDate(rollCall.date);
    presenceStatus[index] = rollCall;
    notifyListeners();
  }

  void setRollCall(RollCall rollCall) {
    final dates = presenceStatus.map((e) => e.date).toList();
    if (dates.contains(Date.now())) {
      _modifyRollCallStat(rollCall);
    } else {
      _addRollCallStat(rollCall);
    }
  }

  int findRollCallByDate(DateTime date) {
    return presenceStatus.indexWhere((rollCall) => rollCall.date == date);
  }

  void setInitRollCall(DateTime date) {
    final dates = presenceStatus.map((e) => e.date).toList();
    if (!dates.contains(date)) {
      _addRollCallStat(RollCall(date: date, status: false));
    }
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
