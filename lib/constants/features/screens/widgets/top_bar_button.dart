import 'package:amazonclone/constants/features/screens/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              ontap: () {},
            ),
            AccountButton(
              text: 'Buy Again',
              ontap: () {},
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(
              text: ' Your Account',
              ontap: () {},
            ),
            AccountButton(
              text: 'Logout',
              ontap: () {},
            )
          ],
        )
      ],
    );
  }
}
