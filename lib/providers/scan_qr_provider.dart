import 'package:flutter/cupertino.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrProvider with ChangeNotifier{
  final MobileScannerController cameraController = MobileScannerController();
  String _qrResult = "Scanned data will appear here";
  bool _isScannerOpen = false;
  bool _isFlashOn = false;

  String get qrResult => _qrResult;
  bool get isScannerOpen => _isScannerOpen;
  bool get isFlashOn => _isFlashOn;

  void openScanner() {
      _isScannerOpen = true;
      notifyListeners();
  }

  void closeScanner() {

      _isScannerOpen = false;
    cameraController.stop();
    notifyListeners();
  }

  void toggleFlash() {
      _isFlashOn = !_isFlashOn;
      cameraController.toggleTorch();
      notifyListeners();
  }

  void onDetect(BarcodeCapture capture) {
    final String code = capture.barcodes.first.rawValue ?? 'Unknown QR code';
    _qrResult = code;
    _isScannerOpen = false;
    cameraController.stop();
    notifyListeners();
  }
  void reset() {
    _qrResult = "Scanned data will appear here";
    _isScannerOpen = false;
    _isFlashOn = false;
    cameraController.stop();
    notifyListeners();
  }
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}