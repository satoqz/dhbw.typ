#import "../template.typ" : template

#show: template.with(
  title: "Thesis Title",
  subtitle: "Bachelor's Thesis",
  author: "Author Name",
  date: datetime(year: 1970, month: 1, day: 1),
  logos: (
    image("assets/dhbw.svg", width: 30%),
    image("assets/hpe.svg", width: 30%),
  ),
  details: (
    "Course, Student ID": "TINF00A, 0000000",
    "Company": "Hewlett Packard Enterprise",
    "Supervisor": "Supervisor Name",
  ),
  abstract: include "abstract.typ",
  acronyms: yaml("acronyms.yml"),
)

#include "chapters/introduction.typ"
#include "chapters/conclusion.typ"

#bibliography("references.yml")