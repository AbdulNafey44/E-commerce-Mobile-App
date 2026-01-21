import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(label: Text('Red'), selected: true, onSelected: (value){},labelStyle: TextStyle(color: UColors.white),);
  }
}