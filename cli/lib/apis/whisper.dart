import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Whisper {
  final _url = 'https://whisper.lablab.ai/';
  Future<String> transcribe(List<int> bytes, WhisperLanguages language) async {
    final uri = _getUri(WhisperFeatures.asr);
    final request = http.MultipartRequest('POST', uri);
    final file = http.MultipartFile.fromBytes(
      'audio_file',
      bytes,
      filename: 'b.mp3',
    );
    request.files.add(file);
    request.fields.addAll({
      'task': 'transcribe',
      'language': language.name,
    });
    final response = await request.send();
    final body = await response.stream.bytesToString();
    return _jsonToMap(body)['text'];
  }

  Future<String> transcribeFromURL(
      String url, WhisperLanguages language) async {
    final bytes = await _getBytes(url);
    return transcribe(bytes, language);
  }

  Uri _getUri(WhisperFeatures feature) {
    return Uri.parse(_url + feature.name);
  }

  Future<List<int>> _getBytes(String url) async {
    final List<int> fileBytes = await http.readBytes(Uri.parse(url));

    return fileBytes;
  }

  Map<String, dynamic> _jsonToMap(String json) {
    try {
      return jsonDecode(json);
    } catch (e) {
      return {"text": ""};
    }
  }
}

enum WhisperFeatures {
  asr,
  detectLanguage,
  getSrt,
  getVtt,
}

extension WhisperFeaturesExtension on WhisperFeatures {
  String get name {
    switch (this) {
      case WhisperFeatures.asr:
        return 'asr';
      case WhisperFeatures.detectLanguage:
        return 'detect-language';
      case WhisperFeatures.getSrt:
        return 'get-srt';
      case WhisperFeatures.getVtt:
        return 'get-vtt';
    }
  }
}

enum WhisperLanguages {
  afrikaans,
  amharic,
  arabic,
  assamese,
  azerbaijani,
  bashkir,
  belarusian,
  bulgarian,
  bengali,
  tibetan,
  breton,
  bosnian,
  catalan,
  czech,
  welsh,
  danish,
  german,
  greek,
  english,
  spanish,
  estonian,
  basque,
  persian,
  finnish,
  faroese,
  french,
  galician,
  gujarati,
  hausa,
  hawaiian,
  hindi,
  croatian,
  haitian,
  hungarian,
  armenian,
  indonesian,
  icelandic,
  italian,
  hebrew,
  japanese,
  javanese,
  georgian,
  kazakh,
  khmer,
  kannada,
  korean,
  lao,
  luxembourgish,
  lingala,
  lithuanian,
  latvian,
  malagasy,
  maori,
  macedonian,
  malayalam,
  mongolian,
  marathi,
  malay,
  maltese,
  burmese,
  nepali,
  dutch,
  norwegianNynorsk,
  norwegian,
  occitan,
  punjabi,
  polish,
  pashto,
  portuguese,
  romanian,
  russian,
  sanskrit,
  sindhi,
  sinhalese,
  slovak,
  slovenian,
  shona,
  somali,
  albanian,
  serbian,
  sundanese,
  swedish,
  swahili,
  tamil,
  telugu,
  tajik,
  thai,
  turkmen,
  tagalog,
  turkish,
  tatar,
  uighur,
  ukrainian,
  urdu,
  uzbek,
  vietnamese,
  yiddish,
  yoruba,
  chinese
}

