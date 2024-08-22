import 'package:flutter/material.dart';

class AccountItem {
  final String label;
  final Widget iconPath;

  AccountItem(this.label, this.iconPath);
}

List<AccountItem> accountItems = [
  AccountItem("Orders", Icon(Icons.shopping_bag_outlined)),
  AccountItem("My Details", Icon(Icons.insert_drive_file_outlined)),
  AccountItem("Delivery Access", Icon(Icons.location_on_outlined)),
  AccountItem("Payment Methods", Icon(Icons.payment_rounded)),
  AccountItem("Promo Card", Icon(Icons.card_giftcard_sharp)),
  AccountItem("Notifications", Icon(Icons.notifications)),
  AccountItem("Help", Icon(Icons.help_outline_rounded)),
  AccountItem("About", Icon(Icons.error_outline)),
];
