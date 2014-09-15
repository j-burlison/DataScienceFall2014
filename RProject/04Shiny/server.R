# server.R

library(shiny)

library("ggplot2")
library("lubridate")
options(java.parameters="-Xmx2g")
library(rJava)
library(RJDBC)

jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="/home/jbur/w/jdk1.7.0_65/ojdbc6.jar")

# In the following, use your username and password instead of "CS347_prof", "orcl_prof" once you have an Oracle account
possibleError <- tryCatch(
  jdbcConnection <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@128.83.138.158:1521:orcl", "C##cs347_jcb3564", "orcl_jcb3564"),
  error=function(e) e
)
if(!inherits(possibleError, "error")){ 
  res <- dbSendQuery(jdbcConnection, "select * from NONPROFS where rownum < 677179")
  result<-list() 
  i=1 
  result[[i]]<-fetch(res,n=100000) 
  while(nrow(chunk <- fetch(res, n = 100000))>0){ 
    i<-i+1 
    result[[i]]<-chunk 
  } 
  allResults<-do.call(rbind,result) 
  
  dbDisconnect(jdbcConnection)
}

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    ggplot(data = c3) + geom_histogram(aes(x = ASSET_CD, fill = INCOME_CD))
  })
})
