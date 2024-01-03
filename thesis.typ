#import "template.typ"

#show: body => template.thesis(
  chapters: (
    include "chapters/introduction.typ",
    include "chapters/background.typ",
    include "chapters/conclusion.typ",
  ),
  body,
)