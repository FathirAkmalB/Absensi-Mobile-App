import 'dart:convert';

import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassHistory extends StatefulWidget {
  final int classId;

  const ClassHistory({super.key, required this.classId});

  @override
  State<ClassHistory> createState() => _ClassHistoryState();
}

class _ClassHistoryState extends State<ClassHistory> {
  List<Map<String, dynamic>> classHistory = [];

  Future<void> fetchHistoryClass({required int classId}) async {
    var sp = await SharedPreferences.getInstance();

    String? token = sp.getString("token");

    if (token == null) {
      // handle error
    }

    var data = await API()
        .getRequest(
        route: "/absen/get/class-history?class_id=33",
        header: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": token!
    });

    classHistory = jsonDecode(data.body);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      fetchHistoryClass(classId: widget.classId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
