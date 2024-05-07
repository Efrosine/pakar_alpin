import 'package:pakar_alpin/model/skincare.dart';

class MatchingBit {
  int matchingBit(String answer, String key) {
    int count = 0;
    for (int i = 0; i < answer.length; i++) {
      if (answer[i] == key[i] && answer[i] == '1') {
        count++;
      }
    }
    return count;
  }

  List<SkinCare> getMaxMatching(String answer) {
    List<SkinCare> result = [];
    int max = 0;
    for (var i = 0; i < listSkinCare.length; i++) {
      int count = matchingBit(answer, listSkinCare[i].binary);
      if (count > max) {
        max = count;
        result = [listSkinCare[i]];
      } else if (count == max && count != 0) {
        result.add(listSkinCare[i]);
      }
    }
    return result;
  }

  String result(String answer) {
    var temp = getMaxMatching(answer);
    int count = temp.length;

    if (count == 0) {
      return 'Tidak ada rekomendasi';
    } else if (count == 1) {
      return temp.first.name;
    } else {
      return 'Ada beberapa rekomendasi :\n ${temp.map((e) => '- ${e.name}').join('\n')}';
    }
  }
}
