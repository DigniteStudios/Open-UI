import 'package:flutter/material.dart';

import '../../core/extensions/text_theme_extension.dart';
import '../../shared/widgets/funds_card.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Wallet"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          children: [
            const Text("Add funds to your wallet, send tips to other users, and withdraw your earnings whenever you need. Keep track of your balance and enjoy seamless transactions within the app!"),

            SizedBox(
                height: 250.0,
              child: Row(
                spacing: 10,
                children: [
                  const Expanded(
                    child: FundsCard(cardType: CardType.balance),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //       gradient: const LinearGradient(
                    //         colors: [
                    //           Color(0xFF65D3EB),
                    //           Color(0xFF0390A0)
                    //         ]
                    //     )
                    //   ),
                    //   padding: const EdgeInsets.symmetric(
                    //     vertical: 20,
                    //     horizontal: 20
                    //   ).copyWith(top: 5),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Image.asset(Assets.walletIcon, height: 100,),
                    //       const Spacer(),
                    //       Text("Available Balance",
                    //         style: context.bodyMedium?.copyWith(
                    //         color: Colors.white
                    //       ),),
                    //       Text("\$2,490.00", style: context.headlineMedium?.copyWith(
                    //           color: Colors.white,
                    //         fontWeight: FontWeight.w600
                    //       ),),
                    //     ],
                    //   ),
                    // ),
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      const Flexible(
                        child: FundsCard(cardType: CardType.withdraw),
                      ),
                      const Flexible(
                        child: FundsCard(cardType: CardType.funds),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF65D3EB),
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
                                    child: Text("Withdraw Now",
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
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
