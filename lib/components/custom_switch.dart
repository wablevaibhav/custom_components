import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.onChanged,
    required this.isSwitched,
  });

  final bool isSwitched;
  final GestureTapCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isSwitched
                        ? Theme.of(context).primaryColor
                        : Colors.white),
                child: Center(
                    child: Text(
                  'LIGHT',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSwitched
                          ? Theme.of(context).canvasColor
                          : Colors.black),
                )),
              ),
              Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isSwitched
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).primaryColor),
                child: Center(
                    child: Text(
                  'DARK',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSwitched ? Colors.white : Colors.black),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
