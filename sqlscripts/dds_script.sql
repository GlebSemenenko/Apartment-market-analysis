
-- Create Shema

create SCHEMA IF NOT EXISTS apartment_dds;

-- tables
-- Table: apartment_hub
CREATE TABLE apartment_hub (
    apartment_id int  NOT NULL,
    load_date date  NULL,
    record_source int  NULL,
    CONSTRAINT apartment_id PRIMARY KEY (apartment_id)
);

-- Table: apartment_sat
CREATE TABLE apartment_sat (
    apartment_id int  NOT NULL,
    link_to_add varchar(400)  NULL,
    price int  NOT NULL,
    kv int  NOT NULL,
    city varchar(30)  NOT NULL,
    address char(150)  NOT NULL,
    type_of_apartment varchar(55)  NOT NULL,
    publication_date date  NOT NULL,
    CONSTRAINT apartment_sat_pk PRIMARY KEY (apartment_id)
);

-- Table: apartment_to_seller_link
CREATE TABLE apartment_to_seller_link (
    apartment_to_seller_link_id int  NOT NULL,
    apartment_id int  NOT NULL,
    seller_id int  NOT NULL,
    CONSTRAINT apartment_to_seller_link_pk PRIMARY KEY (apartment_to_seller_link_id)
);

-- Table: seller_hub
CREATE TABLE seller_hub (
    seller_id int  NOT NULL,
    load_date date  NULL,
    record_source int  NULL,
    CONSTRAINT seller_hub_pk PRIMARY KEY (seller_id)
);

-- Table: seller_sat
CREATE TABLE seller_sat (
    seller_id int  NOT NULL,
    seller_hub_seller_id int  NOT NULL,
    contact varchar(55)  NOT NULL,
    CONSTRAINT seller_sat_pk PRIMARY KEY (seller_id)
);

-- foreign keys
-- Reference: Table_12_apartment_hub (table: apartment_to_seller_link)
ALTER TABLE apartment_to_seller_link ADD CONSTRAINT Table_12_apartment_hub
    FOREIGN KEY (apartment_id)
    REFERENCES apartment_hub (apartment_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_12_seller_hub (table: apartment_to_seller_link)
ALTER TABLE apartment_to_seller_link ADD CONSTRAINT Table_12_seller_hub
    FOREIGN KEY (seller_id)
    REFERENCES seller_hub (seller_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sat_apartment_apartment_hub (table: apartment_sat)
ALTER TABLE apartment_sat ADD CONSTRAINT sat_apartment_apartment_hub
    FOREIGN KEY (apartment_id)
    REFERENCES apartment_hub (apartment_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: seller_sat_seller_hub (table: seller_sat)
ALTER TABLE seller_sat ADD CONSTRAINT seller_sat_seller_hub
    FOREIGN KEY (seller_id)
    REFERENCES seller_hub (seller_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.
