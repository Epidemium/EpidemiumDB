#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script File: RCKANepidemium.R  
# Date of creation: 15 May 2016
# Date of last modification: 15 May 2016
# Author: Seraya Maouche <seraya.maouche@iscb.org>
# Project: Epidemium (http://www.epidemium.cc)
# Short Description: This script provides functionalities to use the CKAN-based 
#                     Epidemium Open Data platform.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#****************** About data.epidemium.cc
# data.epidemium.cc is the Open Data platform of the Epidemium Project. This platfrom is using CKAN (the Comprehensive Knowledge 
Archive Network; http://ckan.org), a web-based open source data management system for the storage and distribution of open datasets.
# Written in Python, CKAN's code is maintained by the Open Knowledge Foundation (https://okfn.org) 

#****************** CKAN API
# CKAN provides a rich RESTful JSON API for querying and accessing dataset information. 
# You can find details and documentation at http://docs.ckan.org/en/latest/api/index.html

#***************** About ckanr
# ckanr is a full R client for the CKAN API
# The library was developed by Scott Chamberlain, Imanuel Costigan, Wush Wu, and Florian Mayer
# ckran on R CRAN: https://cran.r-project.org/web/packages/ckanr/index.html
# ckran documentation: https://cran.r-project.org/web/packages/ckanr/ckanr.pdf

###### Install required R packages
# 1- install ckanr from Github
install.packages("devtools")
devtools::install_github("ropensci/ckanr")

# 2- install BPI library
install.packages("DBI")

# Load required packages
library("DBI")
library("ckanr")



# 
