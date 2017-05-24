library(shiny)
library(ggplot2)
library(magrittr)
library(dplyr)
require(reshape2)

shinyServer(function(input, output,session) {

    dataframe<-reactive({
        if (is.null(input$datafile))
            return(NULL)
        data<-read.csv(input$datafile$datapath, skip = 4)
       # data<- data %>% group_by(C) %>% mutate(A) %>%
        #    mutate(B) %>% mutate(add = (A+B)) %>% mutate(sub = (A-B))
        #data
    })
    output$table <- renderTable({
        dataframe()
    })
    output$plot <- renderPlot({
        if(!is.null(dataframe()))
            #ggplot(dataframe(),aes(x=X,y=add))+geom_point()
           inspect_raw_data(dataframe())
    })
    output$downloadPlot <- downloadHandler(
        filename = function() { paste(input$dataset, '.png', sep='') },
        content = function(file) {
            print(dataframe())
            fit <- inspect_raw_data(dataframe())
            # pdf(filename="/Users/benjenkins/Documents/Hackathon/andrew-fork/rfret/plotImage.pdf")
            #plot(fit)
            png("/Users/benjenkins/Documents/Hackathon/andrew-fork/rfret/plotImage.png")
            plot(1:10)
            dev.off
            # ggsave("/Users/benjenkins/Documents/Hackathon/andrew-fork/rfret/plotImage.png", plot = inspect_raw_data(dataframe()), device = "png")
        }
    )
})


#
# library(shiny)
# library(gridExtra)
# library(ggplot2)
# i = 1
# shinyServer(function(input, output, session) {
#     source("/Users/benjenkins/Documents/Hackathon/andrew-fork/rfret/R/inspect_raw_data.R")
#     file_list <- c("")
#     reactive_data <- renderText({
#         print("Please printing")
#        for(i in 1:length(input$input_files[,1]))
#        {
#            new_dataframe <- read.csv(input$input_files[i, 'datapath'],
#                                  # header=input$header,
#                                  sep=input$sep,
#                                  quote=input$quote,
#                                  skip = input$skip_rows)
#            comment(new_dataframe) <- input$input_files$name[i]
#            print(class(new_dataframe))
#            if(input$header == FALSE){
#                colnames(new_dataframe) <- c("Well Row","Well Col","Content",
#                                          "fret_channel","donor_channel",
#                                          "acceptor_channel","concentration")
#            }
#            file_list <- c(file_list, new_dataframe)
#        }
#        output$file_list <- file_list
#    })
#
#     dataframe<-reactive({
#         if (is.null(input$input_files))
#             print ("got a null datafile")
#             return(NULL)
#         data<-read.csv(input$datafile$datapath)
#         data<- data %>% group_by(C) %>% mutate(A) %>%
#             mutate(B) %>% mutate(add = (A+B)) %>% mutate(sub = (A-B))
#         data
#     })
#     output$table <- renderTable({
#         dataframe()
#     })
#     output$plot <- renderPlot({
#         if(!is.null(dataframe()))
#             ggplot(dataframe(),aes(x=X,y=add))+geom_point()
#     })
#
#
#
#
#     # output$plotgraph <- renderPlot({
#     #     raw_list <- reactive_data[1]
#     #     raw_plots <- inspect_raw_data(raw_list)
#     #     fig1 <- reactive({raw_plots$donor})
#     #     fig2 <- reactive({raw_plots$acceptor})
#     #     fig3 <- reactive({raw_plots$fret})
#     #     fig_list <- list(fig1(),fig2(),fig3())
#     #     to_delete <- !sapply(fig_list,is.null)
#     #     fig_list <- fig_list[to_delete]
#     #     if (length(ptlist)==0){
#     #         return(NULL)
#     #     }
#     # grid.arrange(grobs=ptlist,ncol=length(ptlist))
#
# })
#

