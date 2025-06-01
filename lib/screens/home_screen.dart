
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_genscan/screens/generate_qrcode.dart';
import 'package:qr_code_genscan/screens/scan_qrcode.dart';
import 'package:qr_code_genscan/widgets/build_appBar.dart';
import 'package:qr_code_genscan/widgets/elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(text: "QR Genscan"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildHeaderIntro(),
                SizedBox(height: 20.h),
                Image.asset(
                  'assets/image/QrHome.png',
                  height: 200.h,
                ),
                SizedBox(height: 40.h),

                // Scan QR Button
                SizedBox(
                  height: 45.h,
                  width: 220.w,
                  child: CustomElevatedButton(
                    btnLabel: "Scan QR Code",
                    btnIcon: Icons.qr_code_scanner,
                    fontSize: 15.sp,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ScanQrCode()),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                // Generate QR Button
                SizedBox(
                  height: 45.h,
                  width: 220.w,
                  child: CustomElevatedButton(
                    btnLabel: "Generate QR Code",
                    btnIcon: Icons.qr_code_sharp,
                    fontSize: 15.sp,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const GenerateQrCode()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildHeaderIntro(){
    return Column(
      children: [
      Text(
      "Welcome",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
        color: Colors.black,
      ),
    ),
    SizedBox(height: 10.h),
    Text(
    "You can Generate or Scan QR Code",
    style: TextStyle(
    fontSize: 14.sp,
    ),
    textAlign: TextAlign.center,
    ),
    ]
    );
  }

}

