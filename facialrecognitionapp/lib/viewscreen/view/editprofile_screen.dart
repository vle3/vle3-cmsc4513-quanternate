import 'dart:io';

import 'package:facialrecognitionapp/controller/auth_controller.dart';
import 'package:facialrecognitionapp/model/constants.dart';
import 'package:facialrecognitionapp/viewscreen/view/view_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/editprofile_screen_model.dart';
import '../../model/userprofile.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/editProfile';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfileScreen> {
  late _Controller con;
  late EditProfileScreenModel screenModel;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
    screenModel = EditProfileScreenModel(user: Auth.user!);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit your profile'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.check),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(con.state.context).pop();
            },
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              photoPreview(),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                autocorrect: true,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Date of Birth',
                ),
                autocorrect: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget photoPreview() {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: screenModel.photo == null
              ? const FittedBox(child: Icon(Icons.photo_library))
              : Image.file(screenModel.photo!),
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: Container(
            color: Colors.blue[200],
            child: PopupMenuButton(
              onSelected: con.getPhoto,
              itemBuilder: (context) {
                return [
                  for (var source in PhotoSource.values)
                    PopupMenuItem(
                      value: source,
                      child: Text(source.name.toUpperCase()),
                    ),
                ];
              },
            ),
          ),
        ),
        if (screenModel.progressMessage != null)
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              color: Colors.blue[200],
              child: Text(
                screenModel.progressMessage!,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )
      ],
    );
  }
}

class _Controller {
  _EditProfileState state;
  _Controller(this.state);

  Future<void> getPhoto(PhotoSource source) async {
    try {
      var imageSource = source == PhotoSource.camera
          ? ImageSource.camera
          : ImageSource.gallery;
      XFile? image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return; // cancelled at camera or gallery
      state.render(() => state.screenModel.photo = File(image.path));
    } catch (e) {
      if (Constant.devMode) print('============ failed to get pic: $e');
      showSnackBar(context: state.context, message: 'Failed to get a pic: $e');
    }
  }
}
