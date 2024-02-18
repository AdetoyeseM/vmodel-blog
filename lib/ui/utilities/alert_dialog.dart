import 'package:flutter/material.dart';

class AlertDialogWidget {


static showLoading(context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Text(message ?? "Loading..."),
          ],
        ),
      );
    },
  );
}

static hideLoading(context) {
  Navigator.of(context).pop(); // Dismiss the dialog
}

static showSnackBar(context, String message, bool? isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      backgroundColor: isError == true ? Colors.red : const Color(0xff503C3C),
      content: Text(
        message,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

}