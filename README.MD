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
<<<<<<< Updated upstream
* To submit your data to EpidemiumDB, please contact the Epidemium team at data[a]epidemium.cc 
* For Epidemium's members, before making a request to add a new table, please check whether similar table is already created.
* If not, please describe your table using the [EpidemiumDB Wiki page](http://wiki.epidemium.cc/wiki/EpidemiumDB) and send an email to    data[a]epidemium.cc or create an issue in the GitHub EpidemiumDB repository.
>>>>>>> Stashed changes

Using EpidemiumDB to run any analysis 
<<<<<<< Updated upstream
* Check if the datasets needed are available 
* If no, ask to create the table by sending an email to data[a]epidemium.cc or create an issue in the GitHub EpidemiumDB repository
* Add you own dataset in the EpidemiumDB 
=======
1. Check if the datasets needed are available 
2. If no, ask to create the table by sending an email to data[a]epidemium.cc or create an issue in the GitHub EpidemiumDB repository
3. Add you own dataset in the EpidemiumDB 
>>>>>>> Stashed changes


## Using EpidemiumDB
EpidemiumDB is a publicly available resource which is freely accessible to Epidemium project members and external people interested in Open Data in Oncology.
In addition to a Web interface and visualization evironement, we provide R, Python and Perl scripts to access, query, retrieve, and export EpidemiumDB data.

### How to connect to EpidemiumDB ?
#### R/EpidemiumDB interface
The R script RMySQLepidemiumDB.R can be used to make direct connection to EpidemiumDB using the [RMySQL packages](https://cran.r-project.org/web/packages/RMySQL/index.html). The later requires DBI library. Using this code, you will be able to make a connection, list tables and fields, retrieve tables, make queries, and export data to text, CVS, Excel, or JSON files. For Excel, the library WriteXLS is used to write an R data frame to excel. For JSON, we used the package df2json (Fig. 1). 

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

#### Python/EpidemiumDB interface
We provide an example script in Python that you can use to connect to EpidemiumDB using
[MySQLdb](http://mysql-python.sourceforge.net)

```
# Install MySQLdb
#!/usr/bin/python
import MySQLdb
# Open database connection
db = MySQLdb.connect(host="host_name",    # host name (IP address for Epidemium.cc)
                     user="username",     # your username
                     passwd="password",   # your password
                     db="epidemiumdb")    # name of the database


# Prepare a cursor object using cursor()
cursor = db.cursor()

# Send and SQL query using execute()
cursor.execute("SELECT VERSION()")

# Fetch a single row using fetchone()
data = cursor.fetchone()
print "Database version : %s " % data

cursor.execute("SELECT * FROM metadata")
rows = cursor.fetchall()
```
#### Perl/EpidemiumDB interface
[DBI](http://dbi.perl.org) is the standard database interface module for Perl.
The script PerlEpidemiumDB.pl provides functionalities for Perl/EpidemiumDB interface.

```
#!/usr/bin/perl
use strict;
use warnings;

use DBI;

my $dbfile   = "epidemiumdb";
 
my $dsn      = "dbi:SQLite:dbname=$dbfile";
my $user     = "";
my $password = "";
my $dbh = DBI->connect($dsn, $user, $password, {
   PrintError       => 0,
   RaiseError       => 1,
   AutoCommit       => 1,
   FetchHashKeyName => 'NAME_lc',
});

....

$dbh->disconnect;
```

### EpidemiumDB Architecture
EpidemiumDB is based on a relational data model linked to [CKAN](http://ckan.org) data management platform.


### Data Acquisition
*coming soon*

### Database content
The EpidemiumDB database contains the following tables:

| Table Name | Description | Curation Type |
| :---         |     :---:      |          ---: |
| cancerType   | All cancer types    | Manual curation and validation by an expert   |
| cancerRiskFactor    | All known risk factor for cancer       | Manual curation and validation by an expert      |
| riskFactorGroup   | groups of cancer risk factor      | Manual curation and validation by an expert     |
| riskFactor2publication   | All publications about cancer risk factors       | data retrieval, text mining, and manual curation      |
| antiCancerDrugs    | All anti cancers drugs       | data retrieval, text mining, and manual curation      |


### Validating & versioning of the database EpidemiumDB
*coming soon*


#### using the SQLite version



## EpidemiumDB Resources & Documentation 
1. The Wiki page [EpidemiumDB](http://wiki.epidemium.cc/wiki/EpidemiumDB) (in french) is used to discuss the design and developement of EpidemiumDB.
2. A presentation given by Seraya Maouche on April, 7th, 2016 at the Epidemium Meetup is
[available online](http://wiki.epidemium.cc/wiki/Fichier:EpidemiumDB_7april2016.pdf).
3. A Presentation prepared by Seraya Maouche and presented by Olivier de Fresnoye at the March Meeting of Epidemium is [available online](http://wiki.epidemium.cc/wiki/Fichier:Presentation_EpidemiumDB_11032016.pdf).

## Publication
A manuscript describing EpidemiumDB is under preparation, if you have contributed to EpidemiumDB, please join the collaborative editor project on [Authoria platform] (https://www.authorea.com) in order to contribute to the manuscript.

## Contacting the EpidemiumDB team
* For administration issues, do not hesitate to contact the Epidemium team at data[a]epidemium.cc 
* For scientific questions, database content, conception and development of EpidemiumdDB, please contact Seraya Maouche (seraya.maouche[a]iscb.org)
* For cancer epidemiological data, please contact Edouard Debonneuil (edebonneuil[a]yahoo.fr).

