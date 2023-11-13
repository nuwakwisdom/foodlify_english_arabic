import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/account/presentation/widgets/complaint_type_modal.dart';
import 'package:Foodlify/features/account/presentation/widgets/media_upload_modal.dart';
import 'package:Foodlify/features/home/presentation/cubit/post_ticket_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class TicketingPage extends StatefulWidget {
  const TicketingPage({super.key});

  @override
  State<TicketingPage> createState() => _TicketingPageState();
}

class _TicketingPageState extends State<TicketingPage> {
  TextEditingController messageConntroller = TextEditingController();
  String category = '';
  String? filePicked;
  File? newFile;
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? '');
      setState(() {
        filePicked = file.path.split(Platform.pathSeparator).last;
        newFile = file;
        print(filePicked);
      });
    } else {
      // User canceled the picker
    }
  }

  pickImageFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        filePicked = pickedFile.path.split(Platform.pathSeparator).last;
        newFile = imageFile;
        print(newFile);
      }
    });
  }

  pickImageFromeCamera() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        filePicked = pickedFile.path.split(Platform.pathSeparator).last;
        newFile = imageFile;
        print(newFile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: FoodlieColors.textColor,
            )),
        elevation: 0,
        title: TextSemiBold(
          'Ticketing',
          fontSize: 14,
          color: const Color(0xff363C4F),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            const Gap(30),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffF5F6F8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(50),
                        TextBody(
                          'Nature of Complaint',
                          fontSize: 13,
                          color: FoodlieColors.textColor,
                        ),
                        const Gap(16),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return const ComplainTypeModal();
                                }).then((value) {
                              setState(() {
                                category = value;
                              });
                            });
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: FoodlieColors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBody(
                                    category == ''
                                        ? 'Complaint Nature'
                                        : category,
                                    fontSize: 18,
                                    color: FoodlieColors.grey,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: FoodlieColors.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(16),
                        TextBody(
                          'FIle Upload',
                          fontSize: 13,
                          color: FoodlieColors.grey,
                        ),
                        const Gap(5),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return MediaUploadModal(
                                    onTapCamera: () {
                                      Navigator.pop(context);
                                      pickImageFromeCamera();
                                    },
                                    onTapGallery: () {
                                      Navigator.pop(context);
                                      pickImageFromGallery();
                                    },
                                  );
                                });
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff979899)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.uploadIcon,
                                ),
                                const Gap(8),
                                TextBold(
                                  'Evidence Upload',
                                  fontSize: 16,
                                  color: FoodlieColors.foodlieWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextSemiBold(filePicked ?? ''),
                        const Gap(16),
                        TextBody(
                          'Message',
                          fontSize: 13,
                          color: FoodlieColors.grey,
                        ),
                        const Gap(8),
                        Container(
                          height: 198,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: FoodlieColors.foodlieWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: TextField(
                              controller: messageConntroller,
                              maxLines: 100,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type in your message here',
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: FoodlieColors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(32),
                        BusyButton(
                          title: 'Submit Ticket',
                          onTap: () {
                            context.read<PostTicketCubit>().postTicket(context,
                                category: category,
                                filee: newFile ?? File(''),
                                message: messageConntroller.text);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
