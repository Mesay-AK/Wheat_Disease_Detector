import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheat_recognizer/bloc/image/image_bloc.dart';
import 'package:wheat_recognizer/bloc/image/image_state.dart';
import 'package:wheat_recognizer/bloc/model/model_bloc.dart';
import 'package:wheat_recognizer/bloc/model/model_event.dart';
import 'package:wheat_recognizer/presentation/styles/button_style.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:wheat_recognizer/presentation/styles/text_style.dart';
import 'package:wheat_recognizer/presentation/widgets/drawer.dart';

import '../../bloc/image/image_event.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future<void> selectFromGallery() async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        context.read<ImageBloc>().add(SelectImageEvent(image.path));
      }
    }

    Future<void> capturePhoto() async {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        context.read<ImageBloc>().add(SelectImageEvent(photo.path));
      }
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Take a Photo or \n Upload a Photo \n of your wheat",
              textAlign: TextAlign.center, style: homeTextStyle),
          SizedBox(
            height: 400,
            width: 400,
            child: Center(
              child: BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  if (state is ImageSelected) {
                    return Image.file(File(state.filePath));
                  } else {
                    return const Text('No image selected');
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: capturePhoto,
                style: homeIconButtonStyle,
                child: const Icon(
                  Icons.camera_alt,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: selectFromGallery,
                style: homeIconButtonStyle,
                child: const Icon(
                  Icons.upload,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state is ImageSelected
                    ? () {
                        context
                            .read<ModelBloc>()
                            .add(PredictionButtonTriggered(state.filePath));
                        context.go("/loading");
                      }
                    : null,
                style: raisedButtonStyle,
                child: const Text(
                  "GET PREDICTION",
                  style: TextStyle(fontSize: 20, fontFamily: 'Albert-Sans'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
