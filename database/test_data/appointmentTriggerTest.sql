-- Clean up previous test data (optional)
DELETE FROM appointment;

-- Insert an appointment in the past → should automatically become 'Completed'
INSERT INTO appointment (
  id_appointment, date, time, reason, status, id_patient, id_doctor, id_department
)
VALUES
  (1, '2024-10-10', '10:00', 'General checkup', NULL, 1, 1, 1);

-- Insert an appointment in the future → should automatically become 'Pending'
INSERT INTO appointment (
  id_appointment, date, time, reason, status, id_patient, id_doctor, id_department
)
VALUES
  (2, CURRENT_DATE + INTERVAL '5 days', '15:00', 'Follow-up', NULL, 1, 1, 1);

-- Insert an appointment for today (depends on current time)
INSERT INTO appointment (
  id_appointment, date, time, reason, status, id_patient, id_doctor, id_department
)
VALUES
  (3, CURRENT_DATE, '08:00', 'Routine control', NULL, 1, 1, 1);

-- View results
SELECT 
  id_appointment,
  date,
  time,
  reason,
  status
FROM appointment
ORDER BY id_appointment;