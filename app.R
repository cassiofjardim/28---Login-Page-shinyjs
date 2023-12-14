library(shiny)
library(fontawesome)
library(shinyjs)

namefirst_page_UI <- function(id) {
  ns <- NS(id)
  tagList(
    h1('Hello World!',style = 'font-size:20rem !important;'),
    h1('Welcome to Shiny Dashboard!')
  )
}

namefirst_page_Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {

    }
  )
}

ui <- fluidPage(
  useShinyjs(),
  # includeCSS(path = 'www/css/login_style_1.css'),
  tags$style("
             @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

*{
font-family: 'Playfair Display',serif;

}

body{
	margin: 0;
	padding: 0;
background-color: #0e6cc4;
	overflow-x:hidden;
	overflow-y:hidden;

}

#div_title{
    flex: 0 ;

  }


h1,h2 {
  font-weight: 600;
  color: #fff;
  text-align: center;
}

h2{
    font-size: 4em ;
}

h2#title_h2,
h1#title_h1{
    font-size: 8rem ;
}


p{
    color: #fff;
    font-style: oblique;
    font-size: 1em;
    width: 80%;
    flex: 0 ;
    display: inline-block;
}


a{
  font-family: 'Roboto', sans-serif;
  font-weight: 700;
  color: black;
}


.container-fluid{

    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

#form_main {
  width: 50%;

}

#form_main form{
  margin-bottom: 1em;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

#form_main form input{
background-color: white;
    border-width: 0;
    color: black;
    height: 3rem;
    width: 100%;
    font-size: 1.25rem;
    border:1px solid #fff;
    padding: 1.5em;
    margin: 1em 0;
}


#form_main form button{
    background: whitesmoke;
    padding: 1em;
    font-size: 1.25em;
    font-weight: 700;
    color: black;
    width: 100%;
}

.bottom_text{
  text-align: center;
  width: 100%;
}


#icons{
  display: flex;
    justify-content: center;
    align-items: flex-start;
}

#icons i{
    font-weight: 900;
    padding: 0 2em;
    font-size: 1.5em;
}

@media only screen and (max-width: 900px) {
  #form_main {
    width: 90%;
    margin: 0 auto;
    position: relative;
    top: 0;
    left: 0;
  }
}

@media only screen and (max-width: 450px) {
  p{
    width: 100%;
  }
  #form_main {
    width: 100%;
    padding: 2em;
    margin: 1.5em;
    top: 0;
    left: 0;
  }
}




@media (width >= 1550px ) {


}

@media (1200px <= width <= 1549px) {



}

@media ( width <= 1199px){



}
             "),

  div(id = 'form_main',

      tags$h2("Sign up to access your Shiny Dashboard"),

      tags$form(
        id = 'form',
        div(
          tags$p("* Required Fields"),
          tags$input(placeholder = 'NAME*'),
          tags$input(placeholder = 'EMAIL*'),
          actionButton(inputId = 'signup_button', label = "SIGNUP"),
          tags$p(class = 'bottom_text',
                 "Read our privacy policy for more information."),
          tags$div(
            id = 'icons',
            fa_i(name = "envelope", style = 'color: whitesmoke; '),
            fa_i(name = "twitter", style = 'color: whitesmoke; '),
            fa_i(name = "globe", style = 'color: whitesmoke; ')
          )
        )
      )),

  hidden(
    div(id = "main_page",
        namefirst_page_UI("main_module")
    )


  ))

server <- function(input, output, session) {

  observeEvent(input$signup_button, {
    # Switch visibility of your login page and main page
    shinyjs::hide("form_main")
    shinyjs::show("main_page")
  })

  namefirst_page_Server("main_module")

}

shinyApp(ui, server)
