library(shiny)

master_timetable <- read.csv("master.csv")

shinyUI(fluidPage(
    titlePanel(title = h3("Department of Statistics, Time Table", align = "center")),
    sidebarLayout(
        sidebarPanel(
            radioButtons("table_type", "Select option", choices = c("Teacher-Wise", "Semester-Wise", "Room-Wise"),
                         selected = character(0)),
            conditionalPanel(
                condition = "input.table_type == 'Teacher-Wise'",
                selectInput("teacher_name", "Select Teacher Name", choices = sort(unique(master_timetable$Teacher)))
            ),
            conditionalPanel(
                condition = "input.table_type == 'Semester-Wise'",
                selectInput("semester_name", "Select Semester", choices = sort(unique(master_timetable$Semester)))
            ),
            conditionalPanel(
                condition = "input.table_type == 'Room-Wise'",
                selectInput("room_name", "Select Room Number", choices = sort(unique(master_timetable$Room_No)))
            )
            
        ),
        mainPanel(
            conditionalPanel(
                condition = "input.table_type == 'Teacher-Wise'",
                tableOutput("out_teacher_table")
            ),
            conditionalPanel(
                condition = "input.table_type == 'Room-Wise'",
                tableOutput("out_room_table")
            ),
            conditionalPanel(
                condition = "input.table_type == 'Semester-Wise'",
                tableOutput("out_semester_table")
            )
        )
    )
    
))