extension WhisperLanguagesExt on WhisperLanguages {
  String get name {
    switch (this) {
      case WhisperLanguages.afrikaans:
        return 'af';
      case WhisperLanguages.amharic:
        return 'am';
      case WhisperLanguages.arabic:
        return 'ar';
      case WhisperLanguages.assamese:
        return 'as';
      case WhisperLanguages.azerbaijani:
        return 'az';
      case WhisperLanguages.bashkir:
        return 'ba';
      case WhisperLanguages.belarusian:
        return 'be';
      case WhisperLanguages.bulgarian:
        return 'bg';
      case WhisperLanguages.bengali:
        return 'bn';
      case WhisperLanguages.tibetan:
        return 'bo';
      case WhisperLanguages.breton:
        return 'br';
      case WhisperLanguages.bosnian:
        return 'bs';
      case WhisperLanguages.catalan:
        return 'ca';
      case WhisperLanguages.czech:
        return 'cs';
      case WhisperLanguages.welsh:
        return 'cy';
      case WhisperLanguages.danish:
        return 'da';
      case WhisperLanguages.german:
        return 'de';
      case WhisperLanguages.greek:
        return 'el';
      case WhisperLanguages.english:
        return 'en';
      case WhisperLanguages.spanish:
        return 'es';
      case WhisperLanguages.estonian:
        return 'et';
      case WhisperLanguages.basque:
        return 'eu';
      case WhisperLanguages.persian:
        return 'fa';
      case WhisperLanguages.finnish:
        return 'fi';
      case WhisperLanguages.faroese:
        return 'fo';
      case WhisperLanguages.french:
        return 'fr';
      case WhisperLanguages.galician:
        return 'gl';
      case WhisperLanguages.gujarati:
        return 'gu';
      case WhisperLanguages.hausa:
        return 'ha';
      case WhisperLanguages.hawaiian:
        return 'haw';
      case WhisperLanguages.hindi:
        return 'hi';
      case WhisperLanguages.croatian:
        return 'hr';
      case WhisperLanguages.haitian:
        return 'ht';
      case WhisperLanguages.hungarian:
        return 'hu';
      case WhisperLanguages.armenian:
        return 'hy';
      case WhisperLanguages.indonesian:
        return 'id';
      case WhisperLanguages.icelandic:
        return 'is';
      case WhisperLanguages.italian:
        return 'it';
      case WhisperLanguages.hebrew:
        return 'iw';
      case WhisperLanguages.japanese:
        return 'ja';
      case WhisperLanguages.javanese:
        return 'jw';
      case WhisperLanguages.georgian:
        return 'ka';
      case WhisperLanguages.kazakh:
        return 'kk';
      case WhisperLanguages.khmer:
        return 'km';
      case WhisperLanguages.kannada:
        return 'kn';
      case WhisperLanguages.korean:
        return 'ko';
      case WhisperLanguages.latvian:
        return 'la';
      case WhisperLanguages.luxembourgish:
        return 'lb';
      case WhisperLanguages.lingala:
        return 'ln';
      case WhisperLanguages.lao:
        return 'lo';
      case WhisperLanguages.lithuanian:
        return 'lt';
      case WhisperLanguages.latvian:
        return 'lv';
      case WhisperLanguages.malagasy:
        return 'mg';
      case WhisperLanguages.maori:
        return 'mi';
      case WhisperLanguages.macedonian:
        return 'mk';
      case WhisperLanguages.malayalam:
        return 'ml';
      case WhisperLanguages.mongolian:
        return 'mn';
      case WhisperLanguages.marathi:
        return 'mr';
      case WhisperLanguages.malay:
        return 'ms';
      case WhisperLanguages.maltese:
        return 'mt';
      case WhisperLanguages.burmese:
        return 'my';
      case WhisperLanguages.nepali:
        return 'ne';
      case WhisperLanguages.dutch:
        return 'nl';
      case WhisperLanguages.norwegianNynorsk:
        return 'nn';
      case WhisperLanguages.norwegian:
        return 'no';
      case WhisperLanguages.occitan:
        return 'oc';
      case WhisperLanguages.punjabi:
        return 'pa';
      case WhisperLanguages.polish:
        return 'pl';
      case WhisperLanguages.pashto:
        return 'ps';
      case WhisperLanguages.portuguese:
        return 'pt';
      case WhisperLanguages.romanian:
        return 'ro';
      case WhisperLanguages.russian:
        return 'ru';
      case WhisperLanguages.sanskrit:
        return 'sa';
      case WhisperLanguages.sindhi:
        return 'sd';
      case WhisperLanguages.sinhalese:
        return 'si';
      case WhisperLanguages.slovak:
        return 'sk';
      case WhisperLanguages.slovenian:
        return 'sl';
      case WhisperLanguages.shona:
        return 'sn';
      case WhisperLanguages.somali:
        return 'so';
      case WhisperLanguages.albanian:
        return 'sq';
      case WhisperLanguages.serbian:
        return 'sr';
      case WhisperLanguages.sundanese:
        return 'su';
      case WhisperLanguages.swedish:
        return 'sv';
      case WhisperLanguages.swahili:
        return 'sw';
      case WhisperLanguages.tamil:
        return 'ta';
      case WhisperLanguages.telugu:
        return 'te';
      case WhisperLanguages.tajik:
        return 'tg';
      case WhisperLanguages.thai:
        return 'th';
      case WhisperLanguages.turkmen:
        return 'tk';
      case WhisperLanguages.tagalog:
        return 'tl';
      case WhisperLanguages.turkish:
        return 'tr';
      case WhisperLanguages.tatar:
        return 'tt';
      case WhisperLanguages.uighur:
        return 'ug';
      case WhisperLanguages.ukrainian:
        return 'uk';
      case WhisperLanguages.urdu:
        return 'ur';
      case WhisperLanguages.uzbek:
        return 'uz';
      case WhisperLanguages.vietnamese:
        return 'vi';
      case WhisperLanguages.yiddish:
        return 'yi';
      case WhisperLanguages.yoruba:
        return 'yo';
      case WhisperLanguages.chinese:
        return 'zh';
    }
  }
}

void main() async {
  final api = Whisper();
  final resp = await api.transcribeFromURL(
      'https://hope.fun.ac.jp/VEPaudiofiles/QuizUnits/SystemAdministrationA/VEP_Rawson_Thom_SystemAdministrationA_SubTextAudio4.mp3',
      WhisperLanguages.english);
  print(resp);
}
