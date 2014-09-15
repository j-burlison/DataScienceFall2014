-- Generated by Oracle SQL Developer Data Modeler 4.0.2.840
--   at:        2014-09-14 16:46:07 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE Gulf_and_Pacific_Coast_Nonprofits CASCADE CONSTRAINTS ;

--  ERROR: Table name length exceeds maximum allowed length(30)
CREATE TABLE Gulf_and_Pacific_Coast_Nonprofits
  (
    EIN              VARCHAR2 (100) NOT NULL ,
    NAME             VARCHAR2 (100) NOT NULL ,
    ICO              VARCHAR2 (50) NOT NULL ,
    STREET           VARCHAR2 (100) NOT NULL ,
    CITY             VARCHAR2 (50) NOT NULL ,
    STATE            VARCHAR2 (2) NOT NULL ,
    ZIP              VARCHAR2 (10) NOT NULL ,
    ASS              VARCHAR2 (20) NOT NULL ,
    SUBSECTION       VARCHAR2 (2) NOT NULL ,
    AFFILIATION      VARCHAR2 (1) NOT NULL ,
    CLASSIFICATION   VARCHAR2 (4) NOT NULL ,
    RULING           VARCHAR2 (6) NOT NULL ,
    DEDUCTIBILITY    VARCHAR2 (1) NOT NULL ,
    FOUNDATION       VARCHAR2 (2) NOT NULL ,
    ACTIVITY         VARCHAR2 (9) NOT NULL ,
    ORGANIZATION     VARCHAR2 (1) NOT NULL ,
    STATUS           VARCHAR2 (2) NOT NULL ,
    TAX_PERIOD       VARCHAR2 (6) NOT NULL ,
    ASSET_CD         VARCHAR2 (1) NOT NULL ,
    INCOME_CD        VARCHAR2 (1) NOT NULL ,
    FILING_REQ_CD    VARCHAR2 (2) NOT NULL ,
    PF_FILING_REQ_CD VARCHAR2 (1) NOT NULL ,
    ACCT_PD          VARCHAR2 (2) NOT NULL ,
    ASSET_AMT        VARCHAR2 (20) NOT NULL ,
    INCOME_AMT       VARCHAR2 (20) NOT NULL ,
    REVENUE_AMT      VARCHAR2 (20) NOT NULL ,
    NTEE_CD          VARCHAR2 (4) NOT NULL ,
    SORT_NAME        VARCHAR2 (35) NOT NULL
  ) ;
--  ERROR: PK name length exceeds maximum allowed length(30)
ALTER TABLE Gulf_and_Pacific_Coast_Nonprofits ADD CONSTRAINT Gulf_and_Pacific_Coast_Nonprofits_PK PRIMARY KEY ( EIN ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             1
-- CREATE INDEX                             0
-- ALTER TABLE                              1
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
