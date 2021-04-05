shinyUI(
  fluidPage(
    #Icono en tab de browser
    tags$link(rel = "icon", type = "image/gif", href = "https://iili.io/K12u2I.png"),
    tagList(tags$head(
      tags$link(rel="shortcut icon", href="cne.ico", type="image/x-icon"),
      # tags$link(rel='stylesheet',type='text/css',href='estilo.css'),
      tags$script(type='text/javascript',src='md5.js'),
      tags$script(type='text/javascript',src='passwdInputBinding.js')
    )),
    img(src="banner.jpg",height=100, width="100%"),
    titlePanel(
      title='',
      windowTitle='Reporteador Precios'
    ),
    uiOutput('uiLogin'),
    uiOutput('uiApp')
  )
)
