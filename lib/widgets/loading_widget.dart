import 'package:flutter/material.dart';

void showLoading(BuildContext context){
  showDialog(barrierDismissible: false,context: context, builder: (context) => dialogLoadingWidget(context),);
}

void showSuccess(BuildContext context){
  showDialog(context: context, builder: (context) => dialogSuccessWidget(context),);
}

void removeLoading(BuildContext context){
  Navigator.pop(context);
}

String twoDigit({required int digit}){

  if(digit > 9){
    return "${digit}";
  }

  return "0${digit}";
}

Widget dialogLoadingWidget(BuildContext context){
  return Dialog(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.all(10),
      height: 100,
      width: 100,
      color: Colors.transparent,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeAlign: 10,
        strokeWidth: 20,
      ),
    ),
  );
}

Widget dialogSuccessWidget(BuildContext context){
  return Dialog(
    backgroundColor: Colors.white,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.all(10),
      height: 100,
      width: 100,
      color: Colors.transparent,
      child: const Icon(
        Icons.check,
        color: Colors.green,
        size: 24,
      ),
    ),
  );
}