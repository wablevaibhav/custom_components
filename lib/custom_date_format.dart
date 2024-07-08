import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateFormat {
  // Parse date string to DateTime
  static DateTime? parse(String? date) {
    if (date != null) {
      try {
        return DateTime.parse(date);
      } catch (e) {
        debugPrint('CustomDateFormat failed to parse $date with error: $e');
      }
    }
    return null;
  }

  // Parse date string to string
  static String? date(String? dateString) {
    if (dateString != null) {
      try {
        final date = DateTime.parse(dateString);
        return DateFormat.yMd().format(date);
      } catch (e) {
        debugPrint('CustomDateFormat failed to parse $date with error: $e');
      }
    }
    return null;
  }

  // Format date to yyyy-MM-dd
  static String formatToYMD(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Format date string to dd/MM/yyyy
  static String formatDateStringToDDMMYYYY(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return '';
    }

    try {
      DateTime dateTime = DateTime.parse(dateString);
      String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

      return formattedDate;
    } catch (e) {
      return '';
    }
  }
}
