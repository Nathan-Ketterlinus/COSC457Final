use narella1db;

CREATE TABLE IF NOT EXISTS testWorker( 
    WID INT NOT NULL,
    WFName VARCHAR(45) NULL,
    WMInit CHAR(1) NULL,
    WLName VARCHAR(45) NULL,
    Wsalary INT NULL,
    WDoB DATE NULL,
    WAddress VARCHAR(80) NULL,
    SSN INT NULL,
    PRIMARY KEY (WID)
);

CREATE TABLE IF NOT EXISTS testClient (
  CID INT NOT NULL,
  FName VARCHAR(45) NULL,
  LName VARCHAR(45) NULL,
  CDoB DATE NULL,
  PaymentInfo VARCHAR(16) NULL,
  WID INT NULL,
  PRIMARY KEY (CID),
  FOREIGN KEY (WID) REFERENCES testWorker (WID)
);

CREATE TABLE IF NOT EXISTS testContractor (
  ContID INT NOT NULL,
  Job VARCHAR(45) NULL,
  Cost FLOAT NULL,
  PhoneNo VARCHAR(10) NULL,
  PRIMARY KEY (ContID)
);

CREATE TABLE IF NOT EXISTS testEvent(
  EID INT NOT NULL,
  EName VARCHAR(45) NULL,
  EDate DATE NULL,
  ETime TIME NULL,
  ELocation VARCHAR(45) NULL,
  ETheme VARCHAR(45) NULL,
  EColors VARCHAR(45) NULL,
  EIsPaid TINYINT NULL,
  CID INT NULL,
  EHours INT NULL,
  PRIMARY KEY (EID),
  FOREIGN KEY (CID) REFERENCES testClient (CID)
);

CREATE TABLE IF NOT EXISTS testInventory (
  IID INT NOT NULL,
  IPrice FLOAT NULL,
  IItemKind VARCHAR(45) NULL,
  IQuantity INT NULL,
  IReturnDate DATE NULL,
  PRIMARY KEY (IID)
);

CREATE TABLE IF NOT EXISTS testFavor (
  FID INT NOT NULL,
  FKind VARCHAR(45) NULL,
  FAmount VARCHAR(45) NULL,
  FDeadline DATE NULL,
  FHours INT NULL,
  FIsPaid TINYINT NULL,
  FMaterialPrice VARCHAR(45) NULL,
  FIsMade TINYINT NULL,
  CID INT NULL,
  EID INT NULL,
  PRIMARY KEY (FID),
  FOREIGN KEY (CID) REFERENCES testClient (CID),
  FOREIGN KEY (EID) REFERENCES testEvent (EID)
);

CREATE TABLE IF NOT EXISTS testWorkerCreates (
  FID INT NOT NULL,
  WID INT NOT NULL,
  PRIMARY KEY (FID, WID),
  FOREIGN KEY (FID) REFERENCES testFavor (FID),
  FOREIGN KEY (WID) REFERENCES testWorker (WID)
);

insert into testWorker values (0, 'Nick', 'G', 'Arellano', 10000, 19970111, '1588 Garden St., Essex, MD 21221', 111223333);
insert into testWorker values (1, 'Nate', NULL, 'Ketterlinus', 2, 20000101, '420 York Rd., Towson, MD 21202', 111223334);
insert into testWorker values (2, 'Hailey', 'E', 'Violin', 2, 20010911, '27 Yummers Ct., Dundalk, MD 21002', 303992502);
insert into testWorker values (3, "Nke", NULL, 'Yem', 2, 20241031, '777 Balloon Dr., Baltimore, MD 21203', 123456789);
insert into testWorker values (4, 'Selena', NULL, 'Hachi', 2, 20200505, '61 York Rd., Towson, MD 21202', 888776666);

insert into testClient values (0, 'John', 'Frank', 20201111, 1234567890123456, 1);
insert into testClient values (1, 'Emily', 'Chen', 19990520, 4444555566667777,3);
insert into testClient Values (2,'Robert', 'Garcia', 19780325, 5555666677778888, 4);
insert into testClient Values (3, 'Maria', 'Lee', 19901201, 2222111100009999, 2);
insert into testClient Values (4, 'Chris', 'Baker', 19650719, 8888777766665555, 2);

insert into testContractor values (0, 'Clown', 200.00, 4104106789);
insert into testContractor values (1,'Waiter', 85.00,4435551234);
insert into testContractor values (2, 'Magician', 95.00, 2025556789);
insert into testContractor values (3, 'Singer', 65.00, 3015550011);
insert into testContractor values (4, 'Juggler', 75.00,7035552233);
insert into testContractor values (5, 'Doorman', 55.00,4105554455);

insert into testEvent values (0, 'Nicks Birthday', 20260111, 120000, '11 Nowhere Ct., Hell, MD 21666', 'Hell Themed', 'Red and Black', 0, 4, 3);
insert into testEvent values (1, 'Company Holiday party', 20251205, 183000, 'Grand Ballroom, Baltimore, MD 21201', 'Black Tie', 'Gold and Black', 1, 1, 5);
insert into testEvent values (2, 'Summer Picnic', 20260615, 140000, 'Local Park, Towson, MD 21204', 'Beach Vibes', 'Blue and White', 0, 3, 2);
insert into testEvent values (3, 'Product Startup', 20260320, 100000, 'Tech Center, Columbia, MD 21044', 'Futuristic', 'Neon Green', 1, 2, 4);
insert into testEvent values (4, 'Wedding Ceremony', 20260901, 170000, 'Waterfront Venue, Annapolis, MD 21401', 'Rustic Chic', 'Ivory and Sage', 1, 4, 6);

insert into testInventory values (0, 250.24, 'Table', 20, 20260112);
insert into testInventory values (1, 15.50, 'Chairs (Folding)', 150, 20260115);
insert into testInventory values (2,89.99, 'Sound System', 5, 20260320);
insert into testInventory values (3,450.00, 'Tent (20x30ft)', 2, 20260601);
insert into testInventory values (4, 5.75, 'Linen (White)', 500, 20260111);
insert into testInventory values (5, 120.00, 'Dance Floor Sections', 10, 20260905);

insert into testFavor values (0, 'Candy Bag', 20, 20260109, 3, 0, 80.50, 1, 3, 4);
insert into testFavor values (1, 'Custom Mugs', 50, 20251125, 5, 1, 250.00, 1, 1, 1);
insert into testFavor values (2, 'Branded Pens', 150, 20260315, 0, 1, 75.00, 1, 2, 3);
insert into testFavor values (3, 'Mini Plants', 40, 20260610, 8, 0, 160.75, 0, 4, 2);
insert into testFavor values (4, 'Keychains' , 30, 20260820, 2, 1, 45.99, 1, 3, 0);

insert into testWorkerCreates values (0, 0);
insert into testWorkerCreates values (1, 1);
insert into testWorkerCreates values (2, 2);
insert into testWorkerCreates values (3, 3);
insert into testWorkerCreates values (4, 4);

