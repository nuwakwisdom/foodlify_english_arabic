import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/home/domain/entities/orders_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NewOrdersDetails extends StatefulWidget {
  const NewOrdersDetails({
    super.key,
    required this.params,
  });
  final OrderDetailsArguement params;
  @override
  State<NewOrdersDetails> createState() => _NewOrdersDetailsState();
}

class _NewOrdersDetailsState extends State<NewOrdersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
        title: TextBold(
          'Order Details',
          fontSize: 17,
          color: const Color(0xff363C4F),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            OrderDetailsHeading(
              title: 'Order ID: ${widget.params.ordersDetails.order_id}',
            ),
            const Gap(11),
            RichText(
              text: TextSpan(
                text: 'Order date: ',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff363C4F),
                ),
                children: [
                  TextSpan(
                    text: '16-03-2023',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const Gap(5),
            RichText(
              text: TextSpan(
                text: 'No. of items: ',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff363C4F),
                ),
                children: [
                  TextSpan(
                    text: '1',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const Gap(5),
            TextBold(
              'Total amount: ${widget.params.ordersDetails.food.price}',
              fontSize: 13,
              color: const Color(0xff363C4F),
            ),
            const Gap(20),
            const OrderDetailsHeading(
              title: 'Item Description',
            ),
            const Gap(20),
            Container(
              height: 144,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                color: FoodlieColors.foodlieWhite,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Color(0xffDCDFE5),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 110,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.03),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.foodlieWhite,
                              ),
                              child: Center(
                                  child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                  widget.params.ordersDetails.food.image,
                                ),
                              )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 23,
                              width: 23,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.loveIcon,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextSemiBold(
                            widget.params.ordersDetails.food.title,
                            fontSize: 13,
                            color: const Color(0xff363C4F),
                          ),
                          TextBody(
                            widget.params.ordersDetails.food.description,
                            fontSize: 13,
                            color: const Color(0xff757575),
                          ),
                          const Gap(20),
                          TextBody(
                            '₦${widget.params.ordersDetails.food.price}',
                            fontSize: 15,
                            color: const Color(0xff363C4F),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrderDetailsHeading extends StatelessWidget {
  const OrderDetailsHeading({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffDCDFE5).withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextSemiBold(
              title,
              fontSize: 13,
              color: const Color(0xff363C4F),
            )
          ],
        ),
      ),
    );
  }
}

class OrderDetailsArguement {
  OrderDetailsArguement({
    required this.ordersDetails,
  });
  final OrdersEntity ordersDetails;
}
