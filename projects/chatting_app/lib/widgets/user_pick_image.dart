import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPickImage extends StatefulWidget {
  const UserPickImage({super.key, required this.onPickImage});

  final void Function(File?) onPickImage;

  @override
  State<UserPickImage> createState() => _UserPickImageState();
}

class _UserPickImageState extends State<UserPickImage> {
  File? imageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
      maxHeight: 200,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      imageFile = File(pickedImage.path);
    });

    widget.onPickImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: imageFile != null ? FileImage(imageFile!) : null,
        ),
        TextButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: Text(
              'Add Image',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ))
      ],
    );
  }
}
