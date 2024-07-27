import 'package:flutter/material.dart';

class HomeScreenTitleSection extends StatelessWidget {
  const HomeScreenTitleSection({super.key, required this.headerTitle, required this.onTapCallBack});

  final String headerTitle;
  final void Function() onTapCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.green),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                headerTitle,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              )),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: onTapCallBack,
              child: Container(
                  alignment: Alignment.centerRight,
                  child: const Text("View All", style: TextStyle(fontWeight: FontWeight.w400),)),
            ),
          )
        ],
      ),
    );
  }
}
