/**
 * @license Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
		config.language = 'ko';
		config.height = '400px';  //Editor 높이 
	
		config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Source,Save,Templates,NewPage,ExportPdf,Preview,Print,PasteFromWord,PasteText,Paste,Copy,Cut,SelectAll,Scayt,Find,Replace,HiddenField,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,Subscript,Superscript,RemoveFormat,CopyFormatting,Outdent,Indent,CreateDiv,BidiLtr,BidiRtl,Language,Anchor,PageBreak,Iframe,Format,Styles,ShowBlocks,Maximize,About,Smiley,SpecialChar,Link,Unlink,HorizontalRule,NumberedList,BulletedList,Blockquote';

};
