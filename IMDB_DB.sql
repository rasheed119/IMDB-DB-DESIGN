-- Movie Table
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    duration INT,
    description TEXT
    -- Add other relevant attributes as needed
);

-- Media Table
CREATE TABLE Media (
    media_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    media_type VARCHAR(50) NOT NULL,
    media_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Genre Table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
    -- Add other relevant attributes as needed
);

-- Movie_Genre Table
CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- Review Table
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    user_id INT NOT NULL,
    rating DECIMAL(2, 1),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
    -- Add other relevant attributes as needed
);

-- Artist Table
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
    -- Add other relevant attributes as needed
);

-- Skill Table
CREATE TABLE Skill (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL
    -- Add other relevant attributes as needed
);

-- Artist_Skill Table
CREATE TABLE Artist_Skill (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

-- Role Table
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL
    -- Add other relevant attributes as needed
);

-- Artist_Role_Movie Table
CREATE TABLE Artist_Role_Movie (
    artist_id INT,
    role_id INT,
    movie_id INT,
    PRIMARY KEY (artist_id, role_id, movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
