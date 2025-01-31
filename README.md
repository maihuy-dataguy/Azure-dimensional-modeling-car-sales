# Azure Car Sales Statistics-Incremental automated pipieline project

## Introduction
This project serves as a comprehensive implementation to building an end-to-end data engineering pipeline. It covers each stage from data ingestion to processing and finally to storage, utilizing Azure Cloud Services, using incremental loading, handling slow changing dimensions and buidling Star Schema in the gold layer for business analysis


## System Architecture
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/overflow.png)

#### Data Source 
We use car_sales data from [SalesData.csv](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/Raw%20Data/SalesData.csv) for initial loading, and [IncrementalSales.csv](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/Raw%20Data/IncrementalSales.csv) for increamental loading. The data would be pushed into Azure SQL Database.

### Medallion Architecture
We transfer our data between these layers including bronze, silver, gold layers.
- Bronze Layer: The raw data will be periodically loaded from Azure SQL Database, only incremental data is allowed to enter bronze storage.
- Silver layer: On a daily basis, the incremental data would be transformed in silver layer for analysis requirements.
- Gold layer: The big table from silver layer would separated into multiple dimension tables and fact table following Star Schema Modeling. Data Analyst and Data Scientist can get their hands on these table for Business Inteligence and Modeling.

Serving layer can be connected through Power BI for Business Analysis facilitating decision-making.


## Azure Data Factory (ADF)
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/ETL.png)
Responsible for orchestrating and scheduling the whole flow:
- [x] Ingesting data and storing fetched data in azure data lakehouse at bronze layer
- [x] Using DataBricks LakeHouse Architecture to handle and transform data from silver and build dimensional modeling at serving layer, adding surrogate key, handing Slowing Changing Dimension. 
- [x] Dynamic Automation, parameterized pipeline
- [x] Manage security, IAM, Keyvault 



## Technology Stack
- **Azure Data Factory (ADF)**: For orchestrating data movement and transformation.
- **Azure Data Lake Storage (ADLS)**: For storing raw and processed data.
- **Azure Databricks**: For data transformation and processing.
- **Power BI**: For data visualization and reporting.
- **Azure Key Vault**: For securely managing credentials and secrets.
