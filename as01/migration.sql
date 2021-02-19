--MIGRATION

--adding temporary column
ALTER TABLE students
	ADD temp_interests VARCHAR[];

--adding arrays to temp columns
UPDATE students
	SET temp_interests = ARRAY(SELECT interest FROM interests WHERE student_id = st_id);

TRUNCATE interests;

ALTER TABLE interests
	ALTER COLUMN interest TYPE VARCHAR[] USING ARRAY[interest];
ALTER TABLE interests
	RENAME COLUMN interest TO interests;

INSERT INTO interests (student_id, interests)
SELECT st_id, temp_interests FROM students;

ALTER TABLE students
	DROP COLUMN temp_interests;

ALTER TABLE students
	RENAME COLUMN st_id TO student_id;
ALTER TABLE students
	ALTER COLUMN st_name TYPE VARCHAR(30),
	ALTER COLUMN st_last TYPE VARCHAR(30);