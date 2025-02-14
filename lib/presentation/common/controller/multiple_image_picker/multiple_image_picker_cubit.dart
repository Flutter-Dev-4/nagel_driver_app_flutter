import 'package:driver_app/export.dart';
import 'dart:developer';

class MultipleImagePickerCubit extends Cubit<List<XFile>?> {

  final ImagePicker picker = ImagePicker();

  MultipleImagePickerCubit() : super(null);

  Future logoBottomSheet(BuildContext context) async {

    final appLocal = AppLocalizations.of(context)!;

    Future<void> getLogoCameraImage() async {
      try {
        final pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          requestFullMetadata: true,
        );
        if (pickedFile != null) {
          emit([...?state, pickedFile]); // Append new image
        } else {
          log('No Image Selected');
          emit(null); // Emit null if no image is selected
        }
      } catch (e) {
        log('Error picking image: $e');
        emit(null);
      }
    }

    Future<void> getLogoGalleryImage() async {
      try {
        final pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          requestFullMetadata: true,
        );
        if (pickedFile != null) {
          emit([...?state, pickedFile]); // Append new image
        } else {
          log('No Image Selected');
          emit(null); // Emit null if no image is selected
        }
      } catch (e) {
        log('Error picking image: $e');
        emit(null);
      }
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.add_a_photo),
              title: Text(appLocal.camera),
              onTap: () {
                getLogoCameraImage();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: Text(appLocal.gallery),
              onTap: () {
                getLogoGalleryImage();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
