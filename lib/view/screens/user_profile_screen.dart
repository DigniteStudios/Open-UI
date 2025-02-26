import 'package:flutter/material.dart';

import '../../core/extensions/text_theme_extension.dart';
import '../../shared/widgets/option_tile.dart';
import '../../shared/widgets/touchable.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.insert_photo_outlined, size: 40,),
            ),
            const SizedBox.square(dimension: 10),
            Text("Olivia James",
              style: context.headlineSmall,
            ),
            const SizedBox.square(dimension: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_outlined,
                  size: context.bodyLarge?.fontSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox.square(dimension: 3,),
                Text("+1 834 0570 746",
                  style: context.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox.square(dimension: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined,
                  size: context.bodyLarge?.fontSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox.square(dimension: 3,),
                Text("Toronto, Canada",
                  style: context.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox.square(dimension: 15),
            SizedBox(
              width: 200,
              child: PushButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {

                },
                label: "Edit Profile",
              ),
            ),

            const SizedBox.square(dimension: 20),

            OptionTile(
              title: "Personal Documents",
              onTap: () {

              },
            ),
            const SizedBox.square(dimension: 15),
            OptionTile(
              title: "Change Password",
              onTap: () {

              },
            ),
            const SizedBox.square(dimension: 15),
            OptionTile(
              title: "Notification Settings",
              onTap: () {

              },
            ),
            const SizedBox.square(dimension: 15),
            OptionTile(
              title: "Log Out",
              hideTrailing: true,
              textColor: Theme.of(context).colorScheme.error,
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
