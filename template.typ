#set document(
  title: "DHBW Typst Template",
  author: "John Doe",
  date: datetime.today(),
)

#set page(paper: "a4", margin: 2.5cm, numbering: "I")
#set pagebreak(weak: true)

#set text(size: 12pt, font: "CMU Sans Serif")
#set par(leading: 0.75em, justify: true, linebreaks: "optimized")

#set list(indent: 0.75em)
#set enum(indent: 0.75em)

#set bibliography(title: "References")
#set outline(indent: auto, depth: 2, fill: repeat(" . "))

#show heading.where(level: 1): set block(above: 2em, below: 2em)
#show heading.where(level: 2): set block(above: 2em, below: 1.5em)
#show heading.where(level: 3): set block(above: 1.5em, below: 1em)

#show heading.where(level: 1): set text(size: 24pt)
#show heading.where(level: 2): set text(size: 20pt)
#show heading.where(level: 3): set text(size: 16pt)

#show heading: it => {
  if it.level == 1 { pagebreak() }
  if it.numbering == none { it } else {
    grid(
      columns: (auto, auto),
      box(width: 48pt, counter(heading).display()),
      it.body,
    )
  }
}

#show bibliography: it => [#pagebreak() #it]
#show outline: it => [#pagebreak() #it]

#show outline.entry.where(level: 1): it => [
  #if it.element.func() != heading { return it }
  #show ".": ""
  #v(8pt) #strong(it)
]

#show raw.where(block: true): set align(left)
#show raw.where(block: true): set par(justify: false)
#show raw.where(block: true): set text(size: 8pt)

#show raw.where(block: true): set block(
  radius: 2pt,
  inset: 12pt,
  width: 100%,
  stroke: luma(128),
  fill: luma(240),
)

#show raw.where(block: false): box.with(
  radius: 2pt,
  inset: (x: 3pt),
  outset: (y: 3pt),
  stroke: luma(128),
  fill: luma(240),
)

#{
  set align(center)
  set page(numbering: none)

  pad(bottom: 64pt, stack(
    dir: ltr,
    spacing: 12em,
    image("./assets/dhbw.svg", width: 30%),
    image("./assets/hpe.svg", width: 30%),
  ))

  pad(bottom: 24pt, text(size: 20pt, strong[#context document.title]))

  [
    #show strong: set text(size: 14pt)
    #show strong: it => [#pad(bottom: 12pt, it) #parbreak()]

    #let author = [#context document.author.join(" & ")]
    #let date = [#context document.date.display("[day].[month].[year]")]

    *Bachelor's Thesis*

    presented to the \ *Department of Computer Science*
    for the \ *Bachelor of Science*
    at the \ *DHBW Stuttgart*
    by \ #strong(author)
    submitted on \ #strong(date)
  ]

  let details = (
    "Project Period": [01.01.1970 - 01.01.1970],
    "Course, Student ID": [TINF21A, 1337],
    "Company": [Hewlett Packard Enterprise],
    "Company Supervisor": [John Doe],
    "University Supervisor": [John Doe],
  )

  align(bottom, table(
    columns: (auto, auto),
    align: left,
    stroke: none,
    inset: (x: 48pt),
    ..details.keys().map(strong).zip(details.values()).flatten(),
  ))
}

#counter(page).update(1)

#[
  #set align(horizon + center)
  #set heading(outlined: false)

  == Abstract

  #lorem(100)
]

#pagebreak()

#[
  #set align(horizon)
  #set heading(outlined: false)

  == Author's declaration

  Hereby I solemnly declare:

  + that this thesis, titled "#context document.title" is entirely the product of my
    own work, unless otherwise indicated in the text or references, or acknowledged
    below;
  + I have indicated the thoughts adopted directly or indirectly from other sources
    at the appropriate places within the document;
  + this thesis has not been submitted either in whole or part, for a degree at this
    or any other university or institution;
  + I have not published this thesis in the past;
  + the printed version, if there is such, is equivalent to the submitted one.

  I am aware that a dishonest declaration will entail legal consequences.
  #v(32pt)

  Stuttgart, #context document.date.display("[day].[month].[year]")
  #v(32pt)

  #line(length: 256pt)
  #context document.author.join(", ")
]

#outline()

= Acronyms

/ HPE: Hewlett Packard Enterprise
/ JSON: JavaScript Object Notation

#set heading(numbering: "1.1")
#set page(numbering: "1 / 1")
#counter(page).update(1)

= Introduction

#lorem(100) @lorem-ipsum-generator

== Problem Statement

```rust
fn main() {
  println!("Hello, World!");
}
```

= Conclusion

#lorem(100) @lorem-ipsum-generator

#bibliography("references.yml")