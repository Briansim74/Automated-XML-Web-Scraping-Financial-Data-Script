# Automated XML Web Scraping Financial Data Script

In this notebook, I will describe the processes of creating an Automated XML Financial Data Web Scraping Script.

<br/>

The financial data to be scraped would be the Security Wise Repo Market Summary, from The Clearing Corporation of India Limited.

https://www.ccilindia.com/web/ccil/security-wise-repo-market-summary

<br/>

The automation of the script can be seen in my personal portfolio:

https://briansim74-portfolio.webflow.io/projects/xml

<br/>

<br/><b>This script utilises the following programs & languages:</b>

<b>Languages:</b>
1. Python
2. Bash
3. SQL

<b>Programs:</b>
1. Google Colab - Developing the script
2. Selenium & ChromeDriver - Automation of XML Web Scraping
3. Ubuntu Linux - Running the script
4. Cron - Automation of script
5. pyodbc (Python Open Database Connectivity) - To delete all outdated data from SQL Azure database using SQL Query
6. BCP (Bulk Copy Program) Utility - Rapid bulk insert updated data into SQL Azure database
7. Microsoft Azure SQL Database - SQL Cloud database for updating financial data

<br/><b>The following files for reference for this script are:</b>
1. Security_Wise_Holdings_Script.ipynb
2. cron.txt
3. Security_Wise_Holdings.csv
4. Security_Wise_Holdings_Query.sql

<br/><b>Developing the script</b>

First, I installed Selenium and Chromium Driver onto my Google Colab as well as Ubuntu Virtual Machine. Selenium and ChromeDriver are plug-ins to automate the execution of parsing XML data from websites. Due to the dynamic nature of the table, a simple scraping of data into a dataframe was not possible. Here, I utilised the plug-ins to automate scraping each page of data, and also "clicking" onto each next page, all the way till the end of the ~84 pages. 

After that, I processed the relevant data into a Pandas DataFrame with relevant column names. I then exported the DataFrame into a CSV file to be stored in my Ubuntu Desktop.

Using the pyodbc driver, I then connected to the Microsoft Azure SQL cloud database where the Security Wise Holdings SQL Table exists, and parsed a query to delete all outdated data from the table.

In the same script, I added a command to execute the BCP utility to bulk copy the updated CSV file into the Security Wise Holdings SQL Table in the Microsoft Azure SQL database, whereby the database would then be updated with the most recent CSV file.

<br/><b>Running and Automation of the script</b>

I utilised Ubuntu Linux for the automation of the script. I started a new Cronjob on Crontab, an automatic task scheduler, whereby I set the Python script to run every minute, thus updating the Azure SQL database every minute with new data. 

Finally, the automation of the Web Scraping Script can be seen by the updating of the Azure SQL database every minute by quering the Security Wise Holdings SQL Table from the Microsoft Azure Portal.
