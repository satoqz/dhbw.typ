#import "dhbw.typ"

#let (title, author, date) = ("DHBW Typst Template", "John Doe", "01.01.1970")

#set document(title: title, author: author)

#show: dhbw.global-layout
#show: dhbw.frontmatter-layout

#dhbw.titlepage(title: title, author: author, date: date, logos: (
  image("assets/dhbw.svg", width: 30%),
  image("assets/hpe.svg", width: 30%),
), table: (
  ("Project Period", "Too short"),
  ("Course, Student ID", "TINF21A, 1337"),
  ("Company", "Hewlett Packard Enterprise"),
))

#dhbw.abstract[Nett hier. Aber waren Sie schon mal in Baden-Württemberg?]
#dhbw.authors-declaration(title: title, author: author, date: date, location: "Stuttgart")
#dhbw.contents()
#dhbw.acronyms((
  ("HPE", "Hewlett Packard Enterprise"),
  ("YAML", "YAML Ain't Markup Language"),
))

#show: dhbw.main-layout

// to load chapters from separate files, simply `include` them:
// #dhbw.chapters((include "./introduction.typ", include "./summary.typ"))

#dhbw.chapters(([
  = Introduction

  == Problem Statement
  ```rs
  fn main() {
    println!("Hello, World!");
  }
  ```

  == Solution Approach
  #lorem(100) @lorem-ipsum-generator
], [
  = Summary and Conclusion

  == Summary
  #lorem(50)

  == Conclusion
  #lorem(30)
],))

#bibliography("bibliography.yml", title: "References")

