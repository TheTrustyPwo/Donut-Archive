import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final int pageNumber;
  final Widget image;
  final Animation<Offset> imageAnimation;

  const ImageDisplay({
    Key? key,
    required this.pageNumber,
    required this.image,
    required this.imageAnimation,
  }) : super(key: key);

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width - 2 * 32.0;
    final imageHeight = MediaQuery.of(context).size.height / 4;

    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          SlideTransition(
            position: imageAnimation,
            child: SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: Center(child: image),
            ),
          ),
        ],
      ),
    );
  }
}
