#import "template.typ"

#show: template.thesis.with(
  chapters: (
    include "chapters/introduction.typ",
    include "chapters/background.typ",
    include "chapters/conclusion.typ",
  ),
)