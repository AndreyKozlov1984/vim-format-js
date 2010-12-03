(function(a) {
	var files = arguments[0];
	load(files[0]);
	load(files[1]);
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
	print(js_beautify(input, jsbeautify_options));
})(arguments);
