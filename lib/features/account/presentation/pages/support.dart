// ignore_for_file: lines_longer_than_80_chars, deprecated_member_use

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/account/presentation/widgets/ticket_option_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  _launchURL({required String newurl}) async {
    var url = newurl;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        title: TextSemiBold(
          'Support',
          fontSize: 14,
          color: const Color(0xff363C4F),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBody(
                  "Dear esteemed customer, thank you for utilizing our application. We take great pleasure in serving you. For any inquiries or support, please don't hesitate to reach out to us at.",
                  fontSize: 13,
                  maxLines: 10,
                  color: const Color(0xff676262),
                ),
                const Gap(26),
                TextSemiBold(
                  'Office',
                  fontSize: 13,
                  color: const Color(0xff363C4F),
                ),
                const Gap(15),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF5F6F8),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: const Color(0xffF5F6F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {},
                        leading: Container(
                          height: 29,
                          width: 29,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.primaryColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.locationIcon2,
                              color: FoodlieColors.foodlieWhite,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                        title: TextBody(
                          'Wuse Abuja, Nigeria',
                          fontSize: 13,
                          color: const Color(0xff676262),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Container(
                          height: 1,
                          color: const Color(0xff979889).withOpacity(0.2),
                        ),
                      ),
                      ListTile(
                        tileColor: const Color(0xffF5F6F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {},
                        leading: Container(
                          height: 29,
                          width: 29,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.primaryColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.phone3,
                              color: FoodlieColors.foodlieWhite,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                        title: TextBody(
                          '+2349060337133',
                          fontSize: 13,
                          color: const Color(0xff676262),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Container(
                          height: 1,
                          color: const Color(0xff979889).withOpacity(0.2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Container(
                          height: 1,
                          color: const Color(0xff979889).withOpacity(0.2),
                        ),
                      ),
                      ListTile(
                        tileColor: const Color(0xffF5F6F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {},
                        leading: Container(
                          height: 29,
                          width: 29,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.primaryColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.globeIcon2,
                              color: FoodlieColors.foodlieWhite,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                        title: TextBody(
                          'foodlify.com',
                          fontSize: 13,
                          color: const Color(0xff676262),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),
                Container(
                  height: 344,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF5F6F8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextBold(
                          'Contact Us',
                          fontSize: 16,
                          color: FoodlieColors.textColor,
                        ),
                        const Gap(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialContainer(
                              image: AppAssets.twitter,
                              imgHeight: 60,
                              imgWidth: 60,
                              onTap: () {
                                _launchURL(
                                    newurl:
                                        'https://twitter.com/foodlify_/status/1706590341061657035?s=46&t=NKKfX3c3jDHFjf-mZZlKBA');
                              },
                            ),
                            const Gap(24),
                            SocialContainer(
                                image: AppAssets.instagram,
                                onTap: () {
                                  _launchURL(
                                      newurl:
                                          'https://www.instagram.com/p/CxkYmtJMg0K/?igshid=MzRlODBiNWFlZA==');
                                }),
                            const Gap(24),
                            SocialContainer(
                              image: AppAssets.whatsapp,
                              onTap: () {},
                            )
                          ],
                        ),
                        const Gap(52),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SupportOptions(
                              icon: AppAssets.ticketIcon,
                              title: 'Tickets',
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) =>
                                      const TicketOptionModal(),
                                );
                              },
                            ),
                            const Gap(16),
                            SupportOptions(
                              icon: AppAssets.chatIcon,
                              title: 'Chat AI',
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                /*
                const Gap(17),
                TextSemiBold(
                  'Socials',
                  fontSize: 13,
                  color: const Color(0xff363C4F),
                ),
                const Gap(17),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F6F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: const Color(0xffF5F6F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {},
                        leading: Container(
                          height: 29,
                          width: 29,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.primaryColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.instagramIcon,
                              color: FoodlieColors.foodlieWhite,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                        title: TextBody(
                          '@foodlify_',
                          fontSize: 13,
                          color: const Color(0xff676262),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Container(
                          height: 1,
                          color: const Color(0xff979889).withOpacity(0.2),
                        ),
                      ),
                      ListTile(
                        tileColor: const Color(0xffF5F6F8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {},
                        leading: Container(
                          height: 29,
                          width: 29,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.primaryColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.fbIcon,
                              color: FoodlieColors.foodlieWhite,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                        title: TextBody(
                          'foodlify_',
                          fontSize: 13,
                          color: const Color(0xff676262),
                        ),
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SupportOptions extends StatelessWidget {
  const SupportOptions(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  final String icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 122,
        width: 122,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFD654D),
                Color(0xffFD674C),
                Color(0xffFC6748),
                Color(0xffF38A2B),
                Color(0xffF38B2A),
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
            ),
            const Gap(18),
            TextBold(
              title,
              color: const Color(0xffFFE8D2),
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    super.key,
    required this.image,
    required this.onTap,
    this.imgHeight = 32,
    this.imgWidth = 32,
  });
  final String image;
  final VoidCallback onTap;
  final double imgHeight;
  final double imgWidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: FoodlieColors.foodlieWhite,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: FoodlieColors.foodlieBlack.withOpacity(0.25),
                offset: const Offset(0, 4),
              )
            ]),
        child: Center(
          child: Image.asset(
            image,
            height: imgHeight,
            width: imgWidth,
          ),
        ),
      ),
    );
  }
}
