#show: doc => article(
$if(title)$
  title: "$title$",
$endif$
$if(footer)$
  footer: "$footer$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
  doc
)