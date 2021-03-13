CREATE TABLE mentees (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    gender TEXT,
    course TEXT,
    year_of_study INTEGER,
    biography TEXT,
    email TEXT,
    password TEXT,
    has_contacted INTEGER,
    has_mentor INTEGER,
    number_of_rejections INTEGER
);

CREATE TABLE mentors (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    gender TEXT,
    industry TEXT,
    company TEXT,
    sheffield_graduate INTEGER,
    degree_field TEXT,
    biography TEXT,
    email TEXT,
    password TEXT,
    number_of_mentees INTEGER,
    seeking_mentee INTEGER
);

CREATE TABLE admins (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    surname TEXT,
    admin_code TEXT,
    email TEXT,
    password TEXT
);

CREATE TABLE users (
   id INTEGER PRIMARY KEY,
   email TEXT,
   password TEXT,
   user_type TEXT
);