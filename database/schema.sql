-- Initial setup script

CREATE TABLE patient (
  id_patient SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  document_type VARCHAR(20),
  document_number VARCHAR(20) UNIQUE,
  birth_date DATE,
  gender CHAR(1),
  address VARCHAR(150),
  phone VARCHAR(20),
  email VARCHAR(100),
  health_provider VARCHAR(50)
);

CREATE TABLE department (
  id_department SERIAL PRIMARY KEY,
  name VARCHAR(50),
  description VARCHAR(256),
  location VARCHAR(50)
);

CREATE TABLE doctor (
  id_doctor SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  document_type VARCHAR(20),
  document_number VARCHAR(20) UNIQUE,
  specialty VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100),
  id_department INT REFERENCES department (id_department)
);

CREATE TABLE appointment (
  id_appointment SERIAL PRIMARY KEY,
  date DATE,
  time TIME,
  reason VARCHAR(256),
  status VARCHAR(20),
  id_patient INT REFERENCES patient (id_patient),
  id_doctor INT REFERENCES doctor (id_doctor),
  id_department INT REFERENCES department (id_department)
);

CREATE TABLE medical_record (
  id_record SERIAL PRIMARY KEY,
  creation_date TIMESTAMP,
  diagnosis VARCHAR(256),
  treatment VARCHAR(256),
  notes VARCHAR(256),
  id_patient INT REFERENCES patient (id_patient),
  id_doctor INT REFERENCES doctor (id_doctor)
);

CREATE TABLE medication (
  id_medication SERIAL PRIMARY KEY,
  name VARCHAR(100),
  description VARCHAR(256),
  stock INT,
  expiration_date DATE
);

CREATE TABLE prescription (
  id_prescription SERIAL PRIMARY KEY,
  id_record INT REFERENCES medical_record (id_record),
  id_medication INT REFERENCES medication (id_medication),
  dosage VARCHAR(50),
  frequency VARCHAR(50)
);

CREATE TABLE user_account (
  id_user SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  role VARCHAR(20),
  password_hash CHAR(64)
);

CREATE TABLE inventory (
  id_department INT REFERENCES department (id_department),
  id_medication INT REFERENCES medication (id_medication),
  stock INT
);
