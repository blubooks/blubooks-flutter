import 'package:flutter/material.dart';
import '../model/error_model.dart';

class CustomDialog {
  static showError(
      {required BuildContext context,
      required ErrorModel error,
      String? okText,
      onPressed}) {
    var lokText = "OK";
    if (okText != null) {
      lokText = okText;
    }

    Widget okButton;
    // set up the button
    if (onPressed != null) {
      okButton = TextButton(
        onPressed: onPressed,
        child: Text(lokText),
      );
    } else {
      okButton = TextButton(
        child: Text(lokText),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    var message = "";
    if (error.message == null && error.fields == null) {
      message = "Fehler!";
    } else {
      if (error.message != null) {
        message = error.message!;
      }
      final fields = error.fields;
      if (fields != null) {
        fields.forEach((key, value) {
          message = "$message\n$value";
        });
      }
    }
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAlertDialog(
      {required BuildContext context,
      required String text,
      String? titel,
      String? okText,
      onPressed}) {
    var lokText = "OK";
    if (okText != null) {
      lokText = okText;
    }

    Widget okButton;
    // set up the button
    if (onPressed != null) {
      okButton = TextButton(
        onPressed: onPressed,
        child: Text(lokText),
      );
    } else {
      okButton = TextButton(
        child: Text(lokText),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: (titel != null) ? Text(titel) : null,
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showConfirmDialog(
      {required BuildContext context,
      required String text,
      required onPressedOk,
      String? titel,
      String? okText,
      String? cancleText,
      onPressedCancle}) {
    var lokText = "OK";
    if (okText != null) {
      lokText = okText;
    }
    String lcancleText = "Cancle";
    if (cancleText != null) {
      lcancleText = cancleText;
    }

    Widget cancleButton;
    // set up the button
    if (onPressedOk != null) {
      cancleButton = TextButton(
        onPressed: onPressedCancle,
        child: Text(lcancleText),
      );
    } else {
      cancleButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(lcancleText),
      );
    }

    Widget okButton = TextButton(
      onPressed: onPressedOk,
      child: Text(lokText),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: (titel != null) ? Text(titel) : null,
      content: Text(text),
      actions: [
        cancleButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
