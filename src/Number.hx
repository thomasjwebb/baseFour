
enum Representation {
    Arabic;
    Suits;
    Nucleobase;
    Ventureno;
    NorthernPame;
    Yuki;
}

class Number
{
    private var number:Int;

    public function new(number:Int) {
        this.number = number;
    }

    private static function venturenoName(number:Int):String {
        return switch number {
            case 1:  "pake'et";
            case 2:  "'iškom̓";
            case 3:  "masǝx";
            case 4:  "tskumu";
            case 5:  "yǝtipake'es";
            case 6:  "yǝti'iškom̓";
            case 7:  "yǝtimasǝx";
            case 8:  "malawa";
            case 9:  "tspa";
            case 10: "ka'aškom";
            case 11: "tǝlu";
            case 12: "masǝx tskumu";
            case 13: "masǝx tskumu kampake'et";
            case 14: "'iškom̓ laliet";
            case 15: "pake'et siwe (tšikipš)";
            case 16: "tšikipš";
            case 17: "tšikipš kampake'et";
            case 18: "'iškom̓ siwe tskumu'uy";
            case 19: "pake'et siwe tskumu'uy";
            case 20: "tskumu'uy";
            case 21: "tskumu'uy kampake'et";
            case 22: "'iškom̓ siwe itsmaxmasǝx";
            case 23: "pake'et siwe itsmaxmasǝx";
            case 24: "itsmaxmasǝx";
            case 25: "itsmaxmasǝx kampake'et";
            case 26: "'iškom̓ siwe yitimasǝx";
            case 27: "pake'et siwe yitimasǝx";
            case 28: "yitimasǝx";
            case 29: "yitimasǝx kampake'et";
            case 30: "'iškom̓ siwe 'iškom̓ tšikipš";
            case 31: "pake'et siwe 'iškom̓ tšikipš";
            case 32: "'iškom̓ tšikipš"; // highest recorded number, in any Chumashan language
            case 33: "'iškom̓ tšikipš kampake'et"; // my reasonable speculation
            default: '(unknown)'; // we don't know because every four numbers is a unique name
        }
    }

    private static inline var PAME_TEENS = 'kara tenhiuñ';
    private static inline var PAME_TWENTIES = 'kanuje tenhiuñ';
    private static inline var PAME_THIRTIES = "karnu' tenhiuñ";

    private static function pameName(number:Int):String {
        return switch number {
            case 1:  "sante";
            case 2:  "nuji";
            case 3:  "rnu'";
            case 4:  "giriui";
            case 5:  "gitçai";
            case 6:  "teria";
            case 7:  "teriuhiñ";
            case 8:  "tenhiuñ";
            case 9:  '${PAME_TEENS} santa';
            case 10: '${PAME_TEENS} nuji';
            case 11: '${PAME_TEENS} rnup';
            case 12: '${PAME_TEENS} giriũi';
            case 13: '${PAME_TEENS} gitçaĩ';
            case 14: '${PAME_TEENS} teria';
            case 15: '${PAME_TEENS} teriuhiñ';
            case 16: PAME_TWENTIES;
            case 17: '${PAME_TWENTIES} sante';
            case 18: '${PAME_TWENTIES} nuji';
            case 19: '${PAME_TWENTIES} rnu\'';
            case 20: '${PAME_TWENTIES} giriũi';
            case 21: '${PAME_TWENTIES} gitçaĩ';
            case 22: '${PAME_TWENTIES} tiria';
            case 23: '${PAME_TWENTIES} teriuhiñ';
            case 24: PAME_THIRTIES;
            case 25: '${PAME_THIRTIES} santa';
            case 26: '${PAME_THIRTIES} nuji';
            case 27: '${PAME_THIRTIES} rnu\'';
            case 28: '${PAME_THIRTIES} giriũi';
            case 29: '${PAME_THIRTIES} gitçaĩ';
            case 30: '${PAME_THIRTIES} tiria';
            case 31: '${PAME_THIRTIES} tiriuhiñ';
            case 32: 'giriũi tenhiuñ';
            default: '(unknown)';
        }
    }

    private static function yukiName(number:Int):String {
        return switch number {
            case 1:  'pa-wi';
            case 2:  'op-i';
            case 3:  'molm-i';
            case 4:  'o-mahat';
            case 5:  'hui-ko';
            case 6:  'mikas-tcil-ki';
            case 7:  'mikas-ko';
            case 8:  'paum-pat';
            case 9:  'hutcam-pawi-pan';
            case 10: 'hutcam-opi-sul';
            case 11: 'momil-sul';
            case 12: 'o-mahat-sul';
            case 13: 'huijo-sul';
            case 14: 'mikstcilki-sul';
            case 15: 'mikasko-sul';
            case 16: 'huicot';
            case 17: 'pawi-hui-luk';
            case 18: 'opi-hui-luk';
            case 19: 'molmi-hui-poi';
            case 20: 'omahat-hui-poi';
            case 64: 'omahat-tc-am-op';
            default: '(unknown)';
        }
    }

    private static function representationOfDigit(baseFourNumber:Int, representation:Representation):String {
        return switch representation {
            case Arabic:
                Std.string(baseFourNumber);
            case Suits:
                switch baseFourNumber {
                    case 0: '♠';
                    case 1: '♥';
                    case 2: '♦';
                    case 3: '♣';
                    default: '';
                }
            case Nucleobase:
                switch baseFourNumber {
                    case 0: 'A';
                    case 1: 'C';
                    case 2: 'T';
                    case 3: 'G';
                    default: '';
                }
            case Ventureno:
                ''; // not implemented this way
            case NorthernPame:
                ''; // not implemented this way
            case Yuki:
                '';
        }
    }

    private static function baseNConverter(number:Int, base:Int, representation:Representation):String {
        if (representation == Ventureno) return venturenoName(number);
        if (representation == NorthernPame) return pameName(number);
        if (representation == Yuki) return yukiName(number);
        var sign = '';
        if (number < 0) {
            number *= -1;
            sign = '-';
        }
        return sign + if (number < base)
            representationOfDigit(number, representation);
        else {
            var result = Std.int(number / base);
            var remainder = number % base;
            baseFourForNumber(result, representation) + representationOfDigit(remainder, representation);
        }
    }

    private static function baseFourForNumber(number:Int, representation:Representation):String {
        return baseNConverter(number, 4, representation);
    }

    private static function baseNForNumber(number:Int, base:Int):String {
        return baseNConverter(number, base, Arabic);
    }

    public function baseFour(representation:Representation):String {
        return baseFourForNumber(number, representation);
    }

    public function octal():String {
        return baseNForNumber(number, 8);
    }
}