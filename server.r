library(shiny)

master_timetable <- read.csv("master.csv")

shinyServer(function(input, output){
    
    t_type <- reactive({input$table_type})
    
    # if(t_type() == "Teacher-Wise"){
    #     tt_subset <- reactive({
    #         a <- subset(master_timetable, Teacher == input$teacher_name)
    #         return(a)
    #     })
    # } else if(t_type() == "Semester-Wise"){
    #     tt_subset <- reactive({
    #         a <- subset(master_timetable, Semester == input$semester_name)
    #         return(a)
    #     })
    # } else{
    #     tt_subset <- reactive({
    #         a <- subset(master_timetable, Room_No == input$room_name)
    #         return(a)
    #     })
    # }
    # output$out_table <- renderTable(tt_subset())

    
    teacher_subset <- reactive({
        d <- subset(master_timetable, Teacher == input$teacher_name)
        return(d)
    })
    room_subset <- reactive({
        d <- subset(master_timetable, Room_No == input$room_name)
        return(d)
    })
    semester_subset <- reactive({
        d <- subset(master_timetable, Semester == input$semester_name)
        return(d)
    })
    
    output$out_teacher_table <- renderTable(teacher_subset(), align='c')
    output$out_room_table <- renderTable(room_subset(), align='c')
    output$out_semester_table <- renderTable(semester_subset(), align='c')
    
    # if(t_type() == "Teacher-Wise"){
    #   renderTable({
    #       output$out_table <- subset(master_timetable, Teacher == input$teacher_name)
    #   })
    # } else if(t_type() == "Semester-Wise"){
    #   output$out_table <- subset(master_timetable, Semester == input$semester_name)
    # } else{
    #   output$out_table <- subset(master_timetable, Room_No == input$room_name)
    # }
})

