import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/core/widgets/custom_textformfiled.dart';
import 'package:machine_test/src/presentation/core/widgets/primary_button.dart';
import 'package:machine_test/src/presentation/view/home/register_screen/widgets/custom_appbar.dart';
import 'package:machine_test/src/presentation/view/home/register_screen/widgets/custom_register_dropdown.dart';
import 'package:machine_test/src/presentation/view/home/register_screen/widgets/radio_buttons.dart';
import 'package:machine_test/src/presentation/view/home/register_screen/widgets/treatments_list_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final space = SizedBox(
    height: 20.h,
  );
  final _selectedBranch = ValueNotifier<String?>(null);
  final _selectedLocation = ValueNotifier<String?>(null);
  final _selectedPaymentMethod = ValueNotifier<String?>(null);
  final _nameController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _addressController = TextEditingController();
  final _totalAmountController = TextEditingController(text: "");
  final _discountAmountController = TextEditingController(text: "");
  final _advanceAmountController = TextEditingController(text: "");
  final _balanceAmountController = TextEditingController(text: "");
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NamedAppBar(title: "Register"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: ListView(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(labelText: "Name", hintText: "Enter Your Name", controller: _nameController),
            space,
            CustomTextFormField(labelText: "Whatsapp Number", hintText: "Enter Your Whatsapp Number", controller: _whatsappController),
            space,
            CustomTextFormField(labelText: "Address", hintText: "Enter Your Address ", controller: _addressController),
            space,
            RegisterDropDown(
              labelText: "Location",
              hintText: "Choose Your Location",
              items: const ["Kozhikode", "Kannur", "Malapuram"],
              selectedItemNotifier: _selectedLocation,
            ),
            space,
            RegisterDropDown(
              labelText: "Branch",
              hintText: "Select the Branch",
              items: const ["Branch1", "Brnach2", "Branch3"],
              selectedItemNotifier: _selectedBranch,
            ),
            space,
            const TreatmentsListWidget(
              treatmentList: [],
            ),
            space,
            PrimaryButton(
              onPressed: () {},
              text: "+ Add  Treatments",
              color: AppColors.lightGreen,
              fontStyle: AppTypography.poppinsRegular.copyWith(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
            space,
            CustomTextFormField(readOnly: true, labelText: "Total Amount", hintText: "", controller: _totalAmountController),
            space,
            CustomTextFormField(readOnly: true, labelText: "Discount Amount", hintText: "", controller: _discountAmountController),
            space,
            RadioButtonWidget(
              selectedValueNotifier: _selectedPaymentMethod,
              labelText: "Payment Option",
              options: const ["cash", "Card", "UPI"],
            ),
            space,
            CustomTextFormField(readOnly: true, labelText: "Advance Amount", hintText: "", controller: _advanceAmountController),
            space,
            CustomTextFormField(readOnly: true, labelText: "Balance Amount", hintText: "", controller: _balanceAmountController),
            space,
            CustomTextFormField(
                onTap: () async {
                  final selectedDate = await AppHelper.selectDate(context);
                  _dateController.text = selectedDate ?? "";
                },
                labelText: "Treatment Date",
                hintText: "",
                controller: _dateController,
                readOnly: true,
                suffixIcon: Image.asset(AppImages.calanderIcon)),
            space,

            PrimaryButton(
              onPressed: () {},
              text: "Save",
            ),
            SizedBox(
              height: 65.h,
            )
          ],
        ),
      ),
    );
  }
}
