import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class UploadImageDottedBorder extends StatefulWidget {
  final Function onImgUploaded;
  const UploadImageDottedBorder({required this.onImgUploaded, super.key});

  @override
  UploadImageDottedBorderState createState() => UploadImageDottedBorderState();
}

class UploadImageDottedBorderState extends State<UploadImageDottedBorder> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onImgUploaded();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(10.r),
      color: AppColors.secondaryColor.withOpacity(0.20),
      dashPattern: const [5, 8],
      child: InkWell(
        onTap: _pickImage,
        child: Container(
          width: 358,
          height: 146,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: _imageFile == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SvgDisplay(
                        path: SvgAssetsPaths.upload, size: Size(20, 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'رفع الصورة هنا',
                      style: AppTextStyle.bodyBold
                          .copyWith(color: AppColors.primaryColor),
                    )
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    _imageFile!,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
        ),
      ),
    );
  }
}
