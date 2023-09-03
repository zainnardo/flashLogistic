import 'package:flashlogistic/common/styles.dart';
import 'package:flutter/material.dart';

/// Private class AlertDialog
class __AlertDialog extends StatefulWidget {
  final String title;
  final String message;
  final Widget? dialogIcon;
  final Color? negativeColor;
  final Color? positiveColor;
  final String? negativeText;
  final String? positiveText;
  final Function()? negativeAction;
  final Function()? positiveAction;
  final bool isInput;
  final TextEditingController? inputCtrl;
  final String? category;

  __AlertDialog(
      {this.dialogIcon,
      required this.title,
      required this.message,
      this.negativeColor,
      this.positiveColor,
      this.negativeText,
      this.positiveText,
      this.negativeAction,
      this.positiveAction,
      this.isInput = false,
      this.inputCtrl,
      this.category});

  @override
  __AlertDialogState createState() => __AlertDialogState();
}

class __AlertDialogState extends State<__AlertDialog> {
  double _screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8.0,
      backgroundColor: transparent,
      child: _dialogContent(context),
    );
  }

  _negativeButton(BuildContext context) {
    if (widget.negativeText != null && widget.negativeAction != null) {
      return TextButton(
        onPressed: widget.negativeAction,
        child: Text(
          widget.negativeText!,
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: widget.negativeColor ?? primaryBlack,
          ),
        ),
      );
    } else {
      return SizedBox(height: 0);
    }
  }

  _positiveButton(BuildContext context) {
    if (widget.positiveText != null && widget.positiveAction != null) {
      return TextButton(
        onPressed: widget.positiveAction,
        child: Text(
          widget.positiveText!,
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: widget.positiveColor ?? primaryBlack,
          ),
        ),
      );
    } else {
      return SizedBox(height: 0);
    }
  }

  _dialogContent(BuildContext context) {
    return Container(
      width: _screenWidth >= 600 ? 500 : _screenWidth,
      padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.dialogIcon ?? SizedBox(height: 0),
          SizedBox(height: 8),
          if (widget.title.isNotEmpty)
            Text(
              widget.title,
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 16),
          Flexible(
            fit: FlexFit.loose,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Text(
                  widget.message,
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: Colors.grey[300],
            thickness: 2,
            height: 0,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _negativeButton(context),
                _positiveButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dialogs {
  /// Generic Dialog
  static dialog(
    BuildContext context,
    String title,
    String message,
    bool closeOnBackPress, {
    Icon? dialogIcon,
    String? positiveText,
    Function()? positiveAction,
    Color? positiveColor,
    String? negativeText,
    Function()? negativeAction,
    Color? negativeColor,
  }) {
    return showDialog(
      barrierDismissible: closeOnBackPress,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => closeOnBackPress,
        child: __AlertDialog(
          title: title,
          message: message,
          dialogIcon: dialogIcon,
          positiveText: positiveText,
          
          positiveAction: positiveAction,
          positiveColor: positiveColor,
          negativeText: negativeText,
          negativeAction: negativeAction,
          negativeColor: negativeColor,
        ),
      ),
    );
  }


  /// Warning Dialog
  static warning(
    BuildContext context,
    String message, {
    title = '',
  }) {
    return dialog(
      context,
      title,
      message,
      false,
      dialogIcon: Icon(Icons.warning, size: 32, color: primaryOrange),
      positiveText: 'Kembali',
      positiveAction: () {
        Navigator.pop(context);
      },
      positiveColor: primaryOrange,
    );
  }

  /// NoConnection Dialog
  static noConnect(
    BuildContext context, {
    String title = 'NO CONNECTION',
    String message = 'Anda tidak terhubung ke Internet.\n'
                     'Silahkan periksa koneksi Anda dan coba kembali.',
  }) {
    return dialog(
      context,
      title,
      message,
      false,
      dialogIcon: Icon(Icons.wifi_off, size: 32, color: Colors.amber),
      positiveText: 'Kembali',
      positiveAction: () {
        Navigator.pop(context);
      },
      positiveColor: primaryOrange,
    );
  }

  /// Info Dialog
  static info(
    BuildContext context,
    String message, {
    String title = 'INFO',
    Color color = primaryOrange,
    Icon icon = const Icon(Icons.info, size: 32, color: primaryOrange),
  }) {
    return dialog(
      context,
      title,
      message,
      false,
      dialogIcon: icon,
      positiveText: 'Kembali',
      positiveAction: () {
        Navigator.pop(context);
      },
      positiveColor: color,
    );
  }
}