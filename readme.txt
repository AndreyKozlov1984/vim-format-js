
This is a Js Beautify implementation for the vim
just press <leader>ff in normal mode and the whole javascript file will be 
formatted. Currently formatted options are in the js/payload.js file
In order to work this plugin requires spidermonkey engine to be installed in the system.

The best way to connect the plugin to the system is a Pathogen manager, but there is even better,
for example look here (link to my vim config), cause you can store a list of all your plugins right
    in your vimrc file and then automatically update it!
    
TODO:
  adjust only javascript files (ftplugin)
  load options from cwd/.jsbeatify then ~/.jsbeautify , so more chances to customize the project
  implement support for other js enginges ( or even use a jsbeautify version written in ruby)

