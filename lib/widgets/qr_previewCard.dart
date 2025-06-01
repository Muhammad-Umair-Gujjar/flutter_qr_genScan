import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/generate_qr_provider.dart';
class QrPreviewCard extends StatelessWidget {
  final GlobalKey repaintKey;
  final String data;

  const QrPreviewCard({super.key,
    required this.repaintKey,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding:  EdgeInsets.all(16.h),
        child: RepaintBoundary(
          key: repaintKey,
          child:Container(
            color: Colors.white, // Ensures visible background
            padding: EdgeInsets.all(8.h),
            child: QrImageView(
              data: data,
              version: QrVersions.auto,
              size: 200.r,
            ),
          ),
        ),
      ),
    );
  }
}