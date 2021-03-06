library("ggplot2", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
library("lubridate", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
options(java.parameters="-Xmx2g")
library(rJava)
library(RJDBC)

jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="C:/Program Files/Java/jdk1.7.0_67/ojdbc6.jar")

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


