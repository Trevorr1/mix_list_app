import 'package:flutter/material.dart';

class TypeFilterButton extends StatelessWidget {
  final String type;
  final bool isSelected;
  final VoidCallback onPressed;

  const TypeFilterButton({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    IconData getIconForType(String type) {
      switch (type.toLowerCase()) {
        case 'fire':
          return Icons.local_fire_department;
        case 'water':
          return Icons.water_drop;
        case 'ice':
          return Icons.ac_unit;
        case 'thunder':
          return Icons.bolt;
        case 'special':
          return Icons.star_rate;
        case 'curative':
          return Icons.local_pharmacy;
        case 'non-elemental':
          return Icons.light_mode;
        case 'restorative items':
          return Icons.local_pharmacy;
        case 'distillers':
          return Icons.filter_alt;
        case 'use items':
          return Icons.construction;
        case 'spheres':
          return Icons.language;
        case 'miscellaneous items':
          return Icons.category;
        default:
          return Icons.help_outline;
      }
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor:
            isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
        foregroundColor: isSelected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface,
      ),
      child: Icon(getIconForType(type)),
    );
  }
}
