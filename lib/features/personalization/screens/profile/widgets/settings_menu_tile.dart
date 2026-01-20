import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class SettingProfileTile extends StatelessWidget {
  const SettingProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Iconsax.home),
      title: Text('My Addresses', style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text('Set Shopping Deliver Address', style: Theme.of(context).textTheme.labelMedium),

    );
  }
}