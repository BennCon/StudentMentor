CREATE TABLE mentees (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    course TEXT,
    year_of_study INTEGER,
    has_contacted INTEGER,
    has_mentor INTEGER,
    number_of_rejections INTEGER,
    email TEXT,
    password TEXT
);

CREATE TABLE mentors (
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

CREATE TABLE admins (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    admin_code TEXT,
    email TEXT,
    password TEXT
);