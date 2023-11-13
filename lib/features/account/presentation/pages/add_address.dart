import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/account/presentation/cubit/update_adress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
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
          'Add Address',
          fontSize: 17,
          color: const Color(0xff363C4F),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              TextSemiBold(
                'Contact name',
                fontSize: 13,
                color: FoodlieColors.foodlieBlack.withOpacity(0.4),
              ),
              const Gap(10),
              InputField(
                controller: contactNameController,
                placeholder: 'contact name',
              ),
              const Gap(20),
              TextSemiBold(
                'Address',
                fontSize: 13,
                color: FoodlieColors.foodlieBlack.withOpacity(0.4),
              ),
              const Gap(10),
              InputField(
                controller: addressController,
                placeholder: 'Address',
              ),
              const Gap(20),
              TextSemiBold(
                'Address phone number',
                fontSize: 13,
                color: FoodlieColors.foodlieBlack.withOpacity(0.4),
              ),
              const Gap(10),
              InputField(
                controller: phoneNumber,
                placeholder: 'Address phone number',
              ),
              const Gap(70),
              BusyButton(
                title: 'Done',
                onTap: () async {
                  await context.read<UpdateAdressCubit>().UpdateAddress(
                        context,
                        contact_name: contactNameController.text,
                        address: addressController.text,
                        phone_number: phoneNumber.text,
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
