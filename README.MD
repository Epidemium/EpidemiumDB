# EpidemiumDB

## What is EpidemiumDB ?
EpidemiumDB is a large public database for Big Data Cancer research. The database is designed to store structured data about more than 200 cancer types, their risk factors, as well as anti-cancers drugs and their side-effects and adverse reactions.
In addition, Epidemium provide links to [Open datasets](http://data.epidemium.cc/dataset) collected by collaborators and contributors to the Epidemium Open Science program. 

## About Epidemium
[Epidemium](http://epidemium.cc) is a participatory project launched in France and formed by a multidisciplinary team of highly qualified scientists and experts in Informatics, Data Sciences, Medicine, and pharmacology grouped together with the desire to advance cancer research using Big Data.

## Contribution 
### Who can contribute ? 
Individuals, research institutions, life-science industrials, and  organisations who are interested in sharing Open Data related to any type of Cancer can submit to EpidemiumDB their data or a link to their resources. Contributors can either add new datasets, or complete existing ones.

### Submit your data to EpidemiumDB 
To submit your data to EpidemiumDB, please contact the Epidemium team at data[a]epidemium.cc 

## Using EpidemiumDB ?
EpidemiumDB is a publicly available resource which is freely accessible to Epidemium project members and external people interested in Open Data in Oncology.
The database is 

### Architecture
EpidemiumDB is based on a relational data model linked to [CKAN](http://ckan.org) data management platform.

### Data Acquisition
*coming soon*

### Database content
The EpidemiumDB database contains the following tables:

| Table Name | Description | Curation Type |
| :---         |     :---:      |          ---: |
| cancerType   | All cancer types    | to do    |
| cancerRiskFactor    | All known risk factor for cancer       | to do      |
| antiCancerDrugs    | All anti cancers drugs       | to do      |

### Validating & versioning of the database EpidemiumDB
*coming soon*

Using EpidemiumDB to run any analysis : 
<<<<<<< Updated upstream
* Check if the datasets needed are available 
* If no, ask to create the table by sending an email to data[a]epidemium.cc or create an issue in the GitHub EpidemiumDB repository
* Add you own dataset in the EpidemiumDB 
=======
1. Check if the datasets needed are available 
2. If no, ask to create the table by sending an email to data[a]epidemium.cc or create an issue in the GitHub EpidemiumDB repository
3. Add you own dataset in the EpidemiumDB 
>>>>>>> Stashed changes

### How to connect to EPidemiumDB
#### Via RMySQL
The R script RMySQLepidemiumDB.R can be used to make direct connection to EpidemiumDB using the RMySQL packages. The later requires DBI library. Using this code, you will be able to make a connection, list tables and fields, retrieve tables, make queries, and export data to text, CVS, Excel, or JSON files. For Excel, the library WriteXLS is used to write an R data frame to excel. For JSON, we used the package df2json (Fig. 1). 

```
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
```
Host name, user, password, and database name are stored in connectDB.R file that need to be called using source() before running the dbConnect() function.

![alt tag](http://wiki.epidemium.cc/wiki/Fichier:RMySQL.png"R/MySQL Interface")




#### using the SQLite version

#### Via the database dump in the GitHub repository

## EpidemiumDB Resources & Documentation 
The Wiki page [EpidemiumDB](http://wiki.epidemium.cc/wiki/EpidemiumDB) (in french) is used to discuss the design and developement of EpidemiumDB.
A Presentation given by Olivier de Fresnoye at the March Meeting of Epidemium is [available online](http://wiki.epidemium.cc/wiki/Fichier:Presentation_EpidemiumDB_11032016.pdf).

## Contact
For more details, do not hesitate to contact the Epidemium team at data[a]epidemium.cc 

