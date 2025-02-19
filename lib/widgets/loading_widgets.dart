import 'package:ai_solution/constant/colors.dart';
import 'package:flutter/cupertino.dart';

class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        animating: true,
        color: kThirdColor,
      ),
    );
  }
}
