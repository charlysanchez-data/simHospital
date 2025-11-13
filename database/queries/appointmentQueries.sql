-- Appointment Queries --

-- Show all appointments with patient, doctor, and department information --
SELECT 
  a.id_appointment,
  a.date,
  a.time,
  a.reason,
  a.status,
  p.id_patient,
  p.first_name AS patient_first_name,
  p.last_name AS patient_last_name,
  p.email AS patient_email,
  p.phone AS patient_phone,
  dtr.id_doctor,
  dtr.first_name AS doctor_first_name,
  dtr.last_name AS doctor_last_name,
  dep.id_department,
  dep.name AS department_name,
  dep.description,
  dep.location
FROM appointment a
INNER JOIN patient p ON a.id_patient = p.id_patient
INNER JOIN doctor dtr ON a.id_doctor = dtr.id_doctor
INNER JOIN department dep ON a.id_department = dep.id_department;

-- List appointments by a specific date --
SELECT 
  *
FROM appointment
WHERE date = '2025-09-10';  -- Specify a particular date

-- Show appointments with status “Cancelled” --
SELECT 
  *
FROM appointment
WHERE status = 'Cancelled';

-- Count how many appointments have been made per month --
SELECT 
  EXTRACT(MONTH FROM date) AS month,
  COUNT(DISTINCT id_appointment) AS total_appointments
FROM appointment
GROUP BY month;

-- View appointment history for a specific patient --
SELECT 
  *
FROM appointment
WHERE id_patient = 2;
