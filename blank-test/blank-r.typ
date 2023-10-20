// needed for callout support
#import "@preview/fontawesome:0.1.0": *

// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw: it => {
  if it.block {
    block(fill: luma(230), width: 100%, inset: 8pt, radius: 2pt, it)
  } else {
    it
  }
}

#show ref: it => locate(loc => {
  let target = query(it.target, loc).first()
  if it.at("supplement", default: none) == none {
    it
    return
  }

  let sup = it.supplement.text.matches(regex("^45127368-afa1-446a-820f-fc64c546b2c5%(.*)")).at(0, default: none)
  if sup != none {
    let parent_id = sup.captures.first()
    let parent_figure = query(label(parent_id), loc).first()
    let parent_location = parent_figure.location()

    let counters = numbering(
      parent_figure.at("numbering"), 
      ..parent_figure.at("counter").at(parent_location))
      
    let subcounter = numbering(
      target.at("numbering"),
      ..target.at("counter").at(target.location()))
    
    // NOTE there's a nonbreaking space in the block below
    link(target.location(), [#parent_figure.at("supplement") #counters#subcounter])
  } else {
    it
  }
})

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black) = {
  block(breakable: false, fill: background_color, stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), width: 100%, radius: 2pt)[
    #block(inset: 1pt, width: 100%, below: 0pt)[#block(fill: background_color, width: 100%, inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]]
    #block(inset: 1pt, width: 100%)[#block(fill: white, width: 100%, inset: 8pt)[#body]]]
}

#let article(
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  doc
) = {

  set page(
    paper: paper,
    margin: margin,
  )

  set text(
    lang: lang,
    region: region,
  )

  doc
}
#show: doc => article(
  margin: (x: 1in,y: 1in,),
  doc
)


#set page(
  fill: rgb("#142933")
)

#set text(
  fill: white,
  font: ("Tilt Prism"),
  size: 32pt
)

#set align(center)
This is the base for your document content.

#set align(left)
#set text(
  font: "Inconsolata",
  size: 12pt,
)
Exercitation ullamco proident id pariatur eu magna nisi. Minim consequat minim qui pariatur commodo officia ad ea. Irure ut reprehenderit dolor eiusmod est occaecat labore fugiat. Veniam irure anim eu culpa fugiat exercitation. Non voluptate deserunt ullamco exercitation quis minim deserunt do eu dolore laboris. Aliquip fugiat aliqua proident commodo. Consequat ut aliqua fugiat ullamco deserunt adipisicing consequat.

Tempor proident in cupidatat cupidatat laborum et ut et. Aliquip aute non aliquip anim sint proident ea nostrud ex voluptate. Ut sit nulla id aute et enim. Laboris amet tempor dolore aute est sint consequat. Voluptate sint cillum cillum laboris ad sint adipisicing pariatur non enim elit proident velit. Cillum cupidatat eiusmod nisi qui adipisicing aliqua esse in. In tempor ea sint pariatur ipsum ea duis.

#set align(center)
#v(24pt)
#block[
#block[
#box([#image("blank-r_files/figure-typst/plt1-1.svg", width: 5in, height: 3in)])

]
]
#set align(left)
#v(24pt)
Mollit ad adipisicing non irure sit dolore irure commodo veniam proident laborum ullamco. Et officia anim sunt reprehenderit esse qui aliqua veniam amet consectetur excepteur elit culpa reprehenderit. Deserunt voluptate et laborum sint dolore cupidatat nostrud anim ut duis ea. Sunt culpa aute do minim fugiat cillum.

#pagebreak()

