(function(a) {
	load(arguments[0]);
	var input = "";
	var line = "";
	var blankcount = "0";
	while (blankcount < 10) {
		line = readline();

		if (line == "") blankcount++;
		else blankcount = 0;
		if (line == "END") break;
		input += line;
		input += "\n";
	}
	input = input.substring(0, input.length - blankcount);
	var options = {
		indent_size: 2,
		indent_char: " ",
		preserve_newlines: false
	};
	print(js_beautify(input, options));
})(arguments);
