-- Clean previous test data (optional)
DELETE FROM prescription;
DELETE FROM medication;

--  Insert sample medications
INSERT INTO medication (id_medication, name, description, stock, expiration_date)
VALUES
  (1, 'Amoxicillin', 'Antibiotic 500mg', 5, '2026-01-01'),
  (2, 'Ibuprofen', 'Pain reliever 200mg', 2, '2025-07-15');

--  Check current stock
SELECT id_medication, name, stock FROM medication;

--  Insert prescriptions → trigger will automatically reduce stock by 1 each time
INSERT INTO prescription (id_prescription, id_record, id_medication, dosage, frequency)
VALUES 
  (1, 1, 1, '500 mg', 'Every 8 hours'),  -- Amoxicillin
  (2, 1, 2, '200 mg', 'Every 6 hours');  -- Ibuprofen

--  Insert one more prescription for Amoxicillin
INSERT INTO prescription (id_prescription, id_record, id_medication, dosage, frequency)
VALUES 
  (3, 1, 1, '500 mg', 'Every 12 hours');

--  Check updated stock
SELECT id_medication, name, stock FROM medication;

--  Try inserting with stock = 0 (should raise an error)
-- Reduce Ibuprofen stock to 0 manually for test
UPDATE medication SET stock = 0 WHERE id_medication = 2;

-- This will trigger the “No stock available” exception
INSERT INTO prescription (id_prescription, id_record, id_medication, dosage, frequency)
VALUES 
  (4, 1, 2, '200 mg', 'Every 8 hours');
