#let global-layout(body) = {
  set page(paper: "a4", margin: 2.5cm)
  set text(size: 12pt, font: "CMU Serif")
  set par(leading: 0.75em, justify: true, linebreaks: "optimized")
  set list(indent: 0.75em)
  set enum(indent: 0.75em)
  set pagebreak(weak: true)

  set ref(supplement: it => {
    if it.func() == heading {
      if it.level == 1 {
        "Chapter"
      } else {
        "Section"
      }
    } else {
      it.supplement
    }
  })

  show heading: it => {
    set par(justify: false)
    v(1.5em / it.level)
    if it.numbering != none {
      grid(columns: (auto, auto), {
        numbering(it.numbering, ..counter(heading).at(it.location()))
        h(36pt / it.level)
      }, it.body)
    } else {
      it.body
    }
    v(1em / it.level)
  }

  show heading.where(level: 1): set text(size: 24pt)
  show heading.where(level: 2): set text(size: 20pt)
  show heading.where(level: 3): set text(size: 16pt)

  show raw.where(block: true): it => {
    h(4pt)
    set align(left)
    set text(size: 8pt)
    set par(justify: false)
    let numbers = block(width: 100%, {
      set text(fill: luma(150))
      for (i, line) in it.text.split("\n").enumerate() {
        box(width: 1em, align(right, str(i + 1)))
        hide(line)
        linebreak()
      }
    })
    block(radius: 2pt, inset: 1em, width: 100%, fill: luma(240), grid(
      columns: (100%, 100%),
      column-gutter: -100% + 2em,
      numbers,
      block(width: 100%, it),
    ))
    h(4pt)
  }
  body
}

#let frontmatter-layout(body) = {
  set page(numbering: "I")
  body
}

#let main-layout(body) = {
  set heading(numbering: "1.1")
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}

#let titlepage(
  kind: "Bachelor's thesis",
  major: "Computer Science",
  degree: "Bachelor of Science",
  university: "DHBW Stuttgart",
  logos: (),
  table: (),
) = {
  set page(numbering: none)
  set align(center)

  stack(dir: ltr, spacing: 12em, ..logos)
  v(64pt)

  text(size: 20pt, weight: "bold")[#context document.title]
  v(12pt)

  text(size: 14pt, weight: "bold", kind)
  v(12pt)

  [presented to the]
  linebreak()
  text(size: 14pt, weight: "bold")[Department of #major]
  v(12pt)

  [for the]
  linebreak()
  text(size: 14pt, weight: "bold", degree)
  v(12pt)

  [at the]
  linebreak()
  text(size: 14pt, weight: "bold", university)
  v(12pt)

  [by]
  linebreak()
  text(size: 16pt, weight: "bold")[#context document.author.join(" & ")]
  v(12pt)

  [submitted on]
  linebreak()
  text(weight: "bold")[#context document.date.display("[day].[month].[year]")]

  set align(bottom + center)
  show par: set block(below: 0.75em)
  stack(dir: ltr, spacing: 10em, for pair in table {
    set align(left)
    text(weight: "bold", pair.at(0))
  }, for pair in table {
    set align(left)
    pair.at(1)
  })
}

#let abstract(body) = {
  set page(numbering: none)
  set align(horizon + center)
  text(size: 16pt, weight: "bold", "Abstract")
  parbreak()
  body
}

#let declaration(location: "Stuttgart") = [
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

  #location, #context document.date.display("[day].[month].[year]")
  #v(48pt)

  #line(length: 200pt)
  #context document.author.join(", ")

  #pagebreak()
]

#let contents() = {
  show outline.entry: it => {
    if it.level == 1 { v(8pt) }
    link(
      it.element.location(),
      text(
        weight: if it.level == 1 { "bold" } else { "regular" },
        {
          h(1em * (it.level - 1))
          if it.body.has("children") {
            it.body.children.at(0)
            h(1em)
            for child in it.body.children.slice(2) {
              child
            }
          } else { it.body }
          box(width: 1fr, pad(x: 6pt, repeat(if it.level == 1 { " " } else { "." })))
          it.page
        },
      ),
    )
  }
  outline(indent: auto, depth: 2)
  pagebreak()
}

#let acronyms(pairs) = {
  heading(level: 1, "Acronyms")
  grid(columns: (1fr, 3fr), for acronym in pairs {
    text(weight: "bold", acronym.at(0))
    linebreak()
  }, for acronym in pairs {
    acronym.at(1)
    linebreak()
  })
}

#let chapters(entries) = for chapter in entries {
  chapter
  pagebreak()
}
