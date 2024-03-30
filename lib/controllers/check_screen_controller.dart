import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:technorio/di/di.dart';
import 'package:technorio/repository/checkin_repository.dart';

import '../helpers/exceptions.dart';
import '../model/checkin.dart';

class CheckInController {
  late final CheckinRepository _checkinRepository;

  CheckInController() {
    _checkinRepository = checkinRepository;
  }

  Future<void> stallPost(
      {required int stallNumber,
      required String cardId,
      required String type}) async {
    // Shoow toast message based on exception
    try {
      await _checkinRepository.stallPost(
          cardId: cardId, stallNumber: stallNumber, type: type);
    } catch (e) {
      if (e is UnauthorizedException) {
      } else if (e is ErrorException) {
        showToast(e.message ?? 'There is some error');
      } else if (e is WarningException) {
        showToast(e.message ?? 'Warning');
      } else if (e is NetworkException) {
        showToast(e.message ?? 'Network Error');
      } else {
        showToast('Something went wrong');
      }
    }
  }

  Future<List<Checkin>> fetchStalls() async {
    // try and show toast message based on exception
    try {
      final stalls = await _checkinRepository.getStalls();
      return stalls;
    } catch (e) {
      if (e is UnauthorizedException) {
      } else if (e is ErrorException) {
        showToast(e.message ?? 'There is some error');
      } else if (e is WarningException) {
        showToast(e.message ?? 'Warning');
      } else if (e is NetworkException) {
        showToast(e.message ?? 'Network Error');
      } else {
        showToast('Something went wrong');
      }
      return [];
    }
  }

  // show toast message
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
