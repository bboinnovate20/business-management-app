
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nex_spot_app/app/auth/auth_controller.dart';
import 'package:nex_spot_app/cores/common/custom_toast.dart';

import 'package:nex_spot_app/cores/common/widget/header.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
import 'package:nex_spot_app/cores/constants/routes_constant.dart';
import 'package:nex_spot_app/cores/routes/screen_args.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({super.key, 
  required this.stage,
  required this.onCompletion});

  final void Function() onCompletion;
  final int stage;
  
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
      const CustomHeader(
          title: 'Upload Section',
          subTitle: 'Sure! this is the last section, get a well curated and unique business by uploading your Business Branding Details',
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              LogoUploadSection(imageUploader: ImagePicker(), imageSource: ImageSource.gallery),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: SignatureUploadSection(imageUploader: ImagePicker(), imageSource: ImageSource.gallery)),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(onPressed: (){}, title: 'Skip for now ', width: 130, bgColor: Colors.grey,))
            ],
          )
        ),
      ),
      PrimaryButton(onPressed: () {
        context.go(NamedRoutes.success, extra: const ScreenArgument(title: "Account created Successfully!", 
        message: "You can now continue using this awesome business solution"));
      }, title: 'Start Transacting', disabled: false, icon: const Icon(Icons.chevron_right, color: Colors.white) )
      ],
    );
  }
}




class LogoUploadSection extends ConsumerStatefulWidget {
  const LogoUploadSection({
    super.key,
    required this.imageUploader,
    required this.imageSource,
  });


  final ImagePicker imageUploader;
  final ImageSource imageSource;

  @override
  ConsumerState<LogoUploadSection> createState() => _LogoUploadSectionState();
}

class _LogoUploadSectionState extends ConsumerState<LogoUploadSection> {
  XFile? logoPath;
  bool uploading = false;

  onPressed(BuildContext context) async {
    try {
      setState(() => uploading = true);
      final XFile? pickedFile = await widget.imageUploader.pickImage(source: widget.imageSource, maxWidth: 200, maxHeight: 200);
      final File filePath = File(pickedFile!.path);

      final uploaded = await uploadImageToServer(filePath);

      if(uploaded.success) {
          CustomToast(Navigator.of(context)).showSuccessMessage('Logo Uploaded Successfully!');
        }else {
          CustomToast(Navigator.of(context)).showErrorMessage(uploaded.message);
        }
      
      setState(() {
        logoPath = pickedFile;
        uploading = false;
      });
    } catch (e) {
      CustomToast(Navigator.of(context)).showErrorMessage('Error Uploading image, please try again');
      setState(() => uploading = false);
    }
  }

  uploadImageToServer(File path) async {
    final businessController = RegisterController(ref);
    final uploadImage = await businessController.uploadLogo(path);
    return uploadImage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration:  BoxDecoration(
            color: logoPath != null ? Colors.white : Colors.grey.shade300,
            shape: BoxShape.circle
          ),
          child: uploading ? const CircularProgressIndicator(
                  strokeWidth: 3) :
           logoPath?.path == null ?  const Align(
            child: Icon(Icons.camera_alt_outlined, size: 50),
          ): ClipOval(
            child: Image.file(File(logoPath!.path), fit: BoxFit.contain,)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Builder(
            builder: (context) {
              return CustomButton(
                
                onPressed: () => onPressed(context), title: uploading ? 'Uploading' : 'Upload Your Business Logo', isOutline: true);
            }
          ))
      ],
    );
  }
}


class SignatureUploadSection extends ConsumerStatefulWidget {
  const SignatureUploadSection({
    super.key,
    required this.imageUploader,
    required this.imageSource,
  });


  final ImagePicker imageUploader;
  final ImageSource imageSource;

  @override
  ConsumerState<SignatureUploadSection> createState() => _SignatureUploadSectionState();
}

class _SignatureUploadSectionState extends ConsumerState<SignatureUploadSection> {
  XFile? signaturePath;
  bool uploading = false;

  onPressed(BuildContext context) async {
    
    try {
      setState(() => uploading = true);
      final XFile? pickedFile = await widget.imageUploader.pickImage(source: widget.imageSource, maxWidth: 200, maxHeight: 200);
      final File filePath = File(pickedFile!.path);

      final uploaded = await uploadImageToServer(filePath);

        if(uploaded.success) {
          CustomToast(Navigator.of(context)).showSuccessMessage('Signature Uploaded Successfully!');
        }else {
          CustomToast(Navigator.of(context)).showErrorMessage(uploaded.message);
        }

      setState(() {
        signaturePath = pickedFile;
        uploading = false;
      });
    } catch (e) {
      CustomToast(Navigator.of(context)).showErrorMessage('Error Uploading, please try again');
      setState(() => uploading = false);
    }

  }

  uploadImageToServer(File path) async {
    final businessController = RegisterController(ref);
    final uploadImage = await businessController.uploadSignature(path);
    return uploadImage;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 240,
          height: 110,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: signaturePath != null ? Colors.white : Colors.grey.shade300,
            shape: BoxShape.rectangle
          ),
          child: uploading ? const Align(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                      strokeWidth: 3),
            ),
          ) :
           signaturePath?.path == null ?  const Align(
            child: Icon(Icons.security_outlined, size: 50),
          ): Image.file(File(signaturePath!.path), fit: BoxFit.contain,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Builder(
            builder: (context) {
              return CustomButton(
                onPressed: () => onPressed(context), title: uploading ? 'Uploading' : 'Upload Your Business Signature', isOutline: true);
            }
          ))
      ],
    );
  }
}
