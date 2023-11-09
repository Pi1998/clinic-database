Create Table patients (
    id Int Primary Key,
    name Varchar(100),
    date_of_birth Date
);

Create Table medical_histories (
    id Int Primary Key,
    admitted_at Timestamp,
    patient_id Int,
    status Varchar(100),
    Constraint fk_medical_histories_patients 
		Foreign Key (patient_id)
    		References patients(id)
);

Create Table treatments (
    id Int Primary Key,
    type Varchar(100),
    name Varchar(100)
);

Create Table invoices (
    id Int Primary Key,
    total_amount Decimal(5, 2),
    generated_at Timestamp,
    payed_at Timestamp,
    medical_history_id Int,
    Constraint fk_invoices_medical_histories 
		Foreign Key (medical_history_id)
    		References medical_histories(id)
);

Create Table invoice_items (
    id Int Primary Key,
    unit_price Decimal(5, 2),
    quantity Int,
    total_price Decimal(5, 2),
    invoice_id Int,
    treatment_id Int,
    Constraint fk_invoice_items_invoices 
		Foreign Key (invoice_id)
    		References invoices(id),
    Constraint fk_invoice_items_treatments 
		Foreign Key (treatment_id)
    		References treatments(id)
);

Create Table medical_histories_treatments (
	id Int Primary Key,
    medical_history_id Int,
    treatments_id Int,
    Constraint fk_medical_histories_treatments_mh
		Foreign Key (medical_history_id)
    		References medical_histories(id),
    Constraint fk_medical_histories_treatments_tr 
		Foreign Key(treatments_id)
    		References treatments(id)
);


CREATE INDEX idx_medicalHistoryId_invoices ON invoices(medical_history_id);
CREATE INDEX idx_patientId_medicalHistories ON medical_histories(patient_id);
CREATE INDEX idx_invoiceId_invoiceItems ON invoice_items(invoice_id);
CREATE INDEX idx_treatmentId_invoiceItems ON invoice_items(treatment_id);
CREATE INDEX idx_medicalHistoryId_medicalHistoryTreatments ON medical_histories_treatments(medical_history_id);
CREATE INDEX idx_treatmentId_medicalHistoriesTreatments ON medical_histories_treatments(treatments_id);
