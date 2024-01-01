import js.Browser;
import js.html.InputElement;

typedef Pair = {
    label:String,
    value:String
}

class Main
{
    static function main() {
        var input:InputElement = cast Browser.document.getElementById("numberEntry");
        var output = Browser.document.getElementById("numberRepresentation");
        var updateDisplay = () -> {
            var value:Null<Int> = Std.parseInt(input.value);
            var innerHTML = if (value == null) '';
            else {
                var number = new Number(value);
                var outputs = new Array<Pair>();
                outputs.push({label: "Arabic", value: number.baseFour(Arabic)});
                outputs.push({label: "Suits", value: number.baseFour(Suits)});
                outputs.push({label: "Nucleobases", value: number.baseFour(Nucleobase)});
                outputs.push({label: "Ventureño Chumash", value: number.baseFour(Ventureno)});
                outputs.push({label: "Arabic Octal", value: number.octal()});
                outputs.push({label: "Yuki", value: number.baseFour(Yuki)});
                outputs.push({label: "Northern Pame", value: number.baseFour(NorthernPame)});
                [for (pair in outputs) '<b>${pair.label}:</b> ${pair.value}'].join("<br />\n");
            }
            output.innerHTML = innerHTML;
        }
        // Browser.window.onload = updateDisplay;
        input.oninput = updateDisplay;
    }
}