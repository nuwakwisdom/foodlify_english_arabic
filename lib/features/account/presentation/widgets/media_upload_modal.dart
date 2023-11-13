import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class MediaUploadModal extends StatefulWidget {
  const MediaUploadModal({
    super.key,
    required this.onTapGallery,
    required this.onTapCamera,
  });
  final VoidCallback onTapGallery;
  final VoidCallback onTapCamera;
  @override
  State<MediaUploadModal> createState() => _MediaUploadModalState();
}

class _MediaUploadModalState extends State<MediaUploadModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          child: Container(
            height: 7,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: FoodlieColors.foodlieWhite,
            ),
          ),
        ),
        const Gap(17),
        Container(
          height: 508,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: FoodlieColors.foodlieWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.onTapGallery,
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: FoodlifyLinearColors.buttonLinear),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.galleryIcon,
                            height: 32,
                            width: 32,
                          ),
                          const Gap(5),
                          TextBold(
                            'Upload from Gallery',
                            fontSize: 16,
                            color: const Color(0xffF5F6F8),
                          ),
                        ]),
                  ),
                ),
                const Gap(59),
                GestureDetector(
                  onTap: widget.onTapCamera,
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: FoodlifyLinearColors.buttonLinear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.cameraIcon,
                          height: 32,
                          width: 32,
                        ),
                        const Gap(5),
                        TextBold(
                          'Take the Photo',
                          fontSize: 16,
                          color: const Color(0xffF5F6F8),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
