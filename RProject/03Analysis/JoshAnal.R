library("ggplot2", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
library("lubridate", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.1")
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
orgCode = 1:5
name = c("Corporation", "Trust", "Co-operative", "Partnership", "Association")
orgMapping = data.frame(Code = orgCode, Description = name)
classCode = 1:8
className = c("Charitable Organization", "Educational Organization", "Literary Organization", "Organizations to prevent cruelty to animals", "Organizations to prevent cruelty to children", "Organizations for Public Safety Testing", "Religious Organizations", "Scientific Organizations")
classMapping = data.frame(Code = classCode, Description = className)
c3 <- subset(allResults, SUBSECTION == '03')
ggplot(data = allResults) + geom_histogram(aes(x=SUBSECTION))
c3$CLASSIFICATION = as.character(floor(as.numeric(c3$CLASSIFICATION)/1000))
ggplot(data = c3) + geom_histogram(aes(x = CLASSIFICATION, fill = INCOME_CD))
ggplot(data = c3) + geom_histogram(aes(x = CLASSIFICATION, fill = ASSET_CD))
classMapping  
ggplot(data = c3) + geom_histogram(aes(x = STATE))  
ggplot(data = c3) + geom_histogram(aes(x = ORGANIZATION))
orgMapping
Wealthiest  <- subset(c3, ASSET_CD == '9')
ggplot(data=Wealthiest) + geom_histogram(aes(x=STATE))
ggplot(data=Wealthiest) + geom_point(aes(x=ASSET_AMT, y=INCOME_AMT)) + theme(axis.text.x=element_blank(), axis.text.y=element_blank())
ggplot(data = c3) + geom_histogram(aes(x = ASSET_CD, fill = INCOME_CD))

