Create Table patients (
    id Int Primary Key,
    name Varchar(100),
    date_of_birth Date
);

Create Table medical_history (
    id Int Primary Key,
    admitted_at Timestamp,
    patients_id Int,
    status Varchar(100),
    Constraint fk_medical_history_patients 
		Foreign Key (patients_id)
    		References patients(id)
);

Create Table treatments (
    id Int Primary Key,
    type Varchar(100),
    name Varchar(100),
    medical_history_id Int,
    Constraint fk_treatments_medical_history 
		Foreign Key (medical_history_id)
    		References medical_history(id)
);

Create Table invoices (
    id Int Primary Key,
    total_amount DecimaL(5, 2),
    generated_at Timestamp,
    payed_at Timestamp,
    medical_history_id Int,
    Constraint fk_invoices_medical_history 
		Foreign Key (medical_history_id)
    		References medical_history(id)
);

Create Table invoice_items (
    id Int Primary Key,
    unit_price Decimal(5, 2),
    quantity Int,
    total_price Decimal(5, 2),
    invoices_ID Int,
    treatments_ID Int,
    Constraint fk_invoice_items_invoices 
		Foreign Key (invoices_id)
    		References invoices(id),
    CONSTRAINT fk_invoice_items_treatments 
		Foreign Key (treatments_id)
    		References treatments(id)
);

Create Table patient_treatment (
    patients_id Int,
    treatments_id Int,
    Constraint fk_patient_treatment_patient 
		Foreign Key (patients_id)
    		References patients(id),
    Constraint fk_patient_treatment_treatment 
		Foreign Key(treatments_id)
    		References treatments(id)
);