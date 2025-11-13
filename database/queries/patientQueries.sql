/* PATIENT QUERIES */

/* List all registered patients */
SELECT 
  *
FROM patient;

/* Search patients by document type and number */
SELECT 
  id_patient,
  first_name,
  last_name,
  birth_date,
  gender,
  phone,
  email
FROM patient
WHERE document_type = 'CC' AND document_number = '100000030';  -- Specific document type and number

/* List patients by health provider (EPS) */
SELECT 
  id_patient,
  first_name,
  last_name
FROM patient
WHERE health_provider = 'Sanitas';  -- Specify a health provider

/* Count how many patients there are by gender */
SELECT 
  gender,
  COUNT(DISTINCT id_patient) AS total_patients
FROM patient
GROUP BY gender;

/* Show patients with pending appointments */
SELECT 
  p.id_patient,
  p.first_name,
  p.last_name,
  p.phone,
  p.email,
  a.id_appointment,
  a.reason,
  a.date,
  a.time
FROM patient p
INNER JOIN appointment a ON a.id_patient = p.id_patient
WHERE a.status = 'Pending';

/* Show patients without appointments and without medical records */
SELECT
  p.id_patient,
  p.first_name,
  p.last_name,
  p.phone,
  p.email
FROM patient p
LEFT JOIN appointment a ON p.id_patient = a.id_patient
LEFT JOIN medical_record mr ON p.id_patient = mr.id_patient
WHERE a.id_patient IS NULL AND mr.id_patient IS NULL;
