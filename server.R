shinyServer(function(input,output,session) {
  source('global.R')
  source('login.R',local=TRUE)
  
  
  observe(
    if (USER$Logged==TRUE & isManager$Value==TRUE) {
      output$uiApp <- renderUI ({
        
        dashboardPage(title="Cáñamo-MAG",
                      dashboardHeader(
                        # 
                        # title = HTML("<div style>
                        #           <img src = 'https://iili.io/K1d1J1.png' width='160' height = '90'  >
                        #           </div>")
                        ),
                      dashboardSidebar(
                        sidebarMenu(id = "menu"),
                        hr(),
                        uiOutput("u_i1")
                        
                      ),
                      dashboardBody(
                        #Icono en tab de browser
                        tags$link(rel = "icon", type = "image/gif", href = "https://iili.io/K12u2I.png"),
                        
                        
                        
                        tags$head(tags$style(HTML('
                           
          .form-control {
            border-radius: 4px 4px 4px 4px;
        }
                          /* Imagen de header */
                              .skin-blue .main-header .navbar {
                              height: 100px;
                              background-image:url("https://iili.io/K1dc0B.jpg");
                              background-size: 1700px 100px;
                              background-repeat: no-repeat;
                              
                               }

                         /* color del logo */
                               .skin-blue .main-header .logo {
                                background-color: #222d32;
                                height: 100px;
                                }

                        /* color del logo con cursor */
                                .skin-blue .main-header .logo:hover {
                                background-color:  #222d32;
                                }

                        /* color de botón menú  */
                              .skin-blue .main-header .navbar .sidebar-toggle:hover{
                              background-color: #d5d6da;
                               }

                        /* color de sidebar */
                                .skin-blue .main-sidebar {
                                background-color: #222d32;
                                top: 48px;
                                
                                }
                                
                        /* body */
                                .content-wrapper .right-side {
                                background-color: #ffffff;
                                }
                        /* letra de box */
                        
                                .box-header h3.box-title {
                                 font-weight: bold;
                                 text-align: center;
                                }
                                
                                 
                                
                                  '))),
                        
                        
                      )
        )
        
      })
    }
    
    
  )
   

  
  
  
  
})