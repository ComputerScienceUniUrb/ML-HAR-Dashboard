import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

showMessage(String message) {
  SmartDialog.show(builder: (context) {
    return Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(message, style: TextStyle(color: Colors.white)),
    );
  });
}

showError(String message) {
  SmartDialog.show(builder: (context) {
    return Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, color: Colors.red,),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  });
}
