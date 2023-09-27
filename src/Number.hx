
enum Representation {
    Arabic;
    Suits;
    Nucleobase;
    Ventureno;
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
        }
    }

    private static function baseFourForNumber(number:Int, representation:Representation):String {
        if (representation == Ventureno) return venturenoName(number);
        var sign = '';
        if (number < 0) {
            number *= -1;
            sign = '-';
        }
        return sign + if (number < 4)
            representationOfDigit(number, representation);
        else {
            var result = Std.int(number / 4);
            var remainder = number % 4;
            baseFourForNumber(result, representation) + representationOfDigit(remainder, representation);
        }
    }

    public function baseFour(representation:Representation):String {
        return baseFourForNumber(number, representation);
    }
}