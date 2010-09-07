/**
 * editor_plugin_src.js
 *
 * Copyright 2009, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */

(function(tinymce) {
     tinymce.PluginManager.requireLangPack('rcode');
	tinymce.create('tinymce.plugins.RcodePlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('mceEmotion', function() {
				ed.windowManager.open({
					file : url + '/rcode.htm',
					width : 580,
					height : 400,
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('rcode', {title : 'rcode.desc',image : url + '/img/code.gif', cmd : 'mceEmotion'});
		},

		getInfo : function() {
			return {
				longname : 'Rcode',
				author : 'Moxiecode Systems AB',
				authorurl : 'http://tinymce.moxiecode.com',
				infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('rcode', tinymce.plugins.RcodePlugin);
})(tinymce);