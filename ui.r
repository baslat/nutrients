#### start UI ####
ui <- fluidPage(# Sidebar layout with a input and output definitions
  titlePanel("Bas's knock-off MFP"),
  
  
  
  sidebarLayout(
    # Inputs
    sidebarPanel(
      
      # Select variable for gender
      selectInput(
        inputId = "ui_gender",
        label = "Male or female?*",
        choices = genders,
        selected = genders[2],
        multiple = F
      ),
      
      
      # Select variable for age
      selectInput(
        inputId = "ui_age",
        label = "Age range?*",
        choices = ages,
        selected = ages[6],
        multiple = F
      ),      
      
      # Select variable for condition
      selectInput(
        inputId = "ui_condition",
        label = "Special conditions?*",
        choices = conditions,
        selected = conditions[2],
        multiple = F
      ),
      
      # Select variable for food 1
      selectizeInput(
        inputId = "ui_food_1",
        label = "Pick a food (1)*",
        choices = food_names,
        selected = food_names[333],
        multiple = F
      ),
      
      # Select serving size for food 1
      numericInput(
        inputId = "ui_food_1_serve",
        label = "How many grams of food 1*",
        min = 0,
        max = NA,
        value = 100
      ),
      
      # Select variable for food 2
      selectizeInput(
        inputId = "ui_food_2",
        label = "Pick a food (2)",
        choices = food_names,
        selected = food_names[3333],
        multiple = F
      ),
      
      # Select serving size for food 2
      numericInput(
        inputId = "ui_food_2_serve",
        label = "How many grams of food 2*",
        min = 0,
        max = NA,
        value = 100
      ),
 
      # Select variable for food 3
      selectizeInput(
        inputId = "ui_food_3",
        label = "Pick a food (3)*",
        choices = food_names,
        selected = NA,
        multiple = F
      ),
      
      # Select serving size for food 3
      numericInput(
        inputId = "ui_food_3_serve",
        label = "How many grams of food 3*",
        min = 0,
        max = NA,
        value = 100
      ),
      
      # Select variable for food 4
      selectizeInput(
        inputId = "ui_food_4",
        label = "Pick a food (4)",
        choices = food_names,
        selected = NA,
        multiple = F
      ),
      
      # Select serving size for food 4
      numericInput(
        inputId = "ui_food_4_serve",
        label = "How many grams of food 4*",
        min = 0,
        max = NA,
        value = 100
      ),
      
      # Select serving size for food 4
      selectInput(
        inputId = "ui_chart_style",
        label = "Chart options*",
        choices = chart_options,
        selected = chart_options[2]
      )     
      
  
      
    ),
    
    # Outputs
    mainPanel(
      plotOutput(outputId = "energy_chart"),
      br(),br(),
      plotOutput(outputId = "mineral_chart"),
      br(),br(),
      plotOutput(outputId = "vitamin_chart")
      # dataTableOutput(outputId = "datatable")
      #dataTableOutput(outputId = "nutrient_table")
    )
  ))
#### end UI ####