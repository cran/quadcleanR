#' @title Visualize cleaned data
#' @description Using an interactive shiny app, visualize and explore cleaned
#'     quadrat data.
#'
#' @param data A data frame containing cleaned quadrat data.
#' @param yaxis The yaxis variable column names found in `data`.
#' @param xaxis The xaxis variable column names found in `data`.
#'
#' @return A shiny app launched in your browser.
#' @export
#'
#' @examples
#' year <- sample(x = seq(from = 2000, to = 2020, by = 1), 1000, replace = TRUE)
#' site <- sample(x = c("site1", "site2", "site3", "site4", "site5"), 1000, replace = TRUE)
#' transect <- sample(x = c("transect1", "transect2", "transect3", "transect4"),
#'     1000, replace = TRUE)
#' species <- sample(x = c("Acropora", "Gardineroseris", "Psammocora", "Leptastrea"),
#'     1000, replace = TRUE)
#' cover <- sample(x = seq(from = 0, to = 1, by = 0.01), 1000, replace = TRUE)
#'
#' coral <- data.frame(year, site, transect, species, cover)
#'
#'if (interactive()) {
#' visualize_app(data = coral, xaxis = colnames(coral[,1:4]), yaxis = "cover")
#' }
#'
visualize_app <- function(data, xaxis, yaxis) {

  ui <- shinydashboard::dashboardPage( skin = "purple",
             shinydashboard::dashboardHeader(title = "Data Visualization"),
              shinydashboard::dashboardSidebar(disable = TRUE),
              shinydashboard::dashboardBody(
                shiny::fluidRow(
                  shinydashboard::box(shiny::selectInput("yaxis", "Choose a y-axis variable:", yaxis),
                               shiny::selectInput("xaxis", "Choose an x-axis variable:", xaxis),
                               shiny::selectInput("colour", "Choose a color variable:", xaxis, selected = xaxis[2]),
                               shiny::checkboxInput("continuous", "Treat as discrete", value = TRUE),
                               shiny::selectInput("facet", "Choose a facet variable:", c("no facet", xaxis), selected = "null"),
                               shiny::checkboxGroupInput("group_by", "Choose variable(s) to group by and average:", xaxis, selected = xaxis),
                               width = 4,
                               title = "Customization",
                               solidHeader = FALSE,
                               height = "100vh"),
                  shinydashboard::box(shinyWidgets::radioGroupButtons(
                             inputId = "change_plot",
                             choices = c(c("box", "violin", "scatter", "stacked bar")),
                             justified = TRUE,
                             selected = "box"
                           ),
                           shiny::plotOutput("prettyplot",
                                             height = "80vh"),
                           width = 8,
                           title = "Plot",
                           solidHeader = FALSE,
                           height = "100vh")),
                shinydashboard::box(shiny::htmlOutput("subsetting"),
                                    shiny::textOutput("code"),
                             width=12,
                             justified = TRUE,
                             title = "R Code")
                       )
  )


  server <- function(input, output) {

    output$prettyplot <- shiny::renderPlot({

      data_plot <- data %>%
        dplyr::group_by_at(input$group_by) %>%
        dplyr::summarise_at(dplyr::vars(dplyr::one_of(input$yaxis)), list(yaxis_grouped = mean))


      if(length(input$group_by) != length(yaxis)){
        y_axis_name <- paste("mean_", input$yaxis)
      } else {
        y_axis_name <- input$yaxis
      }

      if (input$facet %in% "no facet") {
        if (input$change_plot %in% "box") {
          ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
            ggplot2::geom_boxplot() +
            ggplot2::theme_classic() +
            ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
            viridis::scale_fill_viridis(discrete = input$continuous) +
            ggplot2::labs(y = y_axis_name)
        } else{

          if (input$change_plot %in% "violin") {
            ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
              ggplot2::geom_violin() +
              ggplot2::theme_classic() +
              ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
              viridis::scale_fill_viridis(discrete = input$continuous)+
              ggplot2::labs(y = y_axis_name)
          } else {

            if (input$change_plot %in% "scatter") {
              ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, color = input$colour)) +
                ggplot2::geom_point() +
                ggplot2::theme_classic() +
                ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                viridis::scale_colour_viridis(discrete = input$continuous)+
                ggplot2::labs(y = y_axis_name)
            } else {

              if (input$change_plot %in% "stacked bar") {
                ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                  ggplot2::geom_bar(position="stack", stat="identity") +
                  ggplot2::theme_classic() +
                  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                  viridis::scale_fill_viridis(discrete = input$continuous)+
                  ggplot2::labs(y = y_axis_name)
              }}}}} else {

                if (input$change_plot %in% "box") {
                  ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                    ggplot2::geom_boxplot() +
                    ggplot2::theme_classic() +
                    ggplot2::facet_wrap(~get(input$facet)) +
                    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                    viridis::scale_fill_viridis(discrete = input$continuous)+
                    ggplot2::labs(y = y_axis_name)
                } else{

                  if (input$change_plot %in% "violin") {
                    ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                      ggplot2::geom_violin() +
                      ggplot2::theme_classic() +
                      ggplot2::facet_wrap(~get(input$facet)) +
                      ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                      viridis::scale_fill_viridis(discrete = input$continuous)+
                      ggplot2::labs(y = y_axis_name)
                  } else {

                    if (input$change_plot %in% "scatter") {
                      ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, color = input$colour)) +
                        ggplot2::geom_point() +
                        ggplot2::theme_classic() +
                        ggplot2::facet_wrap(~get(input$facet)) +
                        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                        viridis::scale_colour_viridis(discrete = input$continuous)+
                        ggplot2::labs(y = y_axis_name)
                    } else {

                      if (input$change_plot %in% "stacked bar") {
                        ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                          ggplot2::geom_bar(position="stack", stat="identity") +
                          ggplot2::theme_classic() +
                          ggplot2::facet_wrap(~get(input$facet)) +
                          ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                          viridis::scale_fill_viridis(discrete = input$continuous)+
                          ggplot2::labs(y = y_axis_name)
                      }}}}}
    })

    output$subsetting <- shiny::renderUI({

      if(length(input$group_by) != length(yaxis)){
        y_axis_name <- paste("mean_", input$yaxis, sep="")

        group_by_vector <- paste(input$group_by,collapse=", ")

        data_name <- sprintf(paste(
          "data <- data_raw"))

        grouped_raw <- sprintf(paste(
          "group_by(", group_by_vector, ")"))

        paste(
          "group_by(", yaxis, ")")

        summarized_raw <- sprintf(paste(
          "summarize(%s = mean(%s))"),
          y_axis_name, input$yaxis)

        shiny::HTML(paste(data_name, grouped_raw, summarized_raw, sep = ' %>% '))


      } else {}

    })

    output$code <- shiny::renderText({


      if(length(input$group_by) != length(yaxis)){
        y_axis_name <- paste("mean_", input$yaxis, sep = "")
      } else {
        y_axis_name <- input$yaxis
      }

      code_code <- sprintf(paste(
        "plot <- ggplot(data, aes(x = %s, y = %s"),
        input$xaxis, y_axis_name
      )


      if(input$change_plot %in% "box"){
        code_code <- sprintf(paste(
          code_code, ", fill = %s)) +\n
        geom_boxplot() + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_fill_viridis(discrete = %s)"),
        input$colour, input$continuous)} else {

          if(input$change_plot %in% "violin"){
            code_code <- sprintf(paste(
              code_code, ", fill = %s)) +\n
        geom_violin() + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_fill_viridis(discrete = %s)"),
        input$colour, input$continuous)} else {

          if(input$change_plot %in% "scatter"){
            code_code <- sprintf(paste(
              code_code, ", color = %s)) +\n
        geom_boxplot() + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_colour_viridis(discrete = %s)"),
        input$colour, input$continuous)} else {

          if(input$change_plot %in% "stacked bar"){
            code_code <- sprintf(paste(
              code_code, ", fill = %s)) +\n
        geom_bar(position = 'stacked', stat = 'identity') + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_fill_viridis(discrete = %s)"),
        input$colour, input$continuous)}}}}

      if(!input$facet %in% "no facet"){
        code_code <- sprintf(paste(
          code_code, " +\n",
          "facet_wrap(vars(%s))"),
          input$facet)} else {

            code_code <- code_code
          }

    })


  }

shiny::shinyApp(ui, server)

}
