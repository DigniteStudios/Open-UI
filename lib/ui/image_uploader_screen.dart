import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_ui/utils/text_theme_extension.dart';

import '../widgets/touchable.dart';

class ImageUploaderScreen extends StatefulWidget {
  const ImageUploaderScreen({super.key});

  @override
  State<ImageUploaderScreen> createState() => _ImageUploaderScreenState();
}

class _ImageUploaderScreenState extends State<ImageUploaderScreen> {
  String? filePath;

  Future<void> handleTap() async {
    String? imagePath = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const CameraBottomSheet(isUploaded: false),
    );
    if(imagePath?.isNotEmpty ?? false) {
      setState(() {
        filePath = imagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Upload Image",
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox.square(dimension: 10),
            InkWell(
              onTap: handleTap,
              borderRadius: BorderRadius.circular(100),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: (filePath?.isNotEmpty ?? false)
                ? Image.file(File(filePath!)) as ImageProvider
                : null,
                child: (filePath?.isNotEmpty ?? false)
                    ? null
                    : const Icon(Icons.person_outlined, size: 40,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({
    super.key,
    required this.isUploaded,
  });
  final bool isUploaded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //To Perform Picture upload Action

          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () =>
                          handleProfileImage(context, ImageSource.gallery),
                      child: Text(
                        'Upload image',
                        style: context.titleSmall,
                        // style: Fonts.poppins(
                        //     context, AppColors.black, 20, FontWeight.w400),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    endIndent: 0,
                    indent: 0,
                    height: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () =>
                          handleProfileImage(context, ImageSource.camera),
                      child: Text('Take photo', style: context.titleSmall),
                    ),
                  ),
                  isUploaded
                      ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(
                        thickness: 0.5,
                        endIndent: 0,
                        indent: 0,
                        color: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          // controller.deleteImage();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            'Remove',
                            style: context.titleLarge,
                          ),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox.shrink(),
                ],
              )),
          //To Cancel Action
          const SizedBox.square(dimension: 20,),
          PushButton(
            label: "Cancel",
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  handleProfileImage(context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    // final userController = ref.read(userProvider.notifier);
    final XFile? image =
    await picker.pickImage(source: source, imageQuality: 20);
    if (image != null) {
      // userController.updateImage(image.path);
      Navigator.pop(context, image.path);
    }
  }
}