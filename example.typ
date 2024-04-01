#import "dhbw.typ"

#set document(
  title: "DHBW Typst Template",
  author: "John Doe",
  date: datetime(year: 1970, month: 1, day: 1),
)

#show: dhbw.global-layout
#show: dhbw.frontmatter-layout

#dhbw.titlepage(logos: (
  image("assets/dhbw.svg", width: 30%),
  image("assets/hpe.svg", width: 30%),
), table: (
  ("Project Period", "Too short"),
  ("Course, Student ID", "TINF21A, 1337"),
  ("Company", "Hewlett Packard Enterprise"),
))

#dhbw.abstract[Nett hier. Aber waren Sie schon mal in Baden-Württemberg?]
#dhbw.declaration()
#outline()
#dhbw.acronyms((
  ("HPE", "Hewlett Packard Enterprise"),
  ("YAML", "YAML Ain't Markup Language"),
))

#show: dhbw.main-layout

= Introduction

== Problem Statement
#lorem(50)

== Solution Approach
#lorem(100) @lorem-ipsum-generator

= Summary and Conclusion

== Summary
#lorem(50)

== Conclusion
#lorem(30)

#bibliography("references.yml", title: "References")

