#import "font-awesome.typ": fa
#import "font-awesome.typ" as fi


#let accentColor = rgb("e3bfb8")

#let resume(firstName: "", lastName: "", picture: [], asideInfo: [], body) = {

  set page(
    margin: (right: 3em, rest: 6em),
    background: align(end, box(height: 100%, width: 100% / 3, fill: rgb("f5f5f5")))
  )

  set text(font: "Roboto", size: 9pt, fill: rgb("666"))

  show heading: it => style(styles => {
    set text(fill: rgb("666"))

    let content = text(font: "Oswald",
      if it.level <= 2 { upper(it.body) } else { it.body }
    )
    let size = measure(content, styles)

    let lineStyle = line(length: 100%, stroke: 0.2pt)
    let doubleLineContent = box(width: 1fr, height: size.height,
      align(horizon, stack(spacing: 2pt, lineStyle, lineStyle)))

    let sp = h(20pt)

    if it.level <= 2 { v(1em) }

    block(if it.level == 1 {
      set text(size: 16pt)
      content + sp + doubleLineContent
    } else if it.level == 2 {
      set text(size: 14pt)
      doubleLineContent + sp + content + sp + doubleLineContent
    } else {
      set text(size: 15pt - 1pt * it.level)
      content
    })
  })


  let mainContent = {
    let nameStyle(..args, content) = {
      text(font: "Oswald", weight: 500, size: 4em, upper(content), ..args)
    }

    nameStyle(fill: rgb("aaa"), firstName) + h(1em) + nameStyle(fill: rgb("e3bfb8"), lastName)

    body
  }

  let asideContent = block(
    inset: (top: -2em, rest: 2em),
    breakable: true,
    {
      block(radius: 40em, clip: true,
      square(picture, width: 100%, inset: 0pt))

      v(2em)

      asideInfo
  })

  grid(columns: (2fr, 1fr), column-gutter: 2em,
    mainContent,
    asideContent
  )
}

#let pill(content) = {
  box(radius: 50%, fill: accentColor, inset: 3pt,
    text(fill: white, content))
}

#let circFa(icon) = {
  square(outset: 4pt, inset: 0pt, fill: accentColor, radius: 50%,
    text(fill: white, fa(icon)))
}

// Education
#let education(name: [], institution: [], dates: [], focus_areas: [], content) = {
  grid(columns: (3fr, 1fr), column-gutter: 5pt,
    [=== #name],

    align(end, {
      text(fill: accentColor, fi.map-icon.marker-alt)
      h(4pt)
      text(fill: gray, institution)
    }),

    align(
      end,
      text(fill: accentColor, fi.clock) + h(4pt) + text(fill: gray, dates)
    ),
  )

  content

  if focus_areas != [] {
    "With focus on:\n"
    show list: items => {
      items.children.map(c => h(2pt) + pill(c.body) + h(2pt)).join()
    }
    focus_areas
  }
}

#let company(name: [], location: [], content) = {
  grid(columns: (3fr, 1fr), column-gutter: 5pt,
    [==== #name],
    align(end, {
      text(fill: accentColor, fi.map-icon.marker-alt)
      h(4pt)
      text(fill: gray, location)
    })
  )

  content
}

#let position(title: [], dates: [], description: [], skills: []) = {
  box(
    stroke: (left: gradient.linear(gray, white, angle: 90deg)),
    width: 100%,
    inset: (left: 8pt), {
      grid(columns: (5fr, 2fr), column-gutter: 5pt,
        [===== #title],
        align(end, text(fill: accentColor, fi.clock) + h(4pt) + text(fill: gray, dates))
      )

      description

      show list: items => {
        align(end, items.children.map(
          c => h(2pt) + pill(c.body) + h(2pt)).join())
      }
      skills
    }
  )
}

// Project
#let project(
  name: [],
  short_description: [],
  dates: [],
  location: [],
  url: [],
  tags: [],
  content,
) = {
  grid(columns: (3fr, 1fr), column-gutter: 5pt,
    [==== #name],
    align(end, {
      text(fill: accentColor, fi.map-icon.marker-alt)
      h(4pt)
      text(fill: gray, location)
    })
  )
  text()[
    ===== #short_description
  ]

  text()[
    #dates

    #location
  ]

  if url.has("dest") {
    if url.dest.contains("https://github.com/") {
      fa(fi.github) + h(4pt)
    }
    if url.dest.contains("https://gitlab") {
      fa(fi.gitlab) + h(4pt)
    }

    link(url.dest)
  }

  v(5pt)

  content

  show list: items => {
    align(end, items.children.map(
      c => h(2pt) + pill(c.body) + h(2pt)
    ).join())
  }
  tags
}

// Publication
#let publication(
  name: [],
  short_description: [],
  date: [],
  location: [],
  url: [],
  tags: [],
  content,
) = {

  grid(columns: (3fr, 1fr), column-gutter: 5pt,
    [==== #name],
    align(end, {
      text(fill: accentColor, fi.map-icon.marker-alt)
      h(4pt)
      text(fill: gray, location)
    })
  )
  text()[
    ===== #short_description
  ]

  text()[
    #date

    #location
  ]

  if url.has("dest") {
    link(url.dest)
  }

  v(5pt)

  content

  show list: items => {
    align(end, items.children.map(
      c => h(2pt) + pill(c.body) + h(2pt)
    ).join())
  }
  tags
}
