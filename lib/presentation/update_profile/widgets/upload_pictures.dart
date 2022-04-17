import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_flutter/presentation/update_profile/edit_profile_cubit/update_profile_cubit.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_alert_dialog.dart';
import 'package:udemy_flutter/shared/components/custom_divider.dart';
import 'package:udemy_flutter/shared/components/custom_text_button.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class UploadPictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.3,
              ),
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: ClipOval(
                  child: Image.network(
               userData.data.image,
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),),
            ),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: InkWell(
                child: SvgPicture.asset(
                  'assets/icons/add_icon.svg',
                ),
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomAlertDialog(
                          height: 200,
                          widget: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomDivider(thickness: 1),
                                ListTile(
                                  leading:const Icon(
                                      Icons.add_photo_alternate_outlined,),
                                  title: CustomTextButton(
                                    text: 'Gallery',
                                    textAlign: TextAlign.start,
                                    fontSize: 20,
                                    textColor: mainColor,
                                    onPressed: () {
                                      UpdateProfileCubit.get(context)
                                          .getImageFromGallery();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                ListTile(
                                  leading:const Icon(Icons.add_a_photo_outlined),
                                  title: CustomTextButton(
                                    text: 'Camera',
                                    textAlign: TextAlign.start,
                                    fontSize: 20,
                                    textColor: mainColor,
                                    onPressed: () {
                                      UpdateProfileCubit.get(context)
                                          .getImageFromCamera();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),);
                    },),),
          ),
        ],)
      ],
    );
  }
}
