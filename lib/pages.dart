import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pakar_alpin/model/question.dart';

class Pages extends StatefulWidget {
  const Pages({super.key, this.onChanged, required this.question});

  final ValueChanged<int>? onChanged;
  final Question question;

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    var question = widget.question;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(question.question, style: Theme.of(context).textTheme.headlineLarge),
            const Gap(100),
            Column(
              children: [
                for (var i = 0; i < question.options.length; i++) ...{
                  RadioListTile<int>(
                    title: Text(
                      question.options[i],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    value: i,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                      widget.onChanged!(i);
                    },
                  ),
                },
              ],
            )
          ],
        ),
      ),
    );
  }
}
