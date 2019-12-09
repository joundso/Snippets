## Buggy stuff with conditional-panels:
    tabBox(
      id = "test1",
      tabPanel(
        title = "Tab 1",
        h1("This is Tab 1")
      ),
      tabPanel(
        title = "Tab 2",
        h1("This is Tab 2")
      ),
      conditionalPanel(
        condition = "false",
        tabPanel(
          title = "Tab 3",
          h1("This is Tab 3")
        ),
      ),
      conditionalPanel(
        condition = "true",
        tabPanel(
          title = "Tab 4",
          h1("This is Tab 4")
        ),
      )
    ),