TRUNCATE TABLE dbo.SECURITY_WISE_HOLDINGS; --delete all rows in table

SELECT * FROM dbo.SECURITY_WISE_HOLDINGS -- view table

/* CREATE TABLE SECURITY_WISE_HOLDINGS (
	Date VARCHAR(50),
	ISIN VARCHAR(50),
	Security_Deposition VARCHAR(50),
	Maturity_Date VARCHAR(50),
	Trades INT,
	Volume_Cr FLOAT(50),
	Open_Yield FLOAT(50),
	High_Yield FLOAT(50),
	Low_Yield FLOAT(50), 
	Last_Yield FLOAT(50),
	Wtd_Avg_Yield FLOAT(50),
	Wtd_Avg_Price FLOAT(50),
); */ --create table

DROP TABLE dbo.SECURITY_WISE_HOLDINGS --delete table
