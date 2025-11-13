-- List all doctors with their specialties --
SELECT 
    d.id_doctor,
    CONCAT(d.first_name, ' ', d.last_name) AS full_name,
    d.specialty
FROM doctor AS d;

-- Show doctors by department --
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS full_name,
    d.specialty,
    dep.name AS department
FROM doctor AS d
JOIN department AS dep ON d.id_department = dep.id_department
ORDER BY dep.name;

-- Number of appointments assigned to each doctor --
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS full_name,
    d.specialty,
    COUNT(a.id_appointment) AS total_appointments
FROM doctor AS d
LEFT JOIN appointment AS a ON d.id_doctor = a.id_doctor
GROUP BY d.id_doctor, d.first_name, d.last_name, d.specialty
ORDER BY total_appointments DESC;

-- Doctors without scheduled appointments --
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS full_name,
    d.specialty
FROM doctor AS d
LEFT JOIN appointment AS a ON d.id_doctor = a.id_doctor
WHERE a.id_appointment IS NULL;

-- Number of diagnoses made by each doctor --
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS doctor,
    d.specialty,
    COUNT(mr.id_record) AS total_diagnoses
FROM doctor AS d
LEFT JOIN medical_record AS mr ON d.id_doctor = mr.id_doctor
GROUP BY d.id_doctor, d.first_name, d.last_name, d.specialty
ORDER BY total_diagnoses DESC;
