#!/usr/bin/env perl

$latex         = 'platex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex        = 'pbibtex %O %B';
$makeindex     = 'upmendex %O -o %D %S';
$dvipdf        = 'dvipdfmx %O -o %D %S';
$pdf_mode      = 3;
$pdf_previewer = 'xdg-open %S';
