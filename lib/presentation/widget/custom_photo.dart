import 'package:flutter/cupertino.dart';

class CustomPhoto extends StatelessWidget {
  final String image;
  const CustomPhoto({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(image)
          )
      ),
    );
  }
}
