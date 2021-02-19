CREATE TABLE IF NOT EXISTS temp (
	temp_id INT,
    temp_interest VARCHAR,
	temp_interests VARCHAR,
    FOREIGN KEY (temp_id)
    REFERENCES students (student_id)
);

--LOOP is problematic, can only restore interests of first id

DO
$do$
DECLARE
   str_array VARCHAR[];
   _counter int := 1;
   _counter2 int := 1;
BEGIN
--SOME TRIALS
--WHILE _counter2 <= cardinality(array(SELECT interests from interests)) LOOP
--WHILE _counter <= cardinality(array(SELECT interests from interests))[_counter2]) LOOP

FOR str_array IN SELECT interests FROM interests LOOP
   WHILE _counter <= cardinality(str_array) LOOP
      --INSERT INTO temp (temp_id, temp_interests) VALUES(_counter2, array(SELECT interests from interests)[_counter]);
	  INSERT INTO temp (temp_id, temp_interests) VALUES(_counter2, str_array[_counter]);
	  _counter := _counter + 1;
   END LOOP;
   _counter2 := _counter2 + 1;
END LOOP;
END;
$do$;

--EMPTYING table
TRUNCATE interests;

--RESTORING BACK
ALTER TABLE interests
	ALTER COLUMN interests TYPE VARCHAR;
ALTER TABLE interests
	RENAME COLUMN interests TO interest;

--FILLING table from temp
INSERT INTO interests (student_id, interest)
SELECT temp_id, temp_interests FROM temp;

DROP TABLE temp;

--RESTORING
ALTER TABLE students
	RENAME COLUMN student_id TO st_id;
ALTER TABLE students
	ALTER COLUMN st_name TYPE VARCHAR(15),
	ALTER COLUMN st_last TYPE VARCHAR(15);	
	
		