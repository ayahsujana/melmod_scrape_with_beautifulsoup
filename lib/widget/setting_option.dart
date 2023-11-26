import 'package:blocwithgetit/widget/title_custom.dart';
import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    Key? key,
    required this.title,
    this.icon,
    this.trailing,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final IconData? icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon == null
          ? null
          : Icon(
              icon,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      title: CustomTitle(title),
      subtitle: subtitle != null ? CustomTitle(subtitle, maxLines: 2,) : null,
      onTap: onTap,
      trailing: trailing,
    );
  }
}