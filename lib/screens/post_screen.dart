import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/post.dart';
import 'package:permission_handler/permission_handler.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  File? _image;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    try {
      // Kiểm tra quyền truy cập storage
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cần cấp quyền truy cập thư viện ảnh')),
          );
          return;
        }
      }

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );
      
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi chọn ảnh: $e')),
      );
    }
  }

  Future<void> _submitPost() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // TODO: Implement post submission logic
        // Ví dụ:
        // final post = Post(
        //   id: DateTime.now().toString(),
        //   title: _titleController.text,
        //   content: _contentController.text,
        //   imageUrl: 'url_after_upload',
        //   createdAt: DateTime.now(),
        //   authorId: 'current_user_id',
        // );
        
        // Clear form
        _titleController.clear();
        _contentController.clear();
        setState(() {
          _image = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đăng bài thành công!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng bài'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _isLoading ? null : _submitPost,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Tiêu đề',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập tiêu đề';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _contentController,
                      decoration: const InputDecoration(
                        labelText: 'Nội dung',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập nội dung';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.image),
                      label: const Text('Chọn ảnh'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                    if (_image != null) ...[
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _image!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
} 