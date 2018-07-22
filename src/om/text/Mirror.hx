package om.text;

using om.ArrayTools;

/**
	ɿoɿɿiM
*/
class Mirror implements om.text.Encoder {

	public var map : Map<String,String> = [
		'a' => 'ɒ',
		'b' => 'd',
		'c' => 'ɔ',
		'e' => 'ɘ',
		'f' => 'Ꮈ',
		'g' => 'ǫ',
		'h' => 'ʜ',
		'j' => 'ꞁ',
		'k' => 'ʞ',
		'l' => '|',
		'n' => 'ᴎ',
		'p' => 'q',
		'r' => 'ɿ',
		's' => 'ꙅ',
		't' => 'ƚ',
		'y' => 'ʏ',
		'z' => 'ƹ',
		'B' => 'ᙠ',
		'C' => 'Ɔ',
		'D' => 'ᗡ',
		'E' => 'Ǝ',
		'F' => 'ꟻ',
		'G' => 'Ꭾ',
		'J' => 'Ⴑ',
		'K' => '⋊',
		'L' => '⅃',
		'N' => 'Ͷ',
		'P' => 'ꟼ',
		'Q' => 'Ọ',
		'R' => 'Я',
		'S' => 'Ꙅ',
		'Z' => 'Ƹ',
		'1' => '',
		'2' => '',
		'3' => '',
		'4' => '',
		'5' => '',
		'6' => '',
		'7' => '',
		'&' => '',
		';' => '',
		'[' => ']',
		'(' => ')',
		'{' => '}',
		'?' => '⸮',
		'<' => '>',

		'ä' => 'ɒ'+'\u0308',
		'ß' => 'ᙠ',

		'´' => '`',
		'é' => 'ɘ' + '\u0300',
		'á' => 'ɒ' + '\u0300',
		'ó' => 'ò',
		'ú' => 'ù',
		'É' => 'Ǝ' + '\u0300',
		'Á' => 'À',
		'Ó' => 'Ò',
		'Ú' => 'Ù',

		'`' => '´',
		'è' => 'ɘ' + '\u0301',
		'à' => 'ɒ' + '\u0301',
		'È' => 'Ǝ' + '\u0301',

		'ê' => 'ɘ' + '\u0302',
		'â' => 'ɒ' + '\u0302',
		'Ê' => 'Ǝ' + '\u0302',

		'Ø' => 'ᴓ',
		'ø' => 'ᴓ'
	];

	public function new() {}

	public function encode( text : String ) : String {
		var ar = new Array<String>();
		var nlines = new Array<String>();
		var ch : String = null;
		for( i in 0...text.length ) {
			ch = text.charAt(i);
			if( i > 0 && (ch == '\u0308' ||
                          ch == '\u0300' ||
                          ch == '\u0301' ||
                          ch == '\u0302') ) {
				ch = map[text.charAt(i-1) + ch];
				ar.pop();
			} else {
				if( (ch = map[ch]) == null ) ch = text.charAt(i);
			}
			if( ch == '\n' ) {
				nlines.push( ar.reversed().join("") );
	            ar = [];
			} else ar.push( ch );
		}
		nlines.push( ar.reversed().join("") );
		return nlines.join("");
	}

}
