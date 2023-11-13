import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/home/domain/entities/ticket_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({
    super.key,
    required this.params,
  });
  final TicketsArguement params;
  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.textColor,
          ),
        ),
        centerTitle: true,
        title: TextSemiBold(
          'Ticket Details',
          fontSize: 14,
          color: FoodlieColors.textColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(30),
              TicketDetailsItem(
                title: 'Ticket ID:',
                details: widget.params.ticketEntity.ticket_id ?? '',
              ),
              /* TicketDetailsItem(
                title: 'Against:',
                details: 'QTT Restaurant',
              ),*/
              TicketDetailsItem(
                title: 'Ticket type:',
                details: widget.params.ticketEntity.category ?? '',
              ),
              /* TicketDetailsItem(
                title: 'Date:',
                details: '04.07.2023',
              ),*/
              /*  TicketDetailsItem(
                title: 'Time:',
                details: '11:28',
              ),*/
              TicketDetailsItem(
                title: 'Status:',
                details: widget.params.ticketEntity.status ?? '',
              ),
              TicketDetailsItem(
                title: 'Complaint:',
                details: widget.params.ticketEntity.message ?? '',
              ),
              const Gap(20),
              widget.params.ticketEntity.file != null
                  ? CachedNetworkImage(
                      errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: FoodlieColors.primaryColor,
                            size: 30,
                          ),
                      imageUrl: widget.params.ticketEntity.file ?? '',
                      height: 300,
                      width: 300,
                      placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                            color: FoodlieColors.primaryColor,
                          )))
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class TicketsArguement {
  TicketsArguement({
    required this.ticketEntity,
  });
  final TicketEntity ticketEntity;
}

class TicketDetailsItem extends StatelessWidget {
  const TicketDetailsItem({
    super.key,
    required this.title,
    required this.details,
  });
  final String title;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: TextSemiBold(
                title,
                fontSize: 13,
                color: FoodlieColors.grey,
              ),
            ),
            const Gap(32),
            Expanded(
              child: TextBold(
                details,
                fontSize: 13,
                color: FoodlieColors.grey,
                maxLines: 20,
              ),
            )
          ],
        ),
        const Gap(21),
      ],
    );
  }
}
