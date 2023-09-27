
enum Representation {
    Arabic;
    Suits;
    Nucleobase;
}

class Number
{
    private var number:Int;

    public function new(number:Int) {
        this.number = number;
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
        }
    }

    private static function baseFourForNumber(number:Int, representation:Representation):String {
        return if (number < 4)
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