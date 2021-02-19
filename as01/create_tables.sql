--CREATING TABLES
DROP TABLE IF EXISTS students, interests, temp;

CREATE TABLE IF NOT EXISTS students (
	st_id serial PRIMARY KEY,
	st_name VARCHAR(15) NOT NULL,
    st_last VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS interests (
    student_id INT NOT NULL,
    interest VARCHAR NOT NULL,
    FOREIGN KEY (student_id)
    REFERENCES students (st_id)
);

INSERT INTO students (st_id, st_name, st_last)
VALUES (1, 'John', 'Wick'), 
	   (2, 'John', 'Cena'), 
	   (3, 'Angus', 'Young') ON CONFLICT DO NOTHING;

INSERT INTO interests (student_id, interest)
VALUES (1, 'Guns'), 
(1, 'Knives'), 
(1, 'Fists'), 
(3, 'Guitars'), 
(2, 'Invisibility'), 
(3, 'Outfits');

--CREATING TABLES