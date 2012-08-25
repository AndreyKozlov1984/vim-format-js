var util = require('util');
var fs = require('fs');
var args = process.argv.splice(2);
var js_beautify = require(args[0]).js_beautify;
var options = args[1] || '{}';
var options = JSON.parse(args[1] || '{}');
var input = fs.readFileSync('/dev/stdin').toString();
var result = (js_beautify(input, options));
util.puts(result);
