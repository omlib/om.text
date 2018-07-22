package om.text;

using om.ArrayTools;

/**

C̴̩͕̺̟̯͎̞͍͚̪̮̗͔͐̊R̴̡̬̖͉̦̜̪̪̲͈̱͚̗͕̠̐͛̐̾̇͌̃̑̂̒̅͌̚͝͠Ẻ̴̢̡̧̮̺͕̜̞͙͈͕̰̝̎̎͌̍̑͘͠Ę̵̥̯̖̖͕͍̿̇̃̀̀̂̾̆̊̃̈͘̚͠P̶̢͈̪͚̙̝̬̮͉̮͕̫̦̦̅̓̈̃̾̓̀̆̃ͅY̷̢͍̗̜̮̍̊͗̇͜͝

*/
class Creepy implements om.text.Encoder {

	public var middle : Bool;
	public var top : Bool;
	public var bottom : Bool;
	public var maxHeight : Int;
	public var randomization : Int;

	public var d_top : Array<String>;
	public var d_bottom : Array<String>;
	public var d_middle : Array<String>;

	public function new( top = true, middle = true, bottom = true, maxHeight = 15, randomization = 100 ) {

		this.top = top;
		this.middle = middle;
		this.bottom = bottom;
		this.maxHeight = maxHeight;
		this.randomization = randomization;

		d_top = [for(i in 768...789) String.fromCharCode(i) ];
		d_top.push( String.fromCharCode(794) );
        d_top.push( String.fromCharCode(795) );
		for( i in 829...836 ) d_top.push( String.fromCharCode(i) );
		var ar = [836,838,842,843,844,848,850,855,856,859,861,861,864,865];
		for( i in 0...ar.length ) d_top.push( String.fromCharCode( ar[i] ) );

		d_bottom = [];
		for( i in 790...819 ) if( i != 794 && i != 795 ) d_bottom.push( String.fromCharCode(i) );
		for( i in 825...828 ) d_bottom.push( String.fromCharCode(i) );
		var ar = [837,839,840,841,845,846,851,852,853,854,857,858,860,863];
		for( i in 0...ar.length ) d_bottom.push( String.fromCharCode( ar[i] ) );

		d_middle = [for(i in 820...824) String.fromCharCode(i) ];
	}

	public function encode( text : String ) : String {

		function _distract( ar : Array<String> ) : String {
			var dlen = ar.length - 1;
			var len = maxHeight - Std.int( Math.random() * ( (randomization/100) * maxHeight ) );
			return [for( c in 0...len ) ar[Std.int( Math.floor( Math.random() * dlen ) )]].join('');
		}

		var ntext = '', ch : String = null;

		for( i in 0...text.length ) {

			ch = text.charAt(i);

			if( middle ) ch += d_middle[Math.floor(Math.random()*d_middle.length)];
			if( top ) ch += _distract( d_top );
			if( bottom ) ch += _distract( d_bottom );

			ntext += ch;
		}

		return ntext;
	}

}
