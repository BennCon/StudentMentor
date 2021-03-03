CREATE TABLE mentee (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    course TEXT,
    year_of_study INTEGER,
    has_mentor INTEGER,
    email TEXT,
    password TEXT
);

CREATE TABLE mentor (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    industry TEXT,
    company TEXT,
    number_of_mentees INTEGER,
    seeking_mentee INTEGER,
    email TEXT,
    password TEXT
);

CREATE TABLE admin (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    email TEXT,
    password TEXT
);