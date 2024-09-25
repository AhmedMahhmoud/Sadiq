import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../Theme/Colors/app_colors.dart';
import '../../../Theme/text/text_style.dart';

class UploadFileBtn extends StatefulWidget {
  final Function(File? filePicked) onFilePicked;

  const UploadFileBtn({super.key, required this.onFilePicked});

  @override
  State<UploadFileBtn> createState() => _UploadFileBtnState();
}

class _UploadFileBtnState extends State<UploadFileBtn> {
  String? fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Get the file name from the result
      setState(() {
        fileName = result.files.single.name;
      });

      widget.onFilePicked(File(result.files.single.path!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickFile, // File picker triggered when the user taps the widget
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.fieldsBGfillColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.secondaryColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.file_upload_outlined,
                      color: AppColors.secondaryColor,
                    ),
                    Text(
                      'ارفع الملف',
                      style: AppTextStyle.smallBodyBold
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: const BoxDecoration(
                  color: AppColors.fieldsBGfillColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Text(
                  fileName ??
                      'اسم الملف.pdf', // Show picked file name or default
                  style: AppTextStyle.smallBodyBold.copyWith(
                    color: AppColors.secondaryColor.withOpacity(0.3),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
