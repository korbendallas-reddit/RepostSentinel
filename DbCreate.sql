DROP TABLE IF EXISTS SubredditSettings;

CREATE TABLE SubredditSettings (
	subname VARCHAR(21) PRIMARY KEY,
	imported BOOLEAN,
	min_width DOUBLE PRECISION,
	min_height DOUBLE PRECISION,
	min_pixels DOUBLE PRECISION,
	min_size DOUBLE PRECISION,
	report_match_threshold INTEGER,
	report_match_message TEXT,
	remove_match_threshold INTEGER,
	remove_match_message TEXT,
	report_indirect BOOLEAN,
	remove_indirect BOOLEAN,
	remove_indirect_message TEXT
);

INSERT INTO SubredditSettings(
    subname, 
    imported, 
    min_width, 
    min_height, 
    min_pixels, 
    min_size, 
    report_match_threshold, 
    report_match_message, 
    remove_match_threshold, 
    remove_match_message, 
    report_indirect, 
    remove_indirect, 
    remove_indirect_message
) VALUES(
    'photoshopbattles', 
    False, 
    450, 
    450, 
    360000, 
    1, 
    88, 
    '', 
    100, 
    '', 
    True, 
    False, 
    ''
);



DROP TABLE IF EXISTS Submissions;

CREATE TABLE Submissions (
	id VARCHAR(10) PRIMARY KEY,
	subreddit VARCHAR(21),
	timestamp DOUBLE PRECISION,
	author VARCHAR(50),
	title TEXT,
	url TEXT,
	comments INTEGER,
	score DOUBLE PRECISION,
	deleted BOOLEAN,
	removed BOOLEAN,
	removal_reason TEXT,
	blacklist BOOLEAN,
	processed BOOLEAN
);



DROP TABLE IF EXISTS Media;

CREATE TABLE Media (
	hash VARCHAR(32),
	submission_id VARCHAR(10),
	subreddit VARCHAR(21),
	frame_number INTEGER,
	frame_count DOUBLE PRECISION,
	frame_width DOUBLE PRECISION,
	frame_height DOUBLE PRECISION,
	total_pixels DOUBLE PRECISION,
	file_size DOUBLE PRECISION,
	PRIMARY KEY (submission_id, frame_number, hash)
);
