#import "template.typ": *

#let colorLink(..args) = text(fill: accentColor, link(..args))

// Colour links blue
#show link: this => {
  let label-color = green
  let default-color = rgb("#ff66ff")

  underline(text(blue)[#this])
}


#resume(
  firstName: "John",
  lastName: "Doe",
  tagline: "The one and only",
  picture: box(inset: (left: -1pt, top: -1pt), image("image.png", width: 100%)), asideInfo: [

    #grid(columns: 2, gutter: 1.5em,
      circFa(fi.envelope), link("mailto:john.doe@example.com")[john.doe\@example.com],
      circFa(fi.location-arrow), [Utopia],
      circFa(fi.map-icon.marker-alt), [Acacia Avenue]
    )

    == Skills

    *Programming*: \
    Basic, B, Piet

    *Developer Tools*: \
    Git, Gud

    *Misc*: \
    Typst

    == Languages
    #let languages = (
      ([English], [Native]),
      ([Spanish], [Fluent]),
      ([French], [Basic]),
    )

    #grid(columns: (1fr, 1fr),
      gutter: 1em,
      ..languages.map(((lang, level)) => (lang, align(end, level))).flatten()
    )
  ],
  [
    = Profile

    #lorem(50)


    = Experience

    #v(2em)

    #company(
      name: [Acme Corporation],
      location: [Kansas, USA],
      position(
        title: [Head of Sales],
        dates: [Jan 1920 - now],
        description: [
          #lorem(20)
        ],
        skills: [
          - Selling things
          - Customer support
      ])
    )

    #v(2em)

    #company(
      name: [Wayne Enterprises],
      location: [Gotham, USA],
      position(
        title: [Batman],
        dates: [March 1939 - December 1980],
        description: [
          #lorem(10)
        ],
        skills: [
          - Fighting crime
          - Protecting Gotham
      ]) + v(1em) +
      position(
        title: [CEO Wayne Enterprises],
        dates: [March 1939 - December 1980],
        description: [
          #lorem(10)
        ])
    )

    = Education

    #education(
      name: [BSc in Being Awesome],
      institution: [Utopia University],
      dates: [Sep 2020 - now],
      []
    )

    #education(
      name: [Secondary education],
      institution: [British College],
      dates: [2016 - 2020],
      []
    )
  ]
)

= Publications

#publication(
  name: [Hier könnte Ihr Paper stehen],
  short_description: [#lorem(20)],
  date: [2024],
  url: [https://example.com/],
  tags: [
    - Sample
    - Tags
  ],
  []
)

= Projects

#project(
  name: [typst-almeida-cv],
  short_description: [#lorem(8)],
  dates: [Summer 2024 - now],
  location: [],
  url: [https://github.com/gteufelberger/typst-almeida-cv/],
  tags: [
    - Typst
    - CV
  ],
  [#lorem(20)],
)

#project(
  name: [#lorem(2)],
  short_description: [#lorem(8)],
  dates: [2020 - 2022],
  location: [],
  url: [https://example.com],
  tags: [
    - #lorem(2)
    - #lorem(1)
    - #lorem(3)
  ],
  [#lorem(20)],
)
