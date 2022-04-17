import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/components/custom_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/dotted_line.dart';

class PointsAndWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInformation = userData.data;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 5.0,
      width: MediaQuery.of(context).size.width,
      child: CustomCard(
        widget: Column(
          children: [
            //points
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/points.svg',
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
              title: const CustomText(
                text: 'Membership points',
                fontSize: 20,
              ),
              subtitle: CustomText(
                text: '${userInformation.points}points',
                fontSize: 15,
              ),
            ),
            const CustomDotedLine(),
            // wallet
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/wallet.svg',
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
              title: const CustomText(text: 'Cash Wallet', fontSize: 20),
              subtitle: CustomText(
                text: '${userInformation.credit} \$',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
