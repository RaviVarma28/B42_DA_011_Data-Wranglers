CREATE DATABASE CWProject_SQL;

USE CWProject_SQL;

# Creating a table for inserting the values from the csv
CREATE TABLE cleaned_GDSC (
    COSMIC_ID INT,
    CELL_LINE_NAME VARCHAR(255),
    TCGA_DESC VARCHAR(255),
    DRUG_ID INT,
    DRUG_NAME VARCHAR(255),
    LN_IC50 FLOAT,
    AUC FLOAT,
    Z_SCORE FLOAT,
    `GDSC Tissue descriptor 1` VARCHAR(255),
    `GDSC Tissue descriptor 2` VARCHAR(255),
    `Microsatellite instability Status (MSI)` VARCHAR(50),
    `Screen Medium` VARCHAR(255),
    `Growth Properties` VARCHAR(255),
    CNA VARCHAR(10),
    `Gene Expression` VARCHAR(10),
    Methylation VARCHAR(10),
    TARGET VARCHAR(255),
    TARGET_PATHWAY VARCHAR(255)
);

# Loading the dataset
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads'
INTO TABLE cleaned_GDSC
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM cleaned_GDSC;
SELECT COUNT(*) FROM cleaned_GDSC;


CREATE OR REPLACE VIEW v_drug_sensitivity AS  
SELECT  
    CELL_LINE_NAME,  
    DRUG_NAME,  
    TCGA_DESC,
    MIN(LN_IC50) AS min_ic50,  
    MAX(LN_IC50) AS max_ic50,  
    AVG(LN_IC50) AS avg_ic50,  
    AVG(Z_SCORE) AS avg_zscore  
FROM cleaned_GDSC  
GROUP BY CELL_LINE_NAME, DRUG_NAME, TCGA_DESC;

# DROP VIEW v_drug_sensitivity;

SELECT COUNT(*) FROM v_drug_sensitivity;

# AUC is Area Under Curve. It is a measure of effectiveness of the drug.
CREATE OR REPLACE VIEW v_drug_effectiveness AS  
SELECT  
    DRUG_NAME,  
    COUNT(DISTINCT CELL_LINE_NAME) AS tested_cell_lines,  
    AVG(AUC) AS avg_auc,  
    MIN(AUC) AS min_auc,  
    MAX(AUC) AS max_auc,  
    (MAX(AUC) - MIN(AUC)) AS auc_variability 
FROM cleaned_GDSC 
GROUP BY DRUG_NAME  
ORDER BY avg_auc DESC, auc_variability DESC;


# DROP VIEW v_drug_effectiveness;

SELECT * FROM v_drug_effectiveness;

CREATE OR REPLACE VIEW v_target_pathway AS  
SELECT  
    TARGET_PATHWAY,  
    COUNT(DISTINCT DRUG_NAME) AS num_drugs,  
    COUNT(DISTINCT CELL_LINE_NAME) AS num_cell_lines,  
    AVG(AUC) AS avg_pathway_auc,  
    MIN(AUC) AS min_pathway_auc,  
    MAX(AUC) AS max_pathway_auc  
FROM cleaned_GDSC 
GROUP BY TARGET_PATHWAY  
ORDER BY avg_pathway_auc DESC;


# DROP VIEW v_target_pathway;

SELECT * FROM v_target_pathway;

CREATE OR REPLACE VIEW v_msi_drug_response AS  
SELECT  
    `Microsatellite instability Status (MSI)` AS MSI_Status,  
    DRUG_NAME,  
    COUNT(DISTINCT CELL_LINE_NAME) AS tested_cell_lines, 
    AVG(LN_IC50) AS avg_ic50,  
    AVG(AUC) AS avg_auc  
FROM cleaned_GDSC
WHERE `Microsatellite instability Status (MSI)` IS NOT NULL  
GROUP BY MSI_Status, DRUG_NAME  
ORDER BY avg_auc DESC;


# DROP VIEW v_msi_drug_response;

SELECT * FROM v_msi_drug_response;
SELECT COUNT(*) FROM v_msi_drug_response;

CREATE OR REPLACE VIEW v_growth_properties AS  
SELECT  
    `Growth Properties`,  
    DRUG_NAME,  
    COUNT(DISTINCT CELL_LINE_NAME) AS tested_cell_lines,   
    AVG(LN_IC50) AS avg_ic50,  
    AVG(AUC) AS avg_auc  
FROM cleaned_GDSC
GROUP BY `Growth Properties`, DRUG_NAME  
ORDER BY tested_cell_lines DESC, avg_auc DESC;


# DROP VIEW v_growth_properties;

SELECT * FROM v_growth_properties;
SELECT COUNT(*) FROM v_growth_properties;

CREATE OR REPLACE VIEW v_cna_drug_response AS  
SELECT  
    CNA,  
    DRUG_NAME,  
    COUNT(DISTINCT CELL_LINE_NAME) AS tested_cell_lines, 
    AVG(LN_IC50) AS avg_ic50,  
    AVG(AUC) AS avg_auc  
FROM cleaned_GDSC
GROUP BY CNA, DRUG_NAME  
ORDER BY tested_cell_lines DESC, avg_auc DESC;


# DROP VIEW v_cna_drug_response;

SELECT * FROM v_cna_drug_response;

CREATE OR REPLACE VIEW v_Top_Drugs AS
SELECT 
    DRUG_NAME, 
    TARGET_PATHWAY,
    COUNT(DISTINCT CELL_LINE_NAME) AS Total_Cell_Lines,
    AVG(LN_IC50) AS Avg_IC50,
    AVG(AUC) AS Avg_AUC
FROM cleaned_GDSC
GROUP BY DRUG_NAME, TARGET_PATHWAY
ORDER BY Total_Cell_Lines DESC, Avg_AUC DESC, Avg_IC50 ASC;

SELECT * FROM v_Top_Drugs;

