SELECT patient_id, patient_name, conditions
FROM Patients
#select records where DIAB1 occurs first or it occurs after a word
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';
# DIAB1%- DIAB1 occurs-after that any combo of chars
# % DIAB1%- any combo of chars followed by whitespace then DIAB1
