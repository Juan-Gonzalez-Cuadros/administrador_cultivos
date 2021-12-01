import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:administrador_cultivos/round_image.dart';
import 'package:administrador_cultivos/collection_manager.dart';
import 'package:provider/src/provider.dart';

class UpdateTreeImage extends StatefulWidget {
  final Function(String imageUrl) onFileChanged;
  final data;

  UpdateTreeImage({required this.onFileChanged, required this.data});

  @override
  _UpdateTreeImageState createState() => _UpdateTreeImageState();
}

class _UpdateTreeImageState extends State<UpdateTreeImage> {
  final ImagePicker _picker = ImagePicker();

  String? imageUrl = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController estadoController =
        TextEditingController(text: widget.data['estado'].toString());
    TextEditingController abonoController =
        TextEditingController(text: widget.data['abono'].toString());
    TextEditingController plagaController =
        TextEditingController(text: widget.data['plaga'].toString());
    TextEditingController tipoController =
        TextEditingController(text: widget.data['tipo'].toString());

    return SingleChildScrollView(
        padding: EdgeInsets.all(32),
        reverse: true,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: estadoController,
                decoration: InputDecoration(
                  labelText: "Estado",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: abonoController,
                decoration: InputDecoration(
                  labelText: "Abono",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: plagaController,
                decoration: InputDecoration(
                  labelText: "Plaga",
                ),
              ),
            ),
            if (imageUrl == null)
              Icon(Icons.image,
                  size: 60, color: Theme.of(context).primaryColor),
            if (imageUrl != null)
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => _selectPhoto(),
                child: AppRoundImage.url(
                  widget.data['img'].toString(),
                  width: 80,
                  height: 80,
                ),
              ),
            InkWell(
              onTap: () => _selectPhoto(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cambiar imagen',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Actualizar"),
                onPressed: () {
                  if (imageUrl == '') imageUrl = widget.data['img'];
                  context.read<CollectioManager>().actualizarArbol(
                        id: widget.data['id'].toString(),
                        estado: estadoController.text,
                        abono: abonoController.text,
                        plaga: plagaController.text,
                        img: imageUrl!,
                        tipo: tipoController.text,
                      );
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Camara'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickImage(ImageSource.camera);
                      }),
                  ListTile(
                      leading: Icon(Icons.filter),
                      title: Text('Galeria'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _pickImage(ImageSource.gallery);
                      }),
                ],
              ),
              onClosing: () {},
            ));
  }

  Future _pickImage(ImageSource source) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile == null) {
      return;
    }

    var file = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (file == null) {
      return;
    }

    file = await compressImagePath(file.path, 35);

    await _uploadFile(file.path);
  }

  Future<File> compressImagePath(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );

    return result!;
  }

  Future _uploadFile(String path) async {
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');

    final result = await ref.putFile(File(path));
    final fileUrl = await result.ref.getDownloadURL();

    setState(() {
      imageUrl = fileUrl;
    });

    widget.onFileChanged(fileUrl);
  }
}
