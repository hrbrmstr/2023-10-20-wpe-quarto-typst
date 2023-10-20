#let article(
  title: "TITLE",
  footer: "FOOTER",
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  doc
) = {

  set page(
    paper: paper,
    margin: margin,
    footer: footer
  )

  set text(
    lang: lang,
    region: region,
  )

  text(
    size: 24pt,
    weight: 700,
    title
  )

  doc
}