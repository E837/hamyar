import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:hamyar/models/group_roll_call.dart';
import 'package:hamyar/models/roll_call.dart';
import 'package:hamyar/models/tuition.dart';
import 'package:hamyar/models/date.dart';
import 'package:hamyar/models/phone_number.dart';

class Student with ChangeNotifier {
  String id = const Uuid().v1();
  String name;
  List<PhoneNumber> phone;
  DateTime joinDate;
  DateTime? leaveDate;
  List<RollCall> presenceStatus = [];
  List<Tuition> paymentsStatus = [];
  List<GroupRollCall> groupsStatus = [];
  String? avatar; // todo: should be in file format

  Student({
    required this.name,
    required this.phone,
    this.avatar,
    DateTime? joinDate,
  }) : joinDate = joinDate ?? DateTime.now();

  // ----------------- student -----------------

  // ----------------- roll-call -----------------

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

  // ----------------- tuition -----------------

  List<DateTime> get _paymentDates =>
      paymentsStatus.map((e) => e.date).toList();

  int findPaymentByDate(DateTime date) {
    return paymentsStatus.indexWhere((tuition) => tuition.date == date);
  }

  void _addPayment(Tuition tuition) {
    paymentsStatus.add(tuition);
    // notifyListeners();
  }

  void _modifyPayment(Tuition tuition) {
    final index = findPaymentByDate(tuition.date);
    paymentsStatus[index] = tuition;
    // notifyListeners();
  }

  void setPayment(Tuition tuition) {
    if (_paymentDates.contains(tuition.date)) {
      _modifyPayment(tuition);
    } else {
      _addPayment(tuition);
    }
  }

  double getPaymentData(DateTime date) {
    final index = findPaymentByDate(date);
    if (index >= 0) {
      return paymentsStatus[index].paymentAmount;
    }
    return 0;
  }

  void setInitPayment(DateTime date, double requiredAmount) {
    if (!_paymentDates.contains(date)) {
      _addPayment(Tuition(
        date: date,
        paymentAmount: 0,
        requiredAmount: requiredAmount,
      ));
    }
  }

  // ----------------- groups -----------------

  // void addGroupStat(GroupRollCall groupStat) {
  //   groupsStatus.add(groupStat);
  //   notifyListeners();
  // }
}
