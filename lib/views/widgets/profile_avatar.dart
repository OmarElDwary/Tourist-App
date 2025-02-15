import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  final File? imagePath;
  final String defaultImage;
  final Function(File) onImageSelected;
  final VoidCallback onDelete;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    required this.defaultImage,
    required this.onImageSelected,
    required this.onDelete,
  });

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final ImagePicker picker = ImagePicker();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.imagePath;
  }

  Future<void> _pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      widget.onImageSelected(_selectedImage!);
    }
  }

  void _deleteImage() {
    setState(() {
      _selectedImage = null;
    });
    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!)
              : AssetImage(widget.defaultImage) as ImageProvider,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Row(
            children: [
              _buildIconButton(Icons.delete, _deleteImage),
              _buildIconButton(Icons.edit, _pickImage),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
