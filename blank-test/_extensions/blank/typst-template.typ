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