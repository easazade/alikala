import 'package:alikala/core/constants.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:alikala/widgets/app_section_separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                Expanded(child: Text(S.of(context).addNewAddress, style: TextStyles.dark_14_w500)),
                Icon(CupertinoIcons.forward, size: 19, color: Colors.black54),
              ],
            ),
          ),
          AppSectionSeparator(height: 10),
          _createAddressItem('Iran - Rasht - My House', 'Rasht', '09117158746')
        ],
      ),
    );
  }

  Widget _createAddressItem(String address, String city, String phoneNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        children: [
          Text(address, style: TextStyles.dark_16),
          SizedBox(height: 10),
          Row(children: [
            Icon(Icons.water_damage_rounded, size: 16, color: Colors.blueGrey),
            SizedBox(width: 6),
            Text(city, style: TextStyle(color: Colors.blueGrey, fontSize: 12))
          ]),
          SizedBox(height: 5),
          Row(children: [
            Icon(Icons.phone_android_outlined, size: 16, color: Colors.blueGrey),
            SizedBox(width: 6),
            Text(phoneNumber, style: TextStyle(color: Colors.blueGrey, fontSize: 12))
          ]),
          SizedBox(height: 10),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(child: Text(S.current.editAddress), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
