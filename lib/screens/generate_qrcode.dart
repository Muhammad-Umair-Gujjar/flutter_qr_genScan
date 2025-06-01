

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_genscan/providers/generate_qr_provider.dart';
import 'package:qr_code_genscan/utils/qr_share.dart';
import 'package:qr_code_genscan/widgets/build_appBar.dart';
import 'package:qr_code_genscan/widgets/elevated_button.dart';
import 'package:qr_code_genscan/widgets/qr_inputField.dart';
import 'package:qr_code_genscan/widgets/qr_previewCard.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  final GlobalKey globalKey = GlobalKey();

  Future<void> shareQrImage(BuildContext context, String data) async {
    try {
      await shareWidgetAsImage(
        repaintKey: globalKey,
        message: data,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to share QR code: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double componentWidth = 0.7.sw;

    return Scaffold(
      appBar: BuildAppbar(text: "Generate QR"),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<GenerateQrProvider>(
                  builder: (_, provider, __) {
                    return provider.generatedData.isNotEmpty
                        ? QrPreviewCard(
                            repaintKey: globalKey, data: provider.generatedData)
                        : SizedBox(
                            height: 200.h,
                            width: componentWidth,
                            child: Center(
                              child: Text(
                                "QR code preview will appear here",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                  },
                ),
                SizedBox(height: 30.h),
                Consumer<GenerateQrProvider>(
                  builder: (_, provider, __) {
                    return SizedBox(
                      width: componentWidth,
                      child: QrInputField(
                        controller: provider.urlController,
                        onChanged: (value) => provider.updateData(value),
                        onClear: provider.clearText,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Consumer<GenerateQrProvider>(
                  builder: (_, provider, __) {
                    return provider.generatedData.isNotEmpty
                        ? SizedBox(
                            height: 50.h,
                            width: componentWidth,
                            child: CustomElevatedButton(
                              btnLabel: "Share QR Code",
                              btnIcon: Icons.share,
                              fontSize: 15.sp,
                              onPressed: () =>
                                  shareQrImage(context, provider.generatedData),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
