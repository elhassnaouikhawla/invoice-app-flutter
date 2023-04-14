// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Functions {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);

    return formatted;
  }

  static void saveInvoice(
      {required String name,
        required Uint8List fileBytes,
      }) async {
    try {
      bool checkPermission = await Permission.storage.request().isGranted;
      if (checkPermission) {
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;
        File pdf_doc = File("$path/$name");
        print(path);
        await pdf_doc.writeAsBytes(fileBytes);
        Get.snackbar("done", "Invoice Saved succesfully to $path/$name",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "Storage permission denied !, please try again!",
            snackPosition: SnackPosition.BOTTOM);
        Future.delayed(
          const Duration(seconds: 2),
        );
        await Permission.storage.request();
      }
    } on FileSystemException catch (e) {
      Get.snackbar("ERROR", "${e.message} $name",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("ERROR", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
