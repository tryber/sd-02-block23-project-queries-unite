CREATE TABLE clone_troopers LIKE users; 
INSERT clone_troopers SELECT * FROM users;
