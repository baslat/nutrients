#### start server ####


server <- function(input, output) {
  


  
  # Create bar plot object the plotOutput function is expecting
  output$energy_chart <- renderPlot({
    
   
    #require monst things
    req(input$ui_age, input$ui_gender, input$ui_condition, input$ui_food_1)
    
    serves <- rbind(input$ui_food_1_serve, input$ui_food_2_serve, input$ui_food_3_serve, input$ui_food_4_serve)
    selected_foods <- rbind(input$ui_food_1, input$ui_food_2, input$ui_food_3, input$ui_food_4)
    selected_foods_tbl <- cbind(selected_foods, serves)
    colnames(selected_foods_tbl) <- c("food", "serve")
    selected_foods_tbl <- as.tibble(selected_foods_tbl)   
    selected_foods_tbl$serve <- as.numeric(selected_foods_tbl$serve)
    
    
    #filter rdis to match the demos
    selected_rdi <- rdis %>%
      filter(Age == input$ui_age, Gender == input$ui_gender, Condition == input$ui_condition)
    
    # filter the foods
    df_foods <- food_df_long %>%
      filter(`Food Name` %in% selected_foods, `Sub-category` == "Energy") %>%
      left_join(selected_foods_tbl, by = c("Food Name" = "food")) %>%
      left_join(selected_rdi, by = c("Nutrient" = "nutrient_ausnut")) %>%
      mutate(pct = (serve / 100) * Value.x / Value.y)
    

    ggplot(data = df_foods, aes(x = Nutrient, y = pct, fill = `Food Name`, label = scales::percent(pct))) +
      geom_bar(stat = "identity", position = input$ui_chart_style) + 
      geom_label(position = position_dodge(width = 1)) +
      scale_fill_brewer(palette = "Accent", name = "") + 
      labs(title = "Energy content", subtitle = "Percent of daily recommended dietary intake", y = "Percent", x = "") +
      theme_minimal() + 
      theme(legend.position = "top") +
      guides(fill = guide_legend(nrow = 2)) +
      scale_y_continuous(labels = percent) + 
      scale_x_discrete(labels = function(x) str_wrap(x, width = 30))
  })

  output$mineral_chart <- renderPlot({
    
    
    
    #require monst things
    req(input$ui_age, input$ui_gender, input$ui_condition, input$ui_food_1)
    
    serves <- rbind(input$ui_food_1_serve, input$ui_food_2_serve, input$ui_food_3_serve, input$ui_food_4_serve)
    selected_foods <- rbind(input$ui_food_1, input$ui_food_2, input$ui_food_3, input$ui_food_4)
    selected_foods_tbl <- cbind(selected_foods, serves)
    colnames(selected_foods_tbl) <- c("food", "serve")
    selected_foods_tbl <- as.tibble(selected_foods_tbl)   
    selected_foods_tbl$serve <- as.numeric(selected_foods_tbl$serve)
    
    
    #filter rdis to match the demos
    selected_rdi <- rdis %>%
      filter(Age == input$ui_age, Gender == input$ui_gender, Condition == input$ui_condition)
    
    # filter the foods
    df_foods <- food_df_long %>%
      filter(`Food Name` %in% selected_foods, `Sub-category` == "Minerals") %>%
      left_join(selected_foods_tbl, by = c("Food Name" = "food")) %>%
      left_join(selected_rdi, by = c("Nutrient" = "nutrient_ausnut")) %>%
      mutate(pct = (serve / 100) * Value.x / Value.y)
    
    
    ggplot(data = df_foods, aes(x = Nutrient, y = pct, fill = `Food Name`, label = scales::percent(pct))) +
      geom_bar(stat = "identity", position = input$ui_chart_style) + 
      geom_label(position = position_dodge(width = 1)) +
      scale_fill_brewer(palette = "Accent", name = "") + 
      labs(title = "Mineral content", subtitle = "Percent of daily recommended dietary intake", y = "Percent", x = "") +
      theme_minimal() + 
      theme(legend.position = "top") +
      guides(fill = guide_legend(nrow = 2)) +
      scale_y_continuous(labels = percent) + 
      scale_x_discrete(labels = function(x) str_wrap(x, width = 30))
  })
  
  output$vitamin_chart <- renderPlot({
    
    
    #require monst things
    req(input$ui_age, input$ui_gender, input$ui_condition, input$ui_food_1)
    
    serves <- rbind(input$ui_food_1_serve, input$ui_food_2_serve, input$ui_food_3_serve, input$ui_food_4_serve)
    selected_foods <- rbind(input$ui_food_1, input$ui_food_2, input$ui_food_3, input$ui_food_4)
    selected_foods_tbl <- cbind(selected_foods, serves)
    colnames(selected_foods_tbl) <- c("food", "serve")
    selected_foods_tbl <- as.tibble(selected_foods_tbl)   
    selected_foods_tbl$serve <- as.numeric(selected_foods_tbl$serve)
    
    
    #filter rdis to match the demos
    selected_rdi <- rdis %>%
      filter(Age == input$ui_age, Gender == input$ui_gender, Condition == input$ui_condition)
    
    # filter the foods
    df_foods <- food_df_long %>%
      filter(`Food Name` %in% selected_foods, `Sub-category` == "Vitamins") %>%
      left_join(selected_foods_tbl, by = c("Food Name" = "food")) %>%
      left_join(selected_rdi, by = c("Nutrient" = "nutrient_ausnut")) %>%
      mutate(pct = (serve / 100) * Value.x / Value.y)
    
    
    ggplot(data = df_foods, aes(x = Nutrient, y = pct, fill = `Food Name`, label = scales::percent(pct))) +
      geom_bar(stat = "identity", position = input$ui_chart_style) + 
      geom_label_repel(position = position_dodge(width = 1)) +
      scale_fill_brewer(palette = "Accent", name = "") + 
      labs(title = "Vitamin content", subtitle = "Percent of daily recommended dietary intake", y = "Percent", x = "") +
      theme_minimal() + 
      theme(legend.position = "top") +
      guides(fill = guide_legend(nrow = 2)) +
      scale_y_continuous(labels = percent) + 
      scale_x_discrete(labels = function(x) str_wrap(x, width = 30))
  })
  
  #### data table ####
  
  # output$datatable <- renderDataTable({
  #   req(input$foods)
  #   dat <- food_wide[,c(5,1,2,4,3)] %>%
  #     filter(`Food Name` %in% input$foods) %>%
  #     datatable() %>%
  #     formatPercentage(2:5, 1)
  #   
  #   
  # })
  #### end data table ####
}


#### end server ####