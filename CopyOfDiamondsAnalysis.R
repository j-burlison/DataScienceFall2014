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
  nonprofs <- dbGetQuery(jdbcConnection, "select * from NONPROFS where rownum < 150001")
  dbDisconnect(jdbcConnection)
}

possibleError <- tryCatch(
  jdbcConnection <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@128.83.138.158:1521:orcl", "C##cs347_jcb3564", "orcl_jcb3564"),
  error=function(e) e
)