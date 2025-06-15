
-- Create hospital_data table
CREATE TABLE hospital_data (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender CHAR(1),
    diagnosis VARCHAR(100),
    treatment VARCHAR(100),
    admission_date DATE,
    discharge_date DATE,
    hospital VARCHAR(100)
);

-- Load data (for MySQL: use LOAD DATA INFILE or import via GUI)

-- Sample queries

-- 1. Count patients by diagnosis
SELECT diagnosis, COUNT(*) AS total_patients
FROM hospital_data
GROUP BY diagnosis;

-- 2. Average age of patients per diagnosis
SELECT diagnosis, AVG(age) AS avg_age
FROM hospital_data
GROUP BY diagnosis;

-- 3. Patients staying more than 7 days
SELECT *, DATEDIFF(discharge_date, admission_date) AS stay_duration
FROM hospital_data
WHERE DATEDIFF(discharge_date, admission_date) > 7;

-- 4. Disease clusters by hospital
SELECT hospital, diagnosis, COUNT(*) AS cases
FROM hospital_data
GROUP BY hospital, diagnosis
ORDER BY hospital, cases DESC;
