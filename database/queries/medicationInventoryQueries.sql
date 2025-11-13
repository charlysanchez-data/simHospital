-- Medication and Inventory Queries --

-- List all medications with expiration date --
SELECT
  id_medication,
  name,
  expiration_date
FROM medication;

-- Show medications with low stock (less than 100) --
SELECT
  *
FROM medication
WHERE stock < 100
ORDER BY stock ASC;

-- View medication inventory by department --
SELECT
  d.name AS department,
  m.name AS medication,
  SUM(i.stock) AS total_stock
FROM inventory i
INNER JOIN department d ON i.id_department = d.id_department
INNER JOIN medication m ON i.id_medication = m.id_medication
GROUP BY d.name, m.name
ORDER BY total_stock DESC;

-- List medications prescribed to a patient --
SELECT 
  r.id_prescription,
  p.first_name,
  p.last_name,
  m.name AS medication,
  r.dosage,
  r.frequency,
  mr.diagnosis,
  mr.treatment
FROM prescription r 
INNER JOIN medical_record mr ON r.id_record = mr.id_record
INNER JOIN medication m ON r.id_medication = m.id_medication
INNER JOIN patient p ON mr.id_patient = p.id_patient;

-- View medications close to expiration (less than 30 days) --
SELECT 
  *
FROM medication
WHERE (expiration_date - CURRENT_DATE) < 30;
