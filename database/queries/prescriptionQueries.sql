-- Prescription Queries --

-- List all prescriptions with medication and dosage --

SELECT 
    r.id_prescription,
    r.dosage,
    r.frequency,
    m.name AS medication,
    mr.diagnosis
FROM prescription AS r
JOIN medication AS m ON r.id_medication = m.id_medication
JOIN medical_record AS mr ON r.id_record = mr.id_record
ORDER BY r.id_prescription;

-- List prescriptions by doctor --

SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS doctor,
    mr.diagnosis,
    m.name AS medication,
    r.dosage,
    r.frequency
FROM prescription AS r
JOIN medical_record AS mr ON r.id_record = mr.id_record
JOIN doctor AS d ON mr.id_doctor = d.id_doctor
JOIN medication AS m ON r.id_medication = m.id_medication
WHERE d.document_number = '10010008';

-- Prescriptions by patient --

SELECT 
    CONCAT(p.first_name, ' ', p.last_name) AS patient,
    m.name AS medication,
    r.dosage,
    r.frequency,
    mr.diagnosis
FROM prescription AS r
JOIN medical_record AS mr ON r.id_record = mr.id_record
JOIN patient AS p ON mr.id_patient = p.id_patient
JOIN medication AS m ON r.id_medication = m.id_medication
WHERE p.document_number = '100000004';

-- Average frequency of prescribed medications --

SELECT 
    m.name AS medication,
    COUNT(r.id_prescription) AS times_prescribed
FROM prescription AS r
JOIN medication AS m ON r.id_medication = m.id_medication
GROUP BY m.name
ORDER BY times_prescribed DESC;
