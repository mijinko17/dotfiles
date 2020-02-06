#!/usr/bin/env perl
$latex            = 'platex -synctex=1 -halt-on-error';
$bibtex           = 'pbibtex';
$biber            = 'biber  -u -U --output_safechars';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;
$pvc_view_file_via_temporary = 0;
$pdf_previewer = "open /Applications/Skim.app";
@generated_exts = ( 'aux', 'bcf', 'fls', 'idx', 'ind', 'lof', 'lot', 'out', 'toc','dvi' );
$out_dir = 'build';
