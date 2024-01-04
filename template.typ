#let thesis(
  // The title of your thesis
  title: "Title",
  // The kind of your thesis, e.g. "Student Research Thesis" or T1000, T2000, etc.
  kind: "Student Research Thesis",
  // The date of submission
  date: "19.01.2038",
  // The time period during which the project was worked on
  time-period: "01.01.1970 - 19.01.2038",
  // The major for this thesis
  major: "Computer Science",
  // The degree that this thesis is submitted for
  degree: "Bachelor of Science",
  // The location that goes along with your signature
  location: "Stuttgart",

  // The authors of this thesis.
  // Note that this is an array such that you can pass multiple authors.
  authors: (
    (
      // The author's name
      name: "John Doe",
      // The author's course name
      course: "TINF99Z",
      // The author's student id (Matrikelnummer)
      student-id: "6666666",
    ),
  ),

  // Information on your university
  university: (
    // The specific name of your university (DHBW Stuttgart, DHBW Karlsruhe, etc.)
    name: "DHBW Stuttgart",
    // The logo for your university
    logo: "assets/dhbw.svg",
    // The name of your supervisor at your university.
    // Set to `none` if you have no supervisor.
    supervisor: none,
  ),

  // Information on your company. Set this field to `none` to disable linking
  // to a company.
  company: (
    name: "Hewlett Packard Enterprise",
    // The logo for your company
    logo: "assets/hpe.svg",
    // The name of your supervisor at your company.
    // Set to `none` if you have no supervisor.
    supervisor: none,
  ),

  // Path to your references/bibliography file (both YAML and BibTeX work)
  references: "bibliography.yml",
  // Include a confidentiality clause. Your work probably does not require it.
  confidentiality-clause: false,
  // Your abstract.
  abstract: [Nett hier. Aber waren Sie schon mal in Baden-Württemberg?],
  // The chapters of your thesis. Takes an array of values of type `content`.
  chapters: (),
  // You could put an appendix here, otherwise just leave it empty.
  body,
) = {
  set document(title: title)

  set page(
    paper: "a4",
    margin: 2.5cm,
  )

  set text(
    size: 12pt,
    font: "CMU Serif",
  )

  set par(
    leading: 0.75em,
    justify: true,
    linebreaks: "optimized",
  )

  set list(indent: 0.75em)
  set enum(indent: 0.75em)

  show heading: it => {
    set par(justify: false)
    v(1.5em / it.level)
    if it.numbering != none {
      grid(
        columns: (auto, auto),
        {
          numbering(it.numbering, ..counter(heading).at(it.location()))
          h(36pt / it.level)
        },
        it.body,
      )
    } else {
      it.body
    }
    v(1em / it.level)
  }

  show heading.where(level: 1): set text(size: 24pt)
  show heading.where(level: 2): set text(size: 20pt)
  show heading.where(level: 3): set text(size: 16pt)

  set ref(supplement: it => {
    if it.func() == heading and it.level == 1 {
      "Chapter"
    } else {
      "Section"
    }
  })

  show outline: set par(leading: 1em)

  show outline.entry: it => {
    if it.level == 1 {
      v(8pt)
    }

    let weight = if it.level == 1 {
      (body) => text(weight: "bold", body) 
    } else {
      (body) => text(body)
    }

    link(
      it.element.location(),
      weight({
        h(1em * (it.level - 1))
        if it.body.has("children") {
          it.body.children.at(0)
          h(1em)
          for child in it.body.children.slice(2) {
            child
          }
        } else {
          it.body
        }
        box(width: 1fr, pad(
          x: 6pt,
          repeat(
            if it.level == 1 { " " } else { "." }
          )
        ))
        it.page
      })
    )
  }

  show raw.where(block: true): it => {
    h(4pt)
    set text(size: 8pt)
    set par(justify: false)

    let numbers = block(
      width: 100%,
      {
        set text(fill: luma(150))
        for (i, line) in it.text.split("\n").enumerate() {
          box(width: 1em, align(right, str(i + 1)))
          hide(line)
          linebreak()
        }
      },
    )

    let code = block(
      width: 100%,
      it,
    )

    block(
      radius: 2pt,
      inset: 1em,
      width: 100%,
      fill: luma(240),
      grid(
        columns: (100%, 100%),
        column-gutter: -100% + 2em,
        numbers,
        code,
      )
    )
    
    h(4pt)
  }

  [
    #set align(center)

    #stack(
      dir: ltr,
      spacing: 12em,
      if university != none { image(university.logo, width: 30%) },
      if company != none { image(company.logo, width: 30%) },
    )
    #v(64pt)

    #text(size: 20pt, weight: "bold", title)
    #v(12pt)

    #text(size: 14pt, weight: "bold", kind)
    #v(12pt)

    presented to the \
    #text(size: 14pt, weight: "bold")[Department of #major]
    #v(12pt)

    for the \
    #text(size: 14pt, weight: "bold", degree)
    #v(12pt)

    at the \
    #text(size: 14pt, weight: "bold", university.name)
    #v(12pt)

    by \
    #text(
      size: 16pt,
      weight: "bold",
      authors.map(author => author.name).join(", "),
    )
    #v(12pt)

    submitted on \
    #text(weight: "bold", date)

    #set align(bottom + center)
    #stack(
      dir: ltr,
      spacing: 10em,
      text(weight: "bold")[
        #set align(left)
        Project Period \
        #if authors.len() > 1 [
          Student IDs \
          Courses \
        ] else [
          Student ID \
          Course \
        ]
        #if company != none [
          Company \
          #if "supervisor" in company and company.supervisor != none [
            Supervisor at the Company \
          ]
        ]
        #if "supervisor" in university and university.supervisor != none [
          Supervisor \
        ]
      ],
      [
        #set align(left)
        #time-period \
        #authors.map(author => author.student-id).join(", ") \
        #authors.map(author => author.course).join(", ") \
        #if company != none [
          #company.name \
          #if "supervisor" in company and company.supervisor != none [
            #company.supervisor
          ]
        ]
        #if "supervisor" in university and university.supervisor != none [
          #university.supervisor \
        ]
      ],
    )
    
    #pagebreak()
  ]

  [
    #set align(horizon + center)
    #text(16pt)[*Abstract*]

    #abstract
    #pagebreak()
  ]

  set page(numbering: "I")

  if confidentiality-clause [
    #set heading(outlined: false)
    == Confidentiality Clause

    The content of this work may not be made accessible to people outside of the testing process and the evaluation process neither as a whole nor as excerpts, unless an authorization stating otherwise is presented by the training facility.
    #pagebreak()
  ]

  [
    #set heading(outlined: false)
    == Author's declaration

    Hereby I solemnly declare:

    + that this #kind, titled #text(style: "italic")[#title] is entirely the product of my own scholary work, unless otherwise indicated in the text or references, or acknowledged below;

    + I have indicated the thoughts adopted directly or indirectly from other sources at the appropriate places within the document;

    + this #kind has not been submitted either in whole or part, for a degree at this or any other university or institution;

    + I have not published this #kind in the past;

    + the printed version, if there is such, is equivalent to the submitted one.

    I am aware that a dishonest declaration will entail legal consequences.
    #v(32pt)

    #location, #date
    #v(16pt)

    #for author in authors [
      #v(32pt)
      #line(length: 196pt)
      #author.name
    ]

    #pagebreak()
  ]

  outline(
    indent: auto,
    depth: 2,
  )

  pagebreak()

  [
    #let acronyms = yaml("acronyms.yml")
    = Acronyms

    #grid(
      columns: (1fr, 3fr),
      {
        for acronym in acronyms [
          *#acronym.at(0)*

        ]
      },
      {
        for acronym in acronyms [
          #acronym.at(1)

        ]
      },
    )
  ]

  pagebreak()
  set page(numbering: "1 / 1")
  set heading(numbering: "1.1")

  for chapter in chapters {
    chapter
    pagebreak()
  }

  bibliography(
    references,
    title: "References",
  )

  body
}