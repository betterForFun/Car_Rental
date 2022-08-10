-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_corp_coupon (
    c_discount_rate DECIMAL(30, 2) NOT NULL COMMENT 'the rate of the discount',
    corp_coupon_id  DOUBLE NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_corp_coupon.c_discount_rate IS
    'the rate of the discount'; */

ALTER TABLE ltd_corp_coupon ADD CONSTRAINT ltd_corp_coupon_pk PRIMARY KEY ( corp_coupon_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_corp_cus (
    email          VARCHAR(30) NOT NULL COMMENT 'email of the customer',
    corp_no        VARCHAR(30) NOT NULL COMMENT 'the cop registrartion number',
    emp_id         VARCHAR(30) NOT NULL COMMENT 'the employee id of the customer',
    corp_name      VARCHAR(30) NOT NULL COMMENT 'the name of the corp',
    corp_coupon_id DOUBLE NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_corp_cus.email IS
    'email of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_corp_cus.corp_no IS
    'the cop registrartion number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_corp_cus.emp_id IS
    'the employee id of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_corp_cus.corp_name IS
    'the name of the corp'; */

ALTER TABLE ltd_corp_cus ADD CONSTRAINT ltd_corp_cus_pk PRIMARY KEY ( email );

ALTER TABLE ltd_corp_cus ADD CONSTRAINT ltd_corp_cus_pkv1 UNIQUE ( corp_no,
                                                                   emp_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_customer (
    email         VARCHAR(30) NOT NULL COMMENT 'email of the customer',
    phone         BIGINT NOT NULL COMMENT 'phone number of the customer',
    street        VARCHAR(30) NOT NULL COMMENT 'the street name of the address',
    city          VARCHAR(30) NOT NULL COMMENT 'the city of the address',
    state         VARCHAR(30) NOT NULL COMMENT 'the state of the address',
    zip           DECIMAL(30) NOT NULL COMMENT 'the zip code of the address',
    customer_type VARCHAR(1) NOT NULL COMMENT 'the type of the customer'
);

ALTER TABLE ltd_customer
    ADD CONSTRAINT ch_inh_ltd_customer CHECK ( customer_type IN ( 'c', 'i' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.email IS
    'email of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.phone IS
    'phone number of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.street IS
    'the street name of the address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.city IS
    'the city of the address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.state IS
    'the state of the address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.zip IS
    'the zip code of the address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_customer.customer_type IS
    'the type of the customer'; */

ALTER TABLE ltd_customer ADD CONSTRAINT ltd_customer_pk PRIMARY KEY ( email );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_indi_coupon (
    indi_coupon_id     BIGINT NOT NULL COMMENT 'the coupon id ',
    indi_discount_rate DECIMAL(10, 2) NOT NULL COMMENT 'the rate of the discount',
    start_date         DATETIME NOT NULL COMMENT 'the start date',
    end_date           DATETIME NOT NULL COMMENT 'the end date of the coupon',
    license_id         VARCHAR(30)
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_coupon.indi_coupon_id IS
    'the coupon id '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_coupon.indi_discount_rate IS
    'the rate of the discount'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_coupon.start_date IS
    'the start date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_coupon.end_date IS
    'the end date of the coupon'; */

ALTER TABLE ltd_indi_coupon ADD CONSTRAINT ltd_indi_coupon_pk PRIMARY KEY ( indi_coupon_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_indi_cus (
    email          VARCHAR(30) NOT NULL COMMENT 'email of the customer',
    license_id     VARCHAR(30) NOT NULL COMMENT 'the driver license number',
    cus_fn         VARCHAR(30) NOT NULL COMMENT 'the first name of the customer',
    cus_ln         VARCHAR(30) NOT NULL COMMENT 'the last name of the customer',
    insurance_name VARCHAR(30) NOT NULL COMMENT 'the insurance company name',
    insurance_no   VARCHAR(30) NOT NULL COMMENT 'the insrance number'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_cus.email IS
    'email of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_cus.license_id IS
    'the driver license number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_cus.cus_fn IS
    'the first name of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_cus.cus_ln IS
    'the last name of the customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_cus.insurance_name IS
    'the insurance company name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_indi_cus.insurance_no IS
    'the insrance number'; */

ALTER TABLE ltd_indi_cus ADD CONSTRAINT ltd_indi_cus_pk PRIMARY KEY ( email );

ALTER TABLE ltd_indi_cus ADD CONSTRAINT ltd_indi_cus_pkv1 UNIQUE ( license_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_invoice (
    invoice_id BIGINT NOT NULL COMMENT 'the invoice id',
    `date`     DATETIME NOT NULL COMMENT 'the invoice date',
    amount     DECIMAL(30, 3) NOT NULL COMMENT 'the amount of this invoice',
    record_id  BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_invoice.invoice_id IS
    'the invoice id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_invoice."date" IS
    'the invoice date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_invoice.amount IS
    'the amount of this invoice'; */

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX ltd_invoice__idx ON
    ltd_invoice (
        record_id
    ASC );

ALTER TABLE ltd_invoice ADD CONSTRAINT ltd_invoice_pk PRIMARY KEY ( invoice_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_payment (
    payment_id     BIGINT NOT NULL COMMENT 'the payment id',
    payment_date   DATETIME NOT NULL COMMENT 'the date of this payment',
    payment_status VARCHAR(30) NOT NULL COMMENT 'the status of this payment',
    payment_type   VARCHAR(30) NOT NULL COMMENT 'the payment type ( credit, debit, gift ) ',
    card_no        VARCHAR(30) NOT NULL COMMENT 'the card number ',
    invoice_id     BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_payment.payment_id IS
    'the payment id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_payment.payment_date IS
    'the date of this payment'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_payment.payment_status IS
    'the status of this payment'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_payment.payment_type IS
    'the payment type ( credit, debit, gift ) '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_payment.card_no IS
    'the card number '; */

ALTER TABLE ltd_payment ADD CONSTRAINT ltd_payment_pk PRIMARY KEY ( payment_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_rent_record (
    record_id         BIGINT NOT NULL COMMENT 'the id of the record',
    pickup_office_id  VARCHAR(30) NOT NULL COMMENT 'the pick up location',
    dropoff_office_id VARCHAR(30) NOT NULL COMMENT 'the drop off location',
    pickup_date       DATETIME NOT NULL COMMENT 'the pick up date',
    dropoff_date      DATETIME NOT NULL COMMENT 'the drop off date',
    start_meter       DECIMAL(30) NOT NULL COMMENT 'the start millage',
    end_meter         DECIMAL(30) NOT NULL COMMENT 'the end millage',
    daliy_meter_limit DECIMAL(30) NOT NULL COMMENT 'the daily millage limit( if -1 then it''s unlimited)',
    email             VARCHAR(30) NOT NULL,
    vin               VARCHAR(30) NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.record_id IS
    'the id of the record'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.pickup_office_id IS
    'the pick up location'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.dropoff_office_id IS
    'the drop off location'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.pickup_date IS
    'the pick up date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.dropoff_date IS
    'the drop off date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.start_meter IS
    'the start millage'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.end_meter IS
    'the end millage'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_rent_record.daliy_meter_limit IS
    'the daily millage limit( if -1 then it''s unlimited)'; */

ALTER TABLE ltd_rent_record ADD CONSTRAINT ltd_rent_record_pk PRIMARY KEY ( record_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_vehicle (
    vin                  VARCHAR(30) NOT NULL COMMENT 'the vin number of this vehicle',
    make                 VARCHAR(30) NOT NULL COMMENT 'the make of this vehicle',
    model                VARCHAR(30) NOT NULL COMMENT 'the model of this vehicle',
    year                 BIGINT NOT NULL COMMENT 'the year of this vehicle',
    license_plate_number VARCHAR(30) NOT NULL COMMENT 'the license plate number',
    status               DOUBLE NOT NULL COMMENT 'the renting status of this vehicle',
    class_name           VARCHAR(30) NOT NULL,
    office_id            VARCHAR(30)
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle.vin IS
    'the vin number of this vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle.make IS
    'the make of this vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle.model IS
    'the model of this vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle.year IS
    'the year of this vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle.license_plate_number IS
    'the license plate number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle.status IS
    'the renting status of this vehicle'; */

ALTER TABLE ltd_vehicle ADD CONSTRAINT ltd_vehicle_pk PRIMARY KEY ( vin );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_vehicle_class (
    class_name       VARCHAR(30) NOT NULL COMMENT 'the class name',
    rental_rate      DECIMAL(10, 2) NOT NULL COMMENT 'rental rate',
    over_millage_fee DECIMAL(10, 2) NOT NULL COMMENT 'the over millage fee'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle_class.class_name IS
    'the class name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle_class.rental_rate IS
    'rental rate'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_vehicle_class.over_millage_fee IS
    'the over millage fee'; */

ALTER TABLE ltd_vehicle_class ADD CONSTRAINT ltd_vehicle_class_pk PRIMARY KEY ( class_name );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ltd_wow_office (
    office_id   VARCHAR(30) NOT NULL COMMENT 'the office id ',
    office_name VARCHAR(30) NOT NULL COMMENT 'the name of this office',
    phone       VARCHAR(30) NOT NULL COMMENT 'the phone number of this office',
    street      VARCHAR(30) NOT NULL COMMENT 'the street of this office',
    city        VARCHAR(30) NOT NULL COMMENT 'the city of this office',
    state       VARCHAR(30) NOT NULL COMMENT 'the state of this office',
    zip         DECIMAL(30) NOT NULL COMMENT 'the zip code of this office'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.office_id IS
    'the office id '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.office_name IS
    'the name of this office'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.phone IS
    'the phone number of this office'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.street IS
    'the street of this office'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.city IS
    'the city of this office'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.state IS
    'the state of this office'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ltd_wow_office.zip IS
    'the zip code of this office'; */

ALTER TABLE ltd_wow_office ADD CONSTRAINT ltd_wow_office_pk PRIMARY KEY ( office_id );

ALTER TABLE ltd_corp_cus
    ADD CONSTRAINT corp_cus_corp_coupon_fk FOREIGN KEY ( corp_coupon_id )
        REFERENCES ltd_corp_coupon ( corp_coupon_id );

ALTER TABLE ltd_corp_cus
    ADD CONSTRAINT corp_cus_customer_fk FOREIGN KEY ( email )
        REFERENCES ltd_customer ( email );

ALTER TABLE ltd_indi_coupon
    ADD CONSTRAINT indi_coupon_indi_cus_fk FOREIGN KEY ( license_id )
        REFERENCES ltd_indi_cus ( license_id );

ALTER TABLE ltd_indi_cus
    ADD CONSTRAINT indi_cus_customer_fk FOREIGN KEY ( email )
        REFERENCES ltd_customer ( email );

ALTER TABLE ltd_invoice
    ADD CONSTRAINT invoice_rent_record_fk FOREIGN KEY ( record_id )
        REFERENCES ltd_rent_record ( record_id );

ALTER TABLE ltd_payment
    ADD CONSTRAINT payment_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES ltd_invoice ( invoice_id );

ALTER TABLE ltd_rent_record
    ADD CONSTRAINT rent_record_customer_fk FOREIGN KEY ( email )
        REFERENCES ltd_customer ( email );

ALTER TABLE ltd_rent_record
    ADD CONSTRAINT rent_record_vehicle_fk FOREIGN KEY ( vin )
        REFERENCES ltd_vehicle ( vin );

ALTER TABLE LTD_rent_record 
	ADD CONSTRAINT dropoff_date CHECK (dropoff_date>=pickup_date);


ALTER TABLE ltd_vehicle
    ADD CONSTRAINT vehicle_vehicle_class_fk FOREIGN KEY ( class_name )
        REFERENCES ltd_vehicle_class ( class_name );

ALTER TABLE ltd_vehicle
    ADD CONSTRAINT vehicle_wow_office_fk FOREIGN KEY ( office_id )
        REFERENCES ltd_wow_office ( office_id );
        
        
        
        
        
-- trigger to create invoice
delimiter |;
CREATE TRIGGER invoice_trigger
AFTER INSERT ON LTD_rent_record 
FOR EACH ROW
BEGIN	
	DECLARE extramile INT;
    DECLARE days INT;
    DECLARE discount INT;
    DECLARE IndiOrCorp CHAR;
    DECLARE amount INT;
    DECLARE overamount INT;
    
    SET extramile = NEW.daliy_meter_limit - (NEW.end_meter - NEW.start_meter);
	SET days = DATEDIFF(NEW.dropoff_date, NEW.pickup_date);

	SET IndiOrCorp = 
    (SELECT LTD_CUSTOMER.CUSTOMER_TYPE
	FROM LTD_CUSTOMER
	WHERE LTD_CUSTOMER.EMAIL = NEW.EMAIL);
    
	IF IndiOrCorp = 'i' THEN
		SET discount = 
    	(SELECT MIN(LTD_INDI_COUPON.INDI_DISCOUNT_RATE)
    	FROM LTD_INDI_CUS
    	INNER JOIN LTD_INDI_COUPON
    	ON LTD_INDI_COUPON.LICENSE_ID = LTD_INDI_CUS.LICENSE_ID and NEW.EMAIL = LTD_INDI_CUS.EMAIL);
	ELSE
		SET discount = 
		(SELECT MIN(LTD_CORP_COUPON.C_DISCOUNT_RATE)
		FROM LTD_CORP_COUPON
		INNER JOIN LTD_CORP_CUS
		ON LTD_CORP_CUS.CORP_COUPON_ID = LTD_CORP_COUPON.CORP_COUPON_ID and NEW.EMAIL = LTD_CORP_CUS.EMAIL);
	END IF;
    
    SET amount = 
	(SELECT SUM(LTD_vehicle_class.rental_rate * days * discount)
	FROM LTD_vehicle_class
	INNER JOIN LTD_vehicle
	ON LTD_vehicle.class_name = LTD_vehicle_class.class_name
	WHERE NEW.vin = LTD_vehicle.vin);
	

	SET overamount = 
	(SELECT SUM((LTD_vehicle_class.rental_rate * days + (-1 * extramile * LTD_vehicle_class.over_millage_fee)) * discount)
	FROM LTD_vehicle_class
	INNER JOIN LTD_vehicle
	ON LTD_vehicle.class_name = LTD_vehicle_class.class_name
	WHERE NEW.vin = LTD_vehicle.vin);


	IF NEW.daliy_meter_limit = -1 or extramile > 0 THEN
	    INSERT INTO LTD_invoice VALUES(default, NEW.dropoff_date, amount, NEW.record_id);
    ELSEIF extramile < 0 THEN
        INSERT INTO LTD_invoice VALUES(default, NEW.dropoff_date, overamount, NEW.record_id);
	END IF;

END;