#set align(center)
#set table(
  stroke: 0.25pt + white
)
#block[
#block[
#align(center)[#table(
  columns: 11,
  align: (col, row) => (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,).at(col),
  inset: 6pt,
  [mpg], [cyl], [disp], [hp], [drat], [wt], [qsec], [vs], [am], [gear], [carb],
  [21.0],
  [6],
  [160.0],
  [110],
  [3.90],
  [2.620],
  [16.46],
  [0],
  [1],
  [4],
  [4],
  [21.0],
  [6],
  [160.0],
  [110],
  [3.90],
  [2.875],
  [17.02],
  [0],
  [1],
  [4],
  [4],
  [22.8],
  [4],
  [108.0],
  [93],
  [3.85],
  [2.320],
  [18.61],
  [1],
  [1],
  [4],
  [1],
  [21.4],
  [6],
  [258.0],
  [110],
  [3.08],
  [3.215],
  [19.44],
  [1],
  [0],
  [3],
  [1],
  [18.7],
  [8],
  [360.0],
  [175],
  [3.15],
  [3.440],
  [17.02],
  [0],
  [0],
  [3],
  [2],
  [18.1],
  [6],
  [225.0],
  [105],
  [2.76],
  [3.460],
  [20.22],
  [1],
  [0],
  [3],
  [1],
  [14.3],
  [8],
  [360.0],
  [245],
  [3.21],
  [3.570],
  [15.84],
  [0],
  [0],
  [3],
  [4],
  [24.4],
  [4],
  [146.7],
  [62],
  [3.69],
  [3.190],
  [20.00],
  [1],
  [0],
  [4],
  [2],
  [22.8],
  [4],
  [140.8],
  [95],
  [3.92],
  [3.150],
  [22.90],
  [1],
  [0],
  [4],
  [2],
  [19.2],
  [6],
  [167.6],
  [123],
  [3.92],
  [3.440],
  [18.30],
  [1],
  [0],
  [4],
  [4],
  [17.8],
  [6],
  [167.6],
  [123],
  [3.92],
  [3.440],
  [18.90],
  [1],
  [0],
  [4],
  [4],
  [16.4],
  [8],
  [275.8],
  [180],
  [3.07],
  [4.070],
  [17.40],
  [0],
  [0],
  [3],
  [3],
  [17.3],
  [8],
  [275.8],
  [180],
  [3.07],
  [3.730],
  [17.60],
  [0],
  [0],
  [3],
  [3],
  [15.2],
  [8],
  [275.8],
  [180],
  [3.07],
  [3.780],
  [18.00],
  [0],
  [0],
  [3],
  [3],
  [10.4],
  [8],
  [472.0],
  [205],
  [2.93],
  [5.250],
  [17.98],
  [0],
  [0],
  [3],
  [4],
  [10.4],
  [8],
  [460.0],
  [215],
  [3.00],
  [5.424],
  [17.82],
  [0],
  [0],
  [3],
  [4],
  [14.7],
  [8],
  [440.0],
  [230],
  [3.23],
  [5.345],
  [17.42],
  [0],
  [0],
  [3],
  [4],
  [32.4],
  [4],
  [78.7],
  [66],
  [4.08],
  [2.200],
  [19.47],
  [1],
  [1],
  [4],
  [1],
  [30.4],
  [4],
  [75.7],
  [52],
  [4.93],
  [1.615],
  [18.52],
  [1],
  [1],
  [4],
  [2],
  [33.9],
  [4],
  [71.1],
  [65],
  [4.22],
  [1.835],
  [19.90],
  [1],
  [1],
  [4],
  [1],
)
]

]
]
#set align(left)
#v(24pt)
Do culpa cillum nulla reprehenderit amet ipsum. Pariatur cillum amet in sint commodo sint ex ullamco deserunt est dolore sint do. Id laborum ipsum aliqua exercitation mollit in quis labore nisi minim amet ad. Ex est laborum id et reprehenderit adipisicing ullamco duis adipisicing ad deserunt cillum.

Aliqua ex nulla eu mollit eiusmod qui. Reprehenderit laboris eu irure ex qui aliquip voluptate adipisicing nisi nulla tempor non exercitation. Esse ut deserunt labore enim. Magna eiusmod duis culpa id laborum cillum. Sunt sit anim ad aute incididunt nisi amet ipsum minim. Magna sint ullamco proident qui dolore ullamco elit mollit aute ut cillum. Mollit aliquip labore excepteur occaecat.
