#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script File: RMySQLepidemiumDB.R  
# Date of creation: 21 avril 2016
# Date of last modification: 22 avril 2016
# Author: Seraya Maouche <seraya.maouche@iscb.org>
# Project: EpidemiumDB (http://www.epidemium.cc)
# Short Description: This script provides functionalities to access 
#                    the EpidemiumDB from R
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Install RMySQL package 
install.packages("RMySQL")

# Load required packages
library("DBI")
library("sqldf")
library("WriteXLS")
library("rjson")
library("jsonlite")
library("df2json")


# Load RMySQL
library(RMySQL)

# Connect to EpidemiumDB
# create a database connection object
# the user, password, host and database name are stored in a separate file
# called connectDB.R that need to be called before bdConnect() function.
setwd("/home/common/database/")
source("connectDB.R")
epidemiumDB = dbConnect(MySQL(), user=user, password=password, dbname=dbname, host=host)

# Listing tables
# This will return a list of the tables in the established connection. 
dbListTables(epidemiumDB)

# Listing fields
# this function will return all fields in the cancerType table.
dbListFields(epidemiumDB, 'cancerType')

# Retrieving data from EpidemiumDB database
#To retrieve data from the database we need to save a results set object.
request <- dbSendQuery(mydb, "select * from metadata")
# To access the results in R, we need to use the fetch() function.
metadata <- fetch(request, n=-1)
#The fetch() functions saves the results of the query as a data frame object. 
# you can use head(), dim() and all functions that can be applied on a data frame
dim(metadata)
head(metadata)
names(metadata)

# Export a table to a TXT file
outDir <- "/home/common/data/"
fileName <- "allMeta"
fileOut <-  paste(fileName, format(Sys.time(), "%Y-%m-%d"), "txt", sep = ".")
setwd(outDir)
write.table(metadata, fileOut, sep="\t")

#Export a table to a CSV file
outDir <- "/home/common/data/"
fileName <- "allMeta"
fileOut <-  paste(fileName, format(Sys.time(), "%Y-%m-%d"), "csv", sep = ".")
setwd(outDir)
write.table(metadata, file = fileOut,row.names=FALSE, na="",col.names=TRUE, sep=",")

# Export data to Excel
outDir <- "/home/common/data/"
fileName <- "allMeta"
fileOut <-  paste(fileName, format(Sys.time(), "%Y-%m-%d"), "xlsx", sep = ".")
WriteXLS(metadata, fileout)

# Export data in JSON Format
outDir <- "/home/common/data/"
meta_json <- toJSON(metadata)
cat(meta_json)
#another intersting function : metadata_json <- matrix2json(metadata)

# Send queries to EpidemiumDB
q1 = dbGetQuery(epidemiumDB, "select * from metadata where metadata_name like '%cadmium_emission%'")
q1

# Closing active connections
dbListConnections(dbDriver( drv = "MySQL"))
