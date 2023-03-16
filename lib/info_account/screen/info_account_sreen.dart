import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../account/provider/user_provider.dart';




class InfoAccountScreen extends ConsumerStatefulWidget {
  const InfoAccountScreen({
    Key? key,
  }) : super(key: key);


  @override
  ConsumerState createState() => _InfoAccountScreenState();
}

class _InfoAccountScreenState extends ConsumerState<InfoAccountScreen> {


  String? _imagePath;

  Future<void> _getImageCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _imagePath = pickedFile?.path;
    });
  }

  Future<void> _getImageGallery() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imagePath = pickedFile?.path;
    });
  }


  @override
  Widget build(BuildContext context) {

    final userList = ref.watch(userProvider("1"));
    final user = userList.listUser?.first;
;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: <Widget>[
                                (_imagePath != null)
                                    ? CircleAvatar(
                                    radius: 60,
                                    backgroundImage:
                                    FileImage(File(_imagePath!)))
                                    :  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(user!.avatar)),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.camera_alt_rounded),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Column(
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.camera_alt_rounded),
                                              title: const Text('Chụp ảnh'),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                _getImageCamera();
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.image_search_rounded),
                                              title: const Text(
                                                  'Chọn ảnh từ thư viện'),
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                _getImageGallery();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              user!.fullname,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 5),
                            Text(user!.email),
                            const SizedBox(height: 50),
                            ElevatedButton(onPressed: () {
                              // ref.read(userProvider("1").notifier).editUser(user!, _imagePath!);
                            }, child: const Text("Lưu")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
