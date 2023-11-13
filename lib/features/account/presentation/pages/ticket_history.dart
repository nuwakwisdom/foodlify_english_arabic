import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/account/presentation/pages/ticket_details.dart';
import 'package:Foodlify/features/home/domain/entities/ticket_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/post_ticket_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TicketHistory extends StatefulWidget {
  const TicketHistory({super.key});

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  int pageNumber = 0;
  late ScrollController scrollController;
  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        pageNumber++;
        print(pageNumber);
        context.read<PostTicketCubit>().getTicket(context, page: pageNumber);
      });
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {});
    }
  }

  bool loadingPagination = false;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    super.initState();
  }

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
          'Ticketing History',
          fontSize: 14,
          color: FoodlieColors.textColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              BlocBuilder<PostTicketCubit, PostTicketState>(
                builder: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      loading: () {
                        loadingPagination = true;
                      },
                      error: () {
                        loadingPagination = false;
                      },
                      success: () {
                        loadingPagination = false;
                      });
                  final tickets =
                      context.read<PostTicketCubit>().paginatedTickets;
                  return Column(
                    children: List.generate(tickets?.length ?? 0, (index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.ticketDetails,
                                arguments: TicketsArguement(
                                  ticketEntity:
                                      tickets?[index] ?? const TicketEntity(),
                                ),
                              );
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 37,
                              width: 37,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient:
                                      FoodlifyLinearColors.containerLinear),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.ticketIcon,
                                  height: 14,
                                  width: 18,
                                ),
                              ),
                            ),
                            title: TextSemiBold(
                              tickets?[index].category ?? '',
                              fontSize: 13,
                              color: FoodlieColors.foodlieBlack,
                            ),
                            subtitle: TextBody(
                              tickets?[index].ticket_id ?? '',
                              fontSize: 10,
                              color: FoodlieColors.grey1,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: const Color(0xff979899).withOpacity(0.2),
                          )
                        ],
                      );
                    }),
                  );
                },
              ),
              loadingPagination
                  ? Platform.isAndroid
                      ? const Align(
                          child: CircularProgressIndicator(
                            color: FoodlieColors.primaryColor,
                          ),
                        )
                      : const Align(
                          child: CupertinoActivityIndicator(
                            color: FoodlieColors.primaryColor,
                          ),
                        )
                  : const SizedBox(),
              const Gap(30)
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyTicketHistory extends StatefulWidget {
  const EmptyTicketHistory({super.key});

  @override
  State<EmptyTicketHistory> createState() => _EmptyTicketHistoryState();
}

class _EmptyTicketHistoryState extends State<EmptyTicketHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextBody(
            'oopss!!, you don’t have any\nhistory yet, create a new ticket\nfirst , then you’ll have a history',
            fontSize: 14,
            maxLines: 10,
            textAlign: TextAlign.center,
          ),
          const Gap(100),
          BusyButton(
            title: 'Create Ticket',
            onTap: () {
              Navigator.pushNamed(context, RouteName.ticketingPage);
            },
          ),
        ],
      ),
    );
  }
}
