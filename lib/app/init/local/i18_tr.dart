import 'package:get/get.dart';

import 'tr/_ar.dart';
import 'tr/_de.dart';
import 'tr/_en.dart';
import 'tr/_hans.dart';
import 'tr/_hant.dart';
import 'tr/_it.dart';
import 'tr/_ja.dart';
import 'tr/_ko.dart';
import 'tr/_fr.dart';
import 'tr/_pt.dart';
import 'tr/_ru.dart';
import 'tr/_uk.dart';

class I18TRMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh': {...hans},
        'zh-CN': {...hans},
        'zh-HK': {...hant},
        'zh-MO': {...hant},
        'zh-TW': {...hant},
        'en': {...en},
        'en-GB': {...en}, // 英语-英国
        'en-US': {...en}, // 英语-美国
        'en-CA': {...en}, // 英语-加拿大
        'en-AU': {...en}, // 英语-澳大利亚
        'en-IN': {...en}, // 英语-印度
        'ko': {...ko},
        'ko-KR': {...ko},
        'ja': {...ja},
        'ja-JP': {...ja},
        'fr': {...fr},
        'fr-FR': {...fr}, // 法语-法国
        'fr-CA': {...fr}, // 法语-加拿大
        'de': {...de},
        'de-DE': {...de}, // 德语-德国
        'ru': {...ru},
        'ru-RU': {...ru}, //  俄语-俄罗斯
        'uk': {...uk}, // 乌克兰语
        'ar': {...ar},
        'ar-SA': {...ar},
        'ar-EG': {...ar},
        'ar-KW': {...ar},
        'it': {...it},
        'it-IT': {...it}, // 意大利语-意大利
        'it-CH': {...it}, // 意大利语-瑞士
        'pt': {...pt},
        'pt-PT': {...pt}, // 葡萄牙语-葡萄牙
        'pt-BR': {...pt}, // 葡萄牙语-巴西
      };
}
