import 'package:flutter/material.dart';

import '../../core/constants/image_constants.dart';
import '../../core/extensions/text_theme_extension.dart';

enum CardType {
    balance,
    withdraw,
    funds,
}

class FundsCard extends StatelessWidget {
  final CardType cardType;
  const FundsCard({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    if(cardType == CardType.balance) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [
                  Color(0xFF65D3EB),
                  Color(0xFF0390A0)
                ]
            )
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20
        ).copyWith(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.walletIcon, height: 100,),
            const Spacer(),
            Text("Available Balance",
              style: context.bodyMedium?.copyWith(
                  color: Colors.white
              ),),
            Text("\$2,490.00", style: context.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),),
          ],
        ),
      );
    }
    else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF0390A0),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Funds Withdrawn",
              style: context.labelSmall?.copyWith(
                  color: Colors.white
              ),),
            const SizedBox.square(dimension: 5,),
            Text("\$ 250.00",
              style: context.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(cardType == CardType.withdraw ? "Withdraw Now" : "",
                    style: context.labelSmall?.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white
                    ),
                  ),
                ),
                const Icon(Icons.north_east_rounded, color: Colors.white, size: 40,),
              ],
            )
          ],
        ),
      );
    }
  }
}
