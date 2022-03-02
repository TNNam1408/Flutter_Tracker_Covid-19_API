import 'package:flutter/material.dart';
import '../utils/constans.dart';

class NavigationOption extends StatelessWidget {
  const NavigationOption(
      {Key? key,
      required this.title,
      required this.seleted,
      required this.onSelected})
      : super(key: key);

  final String title;
  final bool seleted;
  final Function() onSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onSelected();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: seleted ? kPrimaryColor : Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          seleted
              ? Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),

                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
