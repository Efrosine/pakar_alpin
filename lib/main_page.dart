import 'package:flutter/material.dart';
import 'package:pakar_alpin/helper/float_button.dart';
import 'package:pakar_alpin/helper/matching_bit.dart';
import 'package:pakar_alpin/pages.dart';
import 'package:pakar_alpin/model/question.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<String> binaries;
  int pageIndex = 0;
  PageController pc = PageController();

  @override
  void initState() {
    binaries = resetBinaries();
    super.initState();
  }

  List<String> resetBinaries() {
    return List.generate(listQuestions.length, (index) {
      String temp = '';
      for (var i = 0; i < listQuestions[index].options.length; i++) {
        temp += i == 0 ? '1' : '0';
      }
      return temp;
    });
  }

  Future<dynamic> showResult(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Hasil'),
        content: Text(
          MatchingBit().result(binaries.join('')),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: () {
              binaries.clear();
              binaries = resetBinaries();
              pc.jumpToPage(0);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isNotLastPage = pageIndex < listQuestions.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistem Pakar Alpin', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Opacity(
            opacity: pageIndex == 0 ? 0 : 1,
            child: FloatButton(
              label: 'Prev',
              icon: Icons.arrow_back,
              onPressed: () =>
                  pc.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear),
            ),
          ),
          Text('${pageIndex + 1} / ${listQuestions.length}'),
          FloatButton(
              label: isNotLastPage ? 'Next' : 'Done',
              icon: isNotLastPage ? Icons.arrow_forward : Icons.done,
              rightPostIcon: true,
              onPressed: () {
                // print('$isNotLastPage $pageIndex / ${listQuestions.length}');
                if (isNotLastPage) {
                  pc.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                } else {
                  showResult(context);
                }
              }),
        ],
      ),
      body: PageView.builder(
        controller: pc,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        itemCount: listQuestions.length,
        itemBuilder: (BuildContext context, int index) => Pages(
          question: listQuestions[index],
          onChanged: (value) {
            String temp = '';
            for (int i = 0; i < listQuestions[index].options.length; i++) {
              if (i == value) {
                temp += '1';
              } else {
                temp += '0';
              }
            }
            binaries[index] = temp;
          },
        ),
      ),
    );
  }
}
