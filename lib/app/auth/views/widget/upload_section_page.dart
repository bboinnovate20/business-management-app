
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nex_spot_app/cores/common/widget/header.dart';
import 'package:nex_spot_app/cores/common/widget/primary_button.dart';
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
        Navigator.pushNamed(context, '/success', arguments: const ScreenArgument("Account created Successfully!", 
        "You can now continue using this awesome business solution") );
      }, title: 'Start Transacting', disabled: false, icon: const Icon(Icons.chevron_right, color: Colors.white) )
      ],
    );
  }
}




class LogoUploadSection extends StatefulWidget {
  const LogoUploadSection({
    super.key,
    required this.imageUploader,
    required this.imageSource,
  });


  final ImagePicker imageUploader;
  final ImageSource imageSource;

  @override
  State<LogoUploadSection> createState() => _LogoUploadSectionState();
}

class _LogoUploadSectionState extends State<LogoUploadSection> {
  XFile? logoPath;
  bool uploading = false;

  onPressed() async {
    try {
      setState(() => uploading = true);
      final XFile? pickedFile = await widget.imageUploader.pickImage(source: widget.imageSource, maxWidth: 200, maxHeight: 200);
      setState(() {
        logoPath = pickedFile;
        uploading = false;
      });
    } catch (e) {
      setState(() => uploading = false);
    }
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
            child: Image.asset(logoPath!.path, fit: BoxFit.contain,)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: CustomButton(
            
            onPressed: onPressed, title: uploading ? 'Uploading' : 'Upload Your Business Logo', isOutline: true))
      ],
    );
  }
}





class SignatureUploadSection extends StatefulWidget {
  const SignatureUploadSection({
    super.key,
    required this.imageUploader,
    required this.imageSource,
  });


  final ImagePicker imageUploader;
  final ImageSource imageSource;

  @override
  State<SignatureUploadSection> createState() => _SignatureUploadSectionState();
}

class _SignatureUploadSectionState extends State<SignatureUploadSection> {
  XFile? logoPath;
  bool uploading = false;

  onPressed() async {
    try {
      setState(() => uploading = true);
      final XFile? pickedFile = await widget.imageUploader.pickImage(source: widget.imageSource, maxWidth: 200, maxHeight: 200);
      setState(() {
        logoPath = pickedFile;
        uploading = false;
      });
    } catch (e) {
      setState(() => uploading = false);
    }
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
            color: logoPath != null ? Colors.white : Colors.grey.shade300,
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
           logoPath?.path == null ?  const Align(
            child: Icon(Icons.security_outlined, size: 50),
          ): Image.asset(logoPath!.path, fit: BoxFit.contain,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: CustomButton(
            
            onPressed: onPressed, title: uploading ? 'Uploading' : 'Upload Your Business Signature', isOutline: true))
      ],
    );
  }
}
