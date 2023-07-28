import 'package:alikala/generated/l10n.dart';
import 'package:alikala/widgets/app_section_separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          AppSectionSeparator(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Icon(Icons.add_location_alt_outlined, color: Colors.blueGrey),
                SizedBox(width: 10),
                Expanded(child: Text(S.of(context).addNewAddress, style: theme.textTheme.labelSmall)),
                Icon(CupertinoIcons.forward, size: 19, color: Colors.black54),
              ],
            ),
          ),
          AppSectionSeparator(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              children: [
                Text('Iran - Rasht - My House', style: theme.textTheme.bodyMedium),
                SizedBox(height: 10),
                Row(children: [
                  Icon(Icons.water_damage_rounded, size: 16, color: Colors.blueGrey),
                  SizedBox(width: 6),
                  Text('Rasht', style: TextStyle(color: Colors.blueGrey, fontSize: 12))
                ]),
                SizedBox(height: 5),
                Row(children: [
                  Icon(Icons.phone_android_outlined, size: 16, color: Colors.blueGrey),
                  SizedBox(width: 6),
                  Text('09117158746', style: TextStyle(color: Colors.blueGrey, fontSize: 12))
                ]),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton(child: Text(S.current.editAddress), onPressed: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
