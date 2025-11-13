-- Medical Record Queries --

-- List all diagnoses performed --
SELECT 
    id_record,
    diagnosis,
    creation_date
FROM medical_record
ORDER BY creation_date DESC;

-- Medical record of a specific patient --
SELECT 
    mr.id_record,
    mr.creation_date,
    mr.diagnosis,
    mr.treatment,
    mr.notes,
    CONCAT(p.first_name, ' ', p.last_name) AS patient
FROM medical_record AS mr
JOIN patient AS p ON mr.id_patient = p.id_patient
WHERE p.document_number = '100000001';

-- List doctors associated with each diagnosis --
SELECT 
    mr.id_record,
    mr.diagnosis,
    mr.creation_date,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor,
    d.specialty
FROM medical_record AS mr
JOIN doctor AS d ON mr.id_doctor = d.id_doctor
ORDER BY mr.creation_date DESC;

-- Search medical records by keyword --
SELECT 
    mr.id_record,
    mr.diagnosis,
    mr.treatment,
    mr.notes,
    CONCAT(p.first_name, ' ', p.last_name) AS patient
FROM medical_record AS mr
JOIN patient AS p ON mr.id_patient = p.id_patient
WHERE mr.diagnosis ILIKE '%dermatitis%';
