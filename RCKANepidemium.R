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
# ckran on Github: https://github.com/ropensci/ckanr/issues

###### Install required R packages
# 1- install ckanr from Github
install.packages("devtools")
devtools::install_github("ropensci/ckanr")

# 2- install BPI library
install.packages("DBI")

# Load required packages
library("DBI")
library("ckanr")

# CKAN Setting
# use the function ckanr_setup() 
ckanr_setup(url = "http://data.epidemium.cc", key = getOption("ckan_demo_key"))


# Ping a CKAN server to test that it’s up or down.
ping()
ping(url = "http://data.epidemium.cc", as = "json")

# List organizations
organization_list()
(orgs <- organization_list())
orgs[[1]]
unique(length(orgs))

# Different data formats
organization_list(as = 'json')
organization_list(as = 'table')

# Return a list of the package’s activity
# create a package
(res <- package_create("package_name"))
# list package activity
package_activity_list(res$id)

# List datasets
package_list()
package_list(as = 'json')
package_list(as = 'table')

package_list_current()
package_list_current(as = 'json')
package_list_current(as = 'table')

# Search for packages.
# package_search(q = "*:*", fq = NULL, sort = NULL, rows = NULL,
# start = NULL, facet = FALSE, facet.limit = NULL, facet.field = NULL,
# url = get_default_url(), as = "list", ...)

package_search(q = '*:*')
package_search(q = '*:*', rows = 2, as = 'json')
package_search(q = '*:*', rows = 2, as = 'table')
package_search(q = '*:*', sort = 'score asc')
package_search(q = '*:*', fq = 'num_tags:[3 TO *]')$count
package_search(q = '*:*', fq = 'num_tags:[2 TO *]')$count
package_search(q = '*:*', fq = 'num_tags:[1 TO *]')$count

# List tags
tag_list('cancer', url = "http://data.epidemium.cc", as = 'table')

# For other functionalitites, please refer to rckan documentation: https://cran.r-project.org/web/packages/ckanr/ckanr.pdf


