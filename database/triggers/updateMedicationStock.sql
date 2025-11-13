-- FUNCTION AND TRIGGER TO AUTOMATICALLY UPDATE MEDICATION STOCK AFTER A PRESCRIPTION --

CREATE OR REPLACE FUNCTION public.update_medication_stock()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  -- Check that the medication exists
  IF NOT EXISTS (
    SELECT 1 FROM public.medication WHERE id_medication = NEW.id_medication
  ) THEN
    RAISE EXCEPTION 'Medication with ID % does not exist', NEW.id_medication;
  END IF;

  -- Verify that there is available stock
  IF (SELECT stock FROM public.medication WHERE id_medication = NEW.id_medication) <= 0 THEN
    RAISE EXCEPTION 'No stock available for medication with ID %', NEW.id_medication;
  END IF;

  -- Update the stock by decreasing one unit each time a prescription is added
  UPDATE public.medication
  SET stock = stock - 1
  WHERE id_medication = NEW.id_medication;

  -- Return the inserted row
  RETURN NEW;
END;
$$;

-- Drop the trigger if it already exists to avoid duplication
DROP TRIGGER IF EXISTS trg_update_stock ON public.prescription;

-- Create the trigger that runs after a new prescription is inserted
CREATE TRIGGER trg_update_stock
AFTER INSERT ON public.prescription
FOR EACH ROW
EXECUTE FUNCTION public.update_medication_stock();

-- Optional testing queries
SELECT * FROM prescription;
SELECT * FROM medication;

-- Example insert (test prescription)
INSERT INTO prescription (id_prescription, id_record, id_medication, dosage, frequency)
VALUES (37, 1, 1, '500 mg', 'Every 6 hours');
