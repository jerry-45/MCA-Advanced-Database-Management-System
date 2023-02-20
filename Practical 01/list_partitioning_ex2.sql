CREATE TABLE Bank
(
	Bank_ID NUMBER,
	Bank_Name VARCHAR(32),
	loc VARCHAR(52)
)
PARTITION BY LIST(loc)
(
	PARTITION bk1 VALUES('Mumbai', 'Pune', 'Nashik'),
	PARTITION bk2 VALUES('Lucknow', 'Kanpur', 'Varanasi'),
	PARTITION bk3 VALUES('Chandigardh', 'Mohali', 'Amritsar'),
	PARTITION bk4 VALUES('Gandhinagar', 'Ahemdabad', 'Surat')
);

SELECT * FROM Bank;

INSERT INTO Bank VALUES(1, 'BOI', 'Mumbai');
INSERT INTO Bank VALUES(2, 'ICICI', 'Pune');
INSERT INTO Bank VALUES(3, 'PNB', 'Nashik');
INSERT INTO Bank VALUES(4, 'BOM', 'Lucknow');
INSERT INTO Bank VALUES(5, 'IngVyasa', 'Kanpur');
INSERT INTO Bank VALUES(6, 'CB', 'Varanasi');
INSERT INTO Bank VALUES(7, 'BOB', 'Chandigardh');
INSERT INTO Bank VALUES(8, 'BOA', 'Mohali');
INSERT INTO Bank VALUES(9, 'BOG', 'Amritsar');
INSERT INTO Bank VALUES(10, 'RBI', 'Gandhinagar');
INSERT INTO Bank VALUES(11, 'BOD', 'Surat');

SELECT * FROM Bank;

SELECT * FROM Bank PARTITION(bk1);
SELECT * FROM Bank PARTITION(bk2);
SELECT * FROM Bank PARTITION(bk3);
SELECT * FROM Bank PARTITION(bk4);

ALTER TABLE Bank MERGE PARTITIONS bk2, bk3 INTO PARTITION bk_new;

SELECT * FROM Bank PARTITION(bk_new);





