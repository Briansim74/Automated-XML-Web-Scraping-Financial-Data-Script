# XML

XML Financial Data Web Scraping Project

<br/>In this notebook, there will be 3 main questions that will be addressed. For the 3 questions, I have utilised Google Colab as my IDE, and have done the programming on Colab. I have put in my thought processes for the issues that I have faced for all the questions during this project within this README file.

<br/>For Question 1, it is to use Python to convert all rows in “Output_Values” into XML format, and name it "Output.xml".

<br/>Attached are the relevant files:

1. Q1.xml
2. q1.py

For this question, I encountered a few problems on how to convert the csv into XML, while I could get the headers and labels out of the file, putting it into XML proved challenging to debug, due to the dual spreadsheet nature of the csv file. Q1.py shows the code for the conversion of csv to XML, and Output.xml shows the file that the CSV might look like potentially, if the problems are fixed without enough debugging.

<br/>For Question 2, it is to use Python to convert FX_MAS_NEWT_OTHR.xml into CSV format, and name it CSV_Output.csv.

<br/>Attached are the relevant files:

1. CSV_Output.csv
2. q2.py

I utilised Element Tree in Q2.py, which is a useful program for parsing XML data, and finding the correct ID of each data point in the XML file. However, I faced an issue whereby the data did not parse into a csv format as I had wanted to. This could be due to the outdated version of Element Tree that did not sync with Colab. With that said, I managed to convert the XML file into a CSV_Output.csv with the aid of an XML-to-CSV parser.

<br/>For Question 3 and 4, It is to webscrape the CC of India's financial data, and upload it to SQL via BCP utility, to automate it every hour using Crontab, and parsing it to the SQL database. 

Attached are the relevant files:

1. q3.py
2. Security_Wise_Holdings.csv
3. Cronjob 1 Hour Colab Automation
4. BCP Utility Error.png
5. Bulk Insert SQL.png
6. SQL Table.png

For Q3, I had first noticed that the website to be scraped was not an easy one. This was due firstly to the nature of the animated table containing data, whereby each page of the table did not have an independent hyperlink.
Hence, I had decided to utilise Selenium, which is a powerful automating web scraping tool. However, I ran into numerous problems, which was mainly due to the Chromium driver used for running Selenium which did not sync up
with the version Google Colab was using. After multiple attempts, Selenium was ready. 

The next step was to dig out the table information. I utilised the Xpath of the table itself and got each table per page of text, which was in 1 single chunk of text. I first separated the text into each row of the table. 
Then, I separated the text using txt.split by spaces, then recombined the 3rd to 5th element of each row back into 1 element, eg for Security Description, it was originally '6.19', 'GS', '2024'. After recombining,
Security Description became '6.19 GS 2024' which was what I wanted.

The next step was to go through all 80 of the pages of the table. I automated clicking the next page by using Selenium's action click driver, which helped to click the "Next" button of the table for pages 1-80. After all these were done, the information was stored in a Pandas dataframe and exported to a csv file titled "Security_Wise_Holdings.csv".

Next, I attempted to upload the downloaded Security_Wise_Holdings to SQL using BCP utility, however, I ran into some errors which is shown in BCP Utility Error.png. The command mentioned of an error that the flow of the CSV information into the SQL server was not mentioned, although I had specified the flow to be in, as seen in the command entered in the screenshot.

Hence, I decided to use another way to bulk insert the csv file information into SQL using Microsoft SQL Server Management Studio. I first created a table with the relevant columns "SQL Table.png" and made a query for bulk inserting the csv file "Bulk Insert SQL.png". It was a successful outcome, as shown in the screenshot, where all of the csv file information was uploaded instantly into the SQL Management Studio.

I then created a script for running this Colab notebook every hour via Ubuntu's Virtual Box. In the txt file named Cronjob 1 Hour Colab Automation, at the bottom is the script code used to run the notebook every hour,
where "59 * * * *" means every hour execution, and /content/gdrive/MyDrive/XML Qns/Q3.py states the file path of my notebook in Colab.
