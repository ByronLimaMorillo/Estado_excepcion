USER <- reactiveValues(Logged=FALSE)
isManager<-reactiveValues(Value=FALSE)

output$uiLogin <- renderUI({
  if (USER$Logged==FALSE) {
    fluidPage(
      br(),
      br(),
      br(),
      div(class='login',
          wellPanel(
            h5(textInput('user','Usuario:')),
            h5(passwordInput('pass','Contraseña:')),
            h3(actionButton('login','Iniciar Sesión',icon('paper-plane'))),
            h4(textOutput('mensaje'))
          )
      )
    )
  }
})

output$mensaje <- renderText({
  if (USER$Logged == FALSE) {
    if (!is.null(input$login)) {
      if (input$login > 0) {
        U <- isolate(input$user)
        P <- isolate(input$pass)
        Id.U <- which(w$in1==U)
        Id.P <- which(w$in2==P)
        if (length(Id.U) > 0 & length(Id.P) > 0) {
          if (Id.U == Id.P) {
            USER$Logged <- TRUE
            if (Id.U==1 & Id.P==1){
              isManager$Value<-TRUE
            } else{
              isManager$Value<-FALSE
            }
          }
          else  {
            'Usuario y/o contraseña incorrectos!'
          }
        } else  {
          'Usuario y/o contraseña incorrectos!'
        }              
      }
    }
  }
})
