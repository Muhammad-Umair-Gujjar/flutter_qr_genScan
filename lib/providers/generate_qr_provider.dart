import 'package:flutter/cupertino.dart';

class GenerateQrProvider with ChangeNotifier{
  final TextEditingController urlController = TextEditingController();
  String _generatedData = "";

  String get generatedData => _generatedData;

  void updateData(String value) {
    _generatedData = value.trim();;
    notifyListeners();
  }
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void clearText() {
    urlController.clear();
    updateData('');
  }
}
