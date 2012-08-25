# Welcome to the Vim-Format-Js plugin. Beautify your javascripts on the fly!
It is well known that a manual javascript formatting is very boring. Someone wrote a beautiful tool - js-beautify, but it never was *properly* integrated with vim. This one is the one I use for last 2 years.

##How this works
1. Press a *<leader>ff* ( *,ff* if your leader is a comma) to format your javascript file when in a normal mode. 
2. Press a *Ctrl-f* inside an insert mode to format your javascript while you
   are editing it. The cursor position is kept so you can continue typing the
   code
3. Press an 'U' to cancel this formatting if something goes wrong and you are
   not happy with formatting

##What do I need to have this working?
   * Nodejs should be installed. 
   * Install this plugin any way you like (Pathogen / Vundle / Janus)
##Why is this a great plugin?
1. Marks and your current cursor position are kept during formatting. Here is how
   I achieve this: during the js-beautify preprocessing number of non blank
   characters is not changed, thus I associate a mark with the number of non blank
   character before it and later put the cursor back.
2. No need for extra configuration! *expandtab* and *softtabstop* already provides
   me an info how you would like to format your javascript. TODO: You can always add an extra option *s:formatjs_keep_blank_lines*
3. Works without saving a file. Works in the indent mode. 

TODO: 
* Borrow css-beautify and html-beautify
* Allow new lines inside () and [] for string parameters, because currently 
    [
    'a',
    'b',
    'c',
    'd'
    ]
is always converted to the `['a','b','c','d']` . Sometimes it is important to
have word wraps here
