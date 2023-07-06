import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final String? image;
  final IconData? icon;

  const MyButton(
      {super.key, required this.onPressed, required this.label, this.image, this.icon});

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return TextButton(
      onPressed: () => onPressed(),
      style: myTheme.textButtonTheme.style,
      child: SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowIfImageOrIcon(image: image, icon: icon),
            const SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: myTheme.textTheme.labelLarge
                  ?.copyWith(color: myTheme.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowIfImageOrIcon extends StatelessWidget {
  final String? image;
  final IconData? icon;
  const ShowIfImageOrIcon({super.key, required this.image, required this.icon});

  @override
  Widget build(BuildContext context) {
    if (image == null && icon == null) {
      return const SizedBox.shrink();
    } else if(image != null){
      return Image.network(
        image!,
        height: 25,
      );
    }else{
      return Icon(icon!);
    }
  }
}
