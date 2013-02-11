CKEDITOR.editorConfig = (config) ->
  config.toolbar_Pure = [
    { name: 'document',    items: [ 'Source','-','Preview','Templates' ] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    # { name: 'editing',     items: [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'Image','Flash','Table','HorizontalRule','SpecialChar','PageBreak' ] },
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks','-','About' ] }
  ]
  config.toolbar = 'Pure'

  true