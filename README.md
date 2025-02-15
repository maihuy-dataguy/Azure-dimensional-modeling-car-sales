# Azure Car Sales Statistics-Incremental automated pipieline project

## Introduction
This project serves as a comprehensive implementation to building an end-to-end data engineering pipeline. It covers each stage from data ingestion to processing and finally to storage, utilizing Azure Cloud Services, using incremental loading, handling slowly changing dimensions and buidling Star Schema in the gold layer for business analysis. Lastly, we also apply a CI/CD pipeline to build and deploy data flows into many environments (dev, test, production).


## System Architecture
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/overflow.png)

#### Data Source 
We use car_sales data from [SalesData.csv](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/Raw%20Data/SalesData.csv) for initial loading, and [IncrementalSales.csv](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/Raw%20Data/IncrementalSales.csv) for increamental loading. The data would be pushed into Azure SQL Database.

### Medallion Architecture
We transfer our data between these layers including bronze, silver, gold layers.
- Bronze Layer: The raw data will be periodically loaded from Azure SQL Database, only incremental data is allowed to enter bronze storage.
- Silver layer: On a daily basis, the incremental data would be transformed in silver layer for analysis requirements.
- Gold layer: The big table from silver layer would separated into multiple dimension tables and fact table following Star Schema Modeling. Data Analyst and Data Scientist can get their hands on these tables for Business Inteligence and Modeling.

Serving layer can be connected through Power BI for Business Analysis facilitating decision-making.


## Azure Data Factory (ADF)
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/ETL.png)
Responsible for orchestrating and scheduling the whole flow:
- ✅ Ingesting increamental data and storing fetched data in azure data lake at bronze layer
- ✅ Using DataBricks LakeHouse Architecture to handle and transform data from silver and build dimensional modeling at serving layer, adding surrogate key, handling Slowly Changing Dimension. 
- ✅ Dynamic Automation, parameterized pipeline
- ✅ Manage security, IAM, Keyvault 

## CI/CD pipeline with Azure DevOps
![System Architecture](https://github.com/maihuy-dataguy/Azure-dimensional-modeling-car-sales/blob/main/pics/cicd_flow.png)
Responsible for automating the whole building and continuous deploying data into 3 different environments:
- ✅ 3 different ADF resources, 3 separate storage accounts (ADLS Gen2)
- ✅ Including dev environment, QC testing environment, production environment for diverse downstream.
- ✅ Git management, continous integration for validating, continous deploying into dev and testing whenever pull requests into main branch are approved. The production deployment is manually approved.

## Technology Stack
- **Azure Data Factory (ADF)**: For orchestrating data movement and transformation.
- **Azure Data Lake Storage (ADLS)**: For storing raw and processed data.
- **Azure Databricks**: For data transformation and processing.
- **Delta Lake** : For table format that extends Parquet data files with a file-based transaction log for ACID transactions and scalable metadata handling.
- **Power BI**: For data visualization and reporting.
- **Azure Key Vault**: For securely managing credentials and secrets.
- **Azure DevOps**: For continuous building and deploying data flows into many dev, testing, production environment.
