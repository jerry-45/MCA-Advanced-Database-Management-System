CREATE TABLE Product
(
	prdno VARCHAR(10),
	prodname VARCHAR(23),
	rate NUMBER,
	qty_available NUMBER
)
PARTITION BY LIST(prdno)
(
	PARTITION pd1 VALUES('p001','p002','p003','p004'),
	PARTITION pd2 VALUES('b001','b002','b003','b004'),
	PARTITION pd3 VALUES('c001','c002','c003','c004'),
	PARTITION pd4 VALUES('d001','d002','d003','d004')
);

SELECT * FROM user_tab_partitions WHERE table_name = 'Product';

desc Product;

INSERT INTO Product VALUES('p001', 'Monitor', 10000, 100);
INSERT INTO Product VALUES('p002', 'Mouse', 400, 150);
INSERT INTO Product VALUES('p003', 'Keyboard', 550, 150);
INSERT INTO Product VALUES('p004', 'Speakers', 1500, 80);

INSERT INTO Product VALUES('b001', 'Laptop', 50000, 30);
INSERT INTO Product VALUES('b002', 'Headphones', 2000, 20);
INSERT INTO Product VALUES('b003', 'Pendrive', 660, 50);
INSERT INTO Product VALUES('b004', 'Printer', 7000, 50);

INSERT INTO Product VALUES('c001', 'HDD', 2300, 26);
INSERT INTO Product VALUES('c002', 'SSD', 5000, 18);
INSERT INTO Product VALUES('c003', 'RAM', 3400, 20);
INSERT INTO Product VALUES('c004', 'Flash Drive', 6000, 22);

INSERT INTO Product VALUES('d001', 'GPU', 47000, 25);
INSERT INTO Product VALUES('d002', 'Joystick', 2200, 9);
INSERT INTO Product VALUES('d003', 'Processors', 12000, 14);
INSERT INTO Product VALUES('d004', 'Motherboard', 8000, 14);

SELECT * FROM Product;

SELECT * FROM Product PARTITION(pd1);
SELECT * FROM Product PARTITION(pd2);
SELECT * FROM Product PARTITION(pd3);
SELECT * FROM Product PARTITION(pd4);

ALTER TABLE Product ADD PARTITION pd5 VALUES('f001', 'f002', 'f003', 'f004');

INSERT INTO Product VALUES('f001', 'Mousepad', 80, 25);
INSERT INTO Product VALUES('f002', 'Wi-Fi Router', 2400, 20);
INSERT INTO Product VALUES('f003', 'LAN Cable', 200, 25);
INSERT INTO Product VALUES('f004', 'Switch', 1700, 29);

SELECT * FROM Product PARTITION(pd5);

ALTER TABLE Product RENAME PARTITION pd5 TO pd6;

SELECT * FROM Product PARTITION(pd5);
SELECT * FROM Product PARTITION(pd6);

ALTER TABLE Product MODIFY PARTITION pd6 ADD VALUES('f005');
ALTER TABLE Product MODIFY PARTITION pd6 DROP VALUES('f005');

ALTER TABLE Product MERGE PARTITIONS pd3, pd6 INTO PARTITION pd8;

SELECT * FROM Product PARTITION(pd3);
SELECT * FROM Product PARTITION(pd6);

SELECT * FROM Product PARTITION(pd8);
