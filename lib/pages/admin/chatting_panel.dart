import 'package:flutter/cupertino.dart';

class ChattingPanel extends StatefulWidget {
  const ChattingPanel({super.key});

  @override
  State<ChattingPanel> createState() => _ChattingPanelState();
}

class _ChattingPanelState extends State<ChattingPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 3),
          width: MediaQuery.of(context).size.width * 1 - 70,
          height: 50,
          color: const Color.fromRGBO(34, 34, 34, 1),
        )
      ],
    );
  }
}
