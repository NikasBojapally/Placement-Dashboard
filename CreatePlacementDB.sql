IF DB_ID(N'PlacementDB') IS NULL
    CREATE DATABASE PlacementDB;
GO

USE PlacementDB;
GO

IF OBJECT_ID(N'dbo.Students', N'U') IS NOT NULL
    DROP TABLE dbo.Students;
GO

CREATE TABLE dbo.Students
(
    PlacementId INT IDENTITY(1,1) PRIMARY KEY,
    StudentId NVARCHAR(20) NOT NULL,
    CompanyName NVARCHAR(100) NULL,
    JobRole NVARCHAR(100) NULL,
    PackageLPA DECIMAL(8,2) NULL
);
GO

INSERT INTO dbo.Students (StudentId, CompanyName, JobRole, PackageLPA)
VALUES
(N'STU001', N'TCS',       N'Assistant System Engineer', 3.60),
(N'STU002', N'Infosys',   N'Systems Engineer',          4.20),
(N'STU003', N'Wipro',     N'Project Engineer',           3.80),
(N'STU004', NULL,         NULL,                          NULL),
(N'STU005', N'Accenture', N'Application Developer',     4.50),
(N'STU006', NULL,         NULL,                          NULL);
GO

SELECT * FROM dbo.Students;
