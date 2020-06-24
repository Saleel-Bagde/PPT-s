CREATE TABLE company (
    company_id INT,
    company_name VARCHAR(45),
    company_city VARCHAR(45)
);

CREATE TABLE food (
    item_id INT,
    item_name VARCHAR(45),
    item_unit VARCHAR(45),
    company_id INT  );


INSERT INTO company  VALUES (18, 'Akas Foods', 'pune');
INSERT INTO company  VALUES (15, 'Foodies', 'baroda');
INSERT INTO company  VALUES (16, 'Gold Foods', 'surat');
INSERT INTO company  VALUES (17, 'Natural Foons', 'pune');
INSERT INTO company  VALUES (19, 'J&S Foods', 'mumbai');


INSERT INTO food VALUES (1, 'biscuit', 'packet',18);
INSERT INTO food VALUES (4, 'cakes', 'Pcs', 15);
INSERT INTO food VALUES (6, 'cheez', 'packet', 16);
INSERT INTO food VALUES (5, 'butter', 'packet', 17);
INSERT INTO food VALUES (2, 'bread', 'packet', 19);
INSERT INTO food VALUES (7, 'eggs', 'Pcs', NULL);
INSERT INTO food VALUES (3, 'salt', 'packet', NULL);