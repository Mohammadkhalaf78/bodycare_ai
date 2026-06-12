import 'package:bodycare_ai/features/patients/dashbord/chat_boot/cubit/chatboot_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbootCubit, ChatbootState>(
      builder: (context, state) {
        final cubit = context.watch<ChatbootCubit>();
        return Column(
          children: [
            // SizedBox(
            //   height: 20,
            //   width: 20,
            //   child: cubit.image != null
            //       ? Image.file(cubit.image!)
            //       : Container(),
            // ),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    cubit.pickImage(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt_outlined, size: 33),
                ),
                IconButton(
                  onPressed: () {
                    cubit.pickImage(ImageSource.gallery);
                  },
                  icon: Icon(Icons.photo_library, size: 33),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
