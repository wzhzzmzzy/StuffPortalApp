import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard (String text, [BuildContext? context, SnackBarAction? action, String? snackBarContent]) {
  Clipboard.setData(ClipboardData(text: text));
  if (context != null) {
    showCopySnackBar(context, snackBarContent, action);
  }
}

void showCopySnackBar (BuildContext context, [String? snackBarContent, SnackBarAction? action]) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackBarContent ?? "已复制到剪贴板"),
        action: action,
      )
  );
}