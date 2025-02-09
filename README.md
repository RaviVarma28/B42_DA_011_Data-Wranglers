# Genomics of Drug Sensitivity in Cancer
<img scr="LOGO.png" height="200">

## Introduction
This project uses the Genomics of Drug Sensitivity in Cancer (GDSC) dataset to explore how different cancers respond to various drugs. We analyze drug effectiveness by comparing metrics like LN IC50, AUC, and z-scores, which help measure drug potency and resistance. Lower LN IC50 values show greater effectiveness, while higher values suggest resistance. By examining these metrics across cancer cell lines, we identify patterns of sensitivity and resistance. The interactive Power BI dashboard presents these insights with clear visuals, aiding personalized treatment decisions.

## Project Type
**Data Analysis** | **Dashboard**

## Technology Stack
- **Python** – Data analysis.
- **MySQL** – Data preprocessing and transformation.
- **Power BI** – Data visualization and interactive dashboard.

## Database
Kaggle: [Link](https://www.kaggle.com/datasets/samiraalipour/genomics-of-drug-sensitivity-in-cancer-gdsc?select=GDSC_DATASET.csv)

## Directory Structure
B42_DA_011_Data-Wranglers/  
├─ data/  
│  ├─ processed/  
│  │  ├─ cleaned_GDSC.csv       
│  ├─ raw/  
│  │  ├─ Cell_Lines_Details.xlsx  
│  │  ├─ Compounds-annotations.csv  
│  │  ├─ GDSC2-dataset.csv       
│  │  ├─ GDSC_DATASET.csv        
├─ scripts/  
│  ├─ EDA.ipynb                  
├─ sql/  
│  ├─ cwproject_sql.sql          
│  ├─ SQL_preprocess.sql         
├─ GDSC Dashboard.pbix           
├─ README.md                     

## Dataset Details
The dataset includes the following columns:

- **COSMIC ID:** Catalogue Of Somatic Mutations In Cancer ID.
- **DRUG_ID:** Unique identifier for the drug used in the experiment
- **TCGA DESC:** Type of cancer being analyzed.
- **Drug Name:** Name of the drug used in the treatment.
- **TARGET:** The presumed molecular target of the drug.
- **Target Pathway:** The biological pathway targeted by the drug.
- **LN_IC50:** Logarithmic value of the half-maximal inhibitory concentration, a measure of drug sensitivity.
- **AUC:** Area Under the Curve, representing the drug's effectiveness.
- **MSI Status:** Microsatellite Instability Status (e.g., MSI-H or MSI-L).
- **Methylation:** Data on DNA methylation patterns in the cell line.
- **Gene Expression:** Expression level of specific genes in response to drug treatment.
- **Copy Number Alterations (CNA):** Data on gene copy number changes in the cell line
- **Screen Medium:** Medium used for screening drug effectiveness.
- **GDSC Tissue descriptor 1:** Primary tissue type classification.
- **GDSC Tissue descriptor 2:** Secondary tissue type classification.
- **Growth Properties:** Characteristics of how the cell line grows in culture.


## Installation & Setup

### Access the Database

1. **Download the MySQL Dump File**: Locate the `sql` folder in this repository and download the MySQL dump file (cwprojectsql.sql). This file contains the necessary structure and data for the database.

2. **Open the Dump File in MySQL**: Use a MySQL client, such as MySQL Workbench or phpMyAdmin, to access your local MySQL server.

3. **Execute the Dump File**: Import the downloaded MySQL dump by selecting the 'Run SQL Script' option in your client. This will create the database and populate it with the relevant tables and initial data.

### Explore the Dashboard

1. **Install Microsoft Power BI**: If you haven't done so already, download and install Microsoft Power BI Desktop from the official Microsoft website. Verify that your system meets the necessary requirements for installation.

2. **Download the GDSC Dashboard File**: Obtain the “GDSC Dashboard.pbix” file from the repository. This file contains the dashboard visualization.

3. **Run the Power BI File**: Open GDSC Dashboard.pbix in Power BI. Use filters to explore cancer type, drug name, and genomic features. Analyze drug sensitivity trends and resistance mechanisms.

## Key Insights in the Dashboard
- **Top Effective Drugs** – Drugs with the lowest LN_IC50 (most potent).
- **Most Resistant Cell Lines** – Identifying cell lines with the highest LN_IC50.
- **Drug Coverage Across Cell Lines** – Number of cell lines tested per drug.
- **Pathway Coverage Across Cell Lines** – How frequently pathways are targeted in the dataset.

## Video Walkthrough of the Project
[Group Presentaion Link](https://drive.google.com/file/d/1Xp9uUg2EVMaSDDh0bGC-v_dIv4UlbCL7/view?usp=drive_link)

## Contributors
[Ravi Kiran Venkata Sai Varma Gedela (Team Lead)](https://github.com/RaviVarma28) 
- Led the integration of the MySQL database into the project, ensuring seamless connectivity and efficient data retrieval.  
- Designed and developed the Power BI dashboard, transforming complex data into insightful visualizations for better decision-making.  

[Shakeb Patel](https://github.com/shakebpatel)  
- Analyzed the dataset to extract valuable insights, identifying key trends and patterns.  
- Collaborated closely with the team to design and enhance the dashboard, ensuring it effectively meets the project's requirements and user needs.  

[Shivani Singh](https://github.com/Shivani456S)  
- Conducted comprehensive exploratory data analysis (EDA) on the dataset, utilizing statistical methods to uncover relationships and anomalies.  
- Responsible for cleaning and preprocessing the dataset, implementing necessary transformations and handling missing values to ensure high-quality data for analysis.  
