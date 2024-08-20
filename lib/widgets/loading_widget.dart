import 'package:flutter/material.dart';

void showLoading(BuildContext context){
  showDialog(barrierDismissible: false,context: context, builder: (context) => dialogLoadingWidget(context),);
}

void showSuccess(BuildContext context){
  showDialog(context: context, builder: (context) => dialogSuccessWidget(context),);
}

void showFail(BuildContext context){
  showDialog(context: context, builder: (context) => dialogFailedWidget(context),);
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
      child: const CircularProgressIndicator(
        color: Colors.white,
        strokeAlign: 10,
        strokeWidth: 20,
      ),
    ),
  );
}

Widget dialogSuccessWidget(BuildContext context){
  return AlertDialog(
    contentPadding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    content: const Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 40,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            'Success! Your action was completed successfully.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    ),
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}


Widget dialogFailedWidget(BuildContext context){
  return AlertDialog(
    contentPadding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    content: const Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 40,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            'Failure! Something went wrong. Please try again.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    ),
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}