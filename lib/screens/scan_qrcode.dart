import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_genscan/widgets/build_appBar.dart';
import 'package:qr_code_genscan/widgets/elevated_button.dart';
import '../providers/scan_qr_provider.dart';

const String defaultQrText = "Scanned data will appear here";

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  @override
  Widget build(BuildContext context) {
    // final qrProvider = Provider.of<ScanQrProvider>(context);
    return Scaffold(
        appBar: BuildAppbar(text: " Scan QR Code"),
        body: Consumer<ScanQrProvider>(
          builder: (context, qrProvider, _) {
            return qrProvider.isScannerOpen
                ? _buildScannerView(qrProvider)
                : _buildResultView(qrProvider, context);
          },
        ));
  }

  Widget _buildScannerView(ScanQrProvider provider) {
    return Stack(
      children: [
        MobileScanner(
          controller: provider.cameraController,
          onDetect: provider.onDetect,
        ),
        ScannerCloseButtons(
          isFlashOn: provider.isFlashOn,
          onCancel: provider.closeScanner,
          onToggleFlash: provider.toggleFlash,
        )
      ],
    );
  }

  Widget _buildResultView(ScanQrProvider provider, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            QrResultDisplay(
                result: provider.qrResult,
                onCopy: () {
                  if (provider.qrResult.isNotEmpty &&
                      provider.qrResult != defaultQrText) {
                    Clipboard.setData(
                        ClipboardData(text: provider.qrResult));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Copied to clipboard")),
                    );
                  }
                }),
            SizedBox(height: 20.h),
            SizedBox(
              width: 220.w, // Responsive width
              height: 45.h,
              child: CustomElevatedButton(
                btnLabel: "Scan QR Code",
                fontSize: 15.sp,
                btnIcon: Icons.qr_code_scanner,
                onPressed: provider.openScanner,
              ),
            ),
          ],
        ),
      ),
    );
  }}

class QrResultDisplay extends StatelessWidget {
  final String result;
  final VoidCallback onCopy;
  const QrResultDisplay(
      {super.key, required this.result, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            result,
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ),
        if (result != defaultQrText)
          IconButton(
            onPressed: onCopy,
            icon: const Icon(Icons.copy),
            tooltip: "Copy to clipboard",
          ),
      ],
    );
  }
}

class ScannerCloseButtons extends StatelessWidget {
  final bool isFlashOn;
  final VoidCallback onToggleFlash;
  final VoidCallback onCancel;
  const ScannerCloseButtons({
    super.key,
    required this.isFlashOn,
    required this.onCancel,
    required this.onToggleFlash,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            btnLabel: isFlashOn ? "Flash Off" : "Flash On",
            btnIcon: isFlashOn ? Icons.flash_off : Icons.flash_on,
            onPressed: onToggleFlash,
            iconColor: Colors.black,
            labelColor: Colors.black,
            bgColor: Colors.white,
          ),
          CustomElevatedButton(
            btnLabel: "Cancel",
            btnIcon: Icons.close,
            onPressed: onCancel,
            iconColor: Colors.black,
            labelColor: Colors.black,
            bgColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
