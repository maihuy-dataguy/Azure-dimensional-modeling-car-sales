# Azure Car Sales Statistics-Incremental automated pipieline project

## Introduction
This project serves as a comprehensive implementation to building an end-to-end data engineering pipeline. It covers each stage from data ingestion to processing and finally to storage, utilizing Azure Cloud Services, using incremental loading, handling slow changing dimensions and buidling Star Schema in the gold layer for business analysis


## System Architecture
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/overflow.png)

#### Data Source 
We use car_sales data from [SalesData.csv](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/Raw%20Data/SalesData.csv) for initial loading, and [IncrementalSales.csv](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/Raw%20Data/IncrementalSales.csv) for increamental loading. The data would be pushed into Azure SQL Database.

Aplly medallion architecture, we transfer our data between these layers including bronze, silver, gold layers.
- Gold Layer: The raw data will be loaded from Azure SQL Database



## Azure Data Factory (ADF)
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/ETL.png)
Responsible for orchestrating the whole flow: ingesting data and storing fetched data in azure data lakehouse at bronze layer, only incrementally fetching the new data from Azue SQL Database and load into Azure Data Lake. The data will be transformed in silver layer




## Technology Stack
- **Azure Data Factory (ADF)**: For orchestrating data movement and transformation.
- **Azure Data Lake Storage (ADLS)**: For storing raw and processed data.
- **Azure Databricks**: For data transformation and processing.
- **Azure Synapse Analytics**: For data warehousing and SQL-based analytics.
- **Power BI**: For data visualization and reporting.
- **Azure Key Vault**: For securely managing credentials and secrets.
