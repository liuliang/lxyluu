function insertCode() {
  var code_name = document.forms[0].codeInput.value;
  if(!code_name || code_name.replace(/^\s+|\s+$/g,"") == "" ) code_name = document.forms[0].codeSelect.options[document.forms[0].codeSelect.selectedIndex].value;
  var code_content = document.forms[0].codeTextArea.value.replace(/&/gi, "&amp;").replace(/</gi, "&lt;").replace(/>/gi, "&gt;");

  tinyMCEPopup.restoreSelection();
  tinyMCE.activeEditor.selection.setContent("<pre name=\"code\" class=\"" + code_name + "\">" + code_content + "</pre>&nbsp;", {format:'text'});
  tinyMCEPopup.close();
}
