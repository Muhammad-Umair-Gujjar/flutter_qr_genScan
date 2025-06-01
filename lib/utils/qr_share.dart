import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareWidgetAsImage({
  required GlobalKey repaintKey,
  required String message,
}) async {
  if (message.isEmpty) return;

  try {
    await Future.delayed(const Duration(milliseconds: 300));

    final boundary =
    repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/qr_code.png').create();
    await file.writeAsBytes(pngBytes);

    await Share.shareXFiles([XFile(file.path)], text: message);
  } catch (e) {
    rethrow;
  }
}
