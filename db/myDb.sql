DROP TABLE IF EXISTS user_access CASCADE;
DROP TABLE IF EXISTS user_profile CASCADE;
DROP TABLE IF EXISTS missionary_service CASCADE;
DROP TABLE IF EXISTS missionary_timeline CASCADE;
DROP TABLE IF EXISTS unit CASCADE;

CREATE TABLE user_access (
    user_id             SERIAL         PRIMARY KEY      NOT NULL,
    username            VARCHAR(100)                    NOT NULL    UNIQUE,
    password            VARCHAR(255)                    NOT NULL,
    email               VARCHAR(255)                    NOT NULL,    
    user_create_date    DATE
);

SELECT * FROM user_access;

CREATE TABLE user_profile (
    user_id             INTEGER                         NOT NULL,
    first_name          VARCHAR(255),   
    middle_name         VARCHAR(255),
    last_name           VARCHAR(255),
    birthday            DATE,
    phone_number        VARCHAR(20),
    returned_missionary BOOLEAN,
    img_src             VARCHAR(255),
    CONSTRAINT user_profile_fk_1    FOREIGN KEY(user_id)      REFERENCES user_access(user_id)
);

SELECT * FROM user_profile;

CREATE TABLE unit (
    unit_id         SERIAL      PRIMARY KEY         NOT NULL,
    unit_number     INTEGER,
    unit_name       VARCHAR(255),
    stake_name      VARCHAR(255),
    city            VARCHAR(255),
    state           VARCHAR(255),
    country         VARCHAR(255)
);

SELECT * FROM unit;

CREATE TABLE missionary_service (
    user_id                 INTEGER         NOT NULL,
    missionary_title        VARCHAR(255),
    mission_local           VARCHAR(255),
    mission_start           DATE,
    mission_end             DATE,
    CONSTRAINT missionary_service_fk_1    FOREIGN KEY(user_id)      REFERENCES user_access(user_id)            
);

SELECT * FROM missionary_service;

CREATE TABLE missionary_timeline (
    user_id             INTEGER             NOT NULL,
    unit_id             INTEGER             NOT NULL,
    companion_name      VARCHAR(30),
    transfer_start      DATE,
    transfer_end        DATE,
    CONSTRAINT missionary_timeline_fk_1    FOREIGN KEY(user_id)      REFERENCES user_access(user_id),
    CONSTRAINT missionary_timeline_fk_2    FOREIGN KEY(unit_id)      REFERENCES unit(unit_id)   
);

SELECT * FROM missionary_timeline;

CREATE TABLE password_resets (
    id          SERIAL            PRIMARY KEY       NOT NULL,
    email       VARCHAR(255)                        NOT NULL,
    token      VARCHAR(255)                         NOT NULL
);

SELECT * FROM password_resets;

/* INSERT USERS INTO USERS TABLE */ 

INSERT INTO user_access (
    username, 
    password, 
    email,
    user_create_date)
VALUES (
    'leonidasyopan', 
    '10081985', 
    'leonidasyopan@gmail.com',
    current_timestamp);

SELECT * FROM user_access;

INSERT INTO user_profile (
    user_id,
    first_name, 
    middle_name, 
    last_name, 
    birthday, 
    phone_number,
    returned_missionary)
VALUES (
    (SELECT user_id FROM user_access WHERE username = 'leonidasyopan'),
    'Leonidas',
    '',
    'Yopan',
    '10-08-1985',
    '+55 48 99823-5707',
    'true');

SELECT * FROM user_profile;

INSERT INTO user_access (
    username, 
    password, 
    email,
    user_create_date)
VALUES ( 
    'evanselder', 
    '06051991', 
    'teste@gmail.com',
    current_timestamp);

SELECT * FROM user_access;
    
INSERT INTO user_profile (
    user_id,
    first_name, 
    middle_name, 
    last_name, 
    birthday, 
    phone_number,
    returned_missionary)
VALUES ( 
    (SELECT user_id FROM user_access WHERE username = 'evanselder'),
    'Jonathan',
    '',
    'Evans',
    '05-06-1991',
    '+0 804 821-1421',
    'true');

SELECT * FROM user_profile;

INSERT INTO user_access (
    username, 
    password, 
    email, 
    user_create_date)
VALUES (
    'larissayopan', 
    '06051991', 
    'larissayopan@gmail.com',
    current_timestamp);

SELECT * FROM user_access;

INSERT INTO user_profile (
    user_id,
    first_name, 
    middle_name, 
    last_name, 
    birthday, 
    phone_number,
    returned_missionary)
VALUES (
    (SELECT user_id FROM user_access WHERE username = 'larissayopan'),
    'Larissa',
    'Machado Motta',
    'Yopan',
    '05-06-1991',
    '+55 48 99821-1421',
    'false');

SELECT * FROM user_profile;

/* INSERT UNITS INTO UNIT TABLE */

INSERT INTO unit (
    unit_id,
    unit_number, 
    unit_name,
    stake_name,
    city,
    state,
    country) 
VALUES (
    NEXTVAL('unit_unit_id_seq'),
    NULL,
    'Ala Forquilhinhas',
    'Estaca São José',
    'São José',
    'Santa Catarina',
    'Brasil'    
);

SELECT * FROM unit;

INSERT INTO unit (
    unit_number, 
    unit_name,
    stake_name,
    city,
    state,
    country) 
VALUES (
    NULL,
    'Ramo Oswaldo Cruz',
    'Distrito Tupã',
    'Oswaldo Cruz',
    'São Paulo',
    'Brasil'    
);

SELECT * FROM unit;

INSERT INTO unit (
    unit_number, 
    unit_name,
    stake_name,
    city,
    state,
    country) 
VALUES (
    NULL,
    'Ramo Nova Tupã',
    'Distrito Tupã',
    'Tupã',
    'São Paulo',
    'Brasil'    
);

SELECT * FROM unit;

/* INSERT MISSION INTO MISSIONARY SERVICE TABBE */

INSERT INTO missionary_service (
    user_id,
    missionary_title,
    mission_local,
    mission_start,
    mission_end)
VALUES (
    (SELECT users_id FROM users WHERE username = 'leonidasyopan'),
    'Elder Yopán',
    'Missão Brasil Londrina',
    '03-23-2005',
    '03-23-2007'
);

SELECT * FROM missionary_service;

INSERT INTO missionary_service (
    user_id, 
    missionary_title, 
    mission_local, 
    mission_start, 
    mission_end) 
VALUES (
    CURRVAL('user_access_user_id_seq'),
    'Elder Yopán',
    'Missão Brasil Brasília',
    '06-06-2006',
    '06-06-2008'
);

SELECT * FROM missionary_service;

INSERT INTO missionary_service (user_id, missionary_title, mission_local, mission_start, mission_end) VALUES (CURRVAL('user_access_user_id_seq'), 'Elder Barbosa', 'Missão Brasil Porto Alegre Sul', '2010-07-13', '2012-07-13');

SELECT * FROM missionary_service;

/* INSERT TRANSFER INTO MISSIONARY_TIMELINE */

INSERT INTO missionary_timeline (
    user_id,
    unit_id,
    companion_name,
    transfer_start,
    transfer_end)
VALUES (
    (SELECT user_id FROM user_access WHERE username = 'leonidasyopan'),
    (SELECT unit_id FROM unit WHERE unit_name = 'Ramo Oswaldo Cruz'),
    'Elder Evans',
    '07-10-2005',
    '08-24-2005'
);

SELECT * FROM missionary_timeline;

INSERT INTO missionary_timeline (
    user_id,
    unit_id,
    companion_name,
    transfer_start,
    transfer_end)
VALUES (
    (SELECT user_id FROM user_access WHERE username = 'leonidasyopan'),
    (SELECT unit_id FROM unit WHERE unit_name = 'Ramo Nova Tupã'),
    'Elder Price',
    '07-03-2006',
    '08-05-2006'
);

SELECT * FROM missionary_timeline;

INSERT INTO missionary_timeline (user_id, unit_id, companion_name, transfer_start, transfer_end) VALUES (CURRVAL('user_access_user_id_seq'), CURRVAL('unit_unit_id_seq'), 'Elder Pereira', '2007-07-01', '2009-07-01');

SELECT * FROM missionary_timeline;


/***************************************
***** COMMANDS USUALLY EVENTUALLY ******
***************************************/

/* ADD NEW COLUMN TO A TABLE */
ALTER TABLE users
    ADD returned_missionary BOOLEAN NOT NULL DEFAULT 'TRUE';

/* ALTER TABLE COLUMN */

ALTER TABLE users 
    ALTER COLUMN returned_missionary DROP DEFAULT;

/* UPDATING INFO FROM USER */     

UPDATE users
SET 
    returned_missionary = 'FALSE'
WHERE
    username = 'larissayopan';

UPDATE users
SET password = '06051991',
    birthday = '08-10-1985'
WHERE
    username = 'larissayopan';

/* A DELETE STATEMENT IN CASE DATA WAS WRONGLY INSERTED */

DELETE FROM missionary_service 
    WHERE user_id = (SELECT user_id FROM users WHERE username = 'leonidasyopan');

DELETE FROM unit
    WHERE unit_id = 3;



/* JOIN TABLES */

SELECT
    up.first_name || ' ' || up.last_name AS full_name,
    ms.missionary_title AS missionary_name,
    ms.mission_local,
    mt.companion_name AS companion,
    un.unit_name AS ward_or_branch,
    un.stake_name AS stake,
    mt.transfer_start,
    mt.transfer_end
FROM
    user_profile up
INNER JOIN missionary_timeline mt ON up.user_id = mt.user_id
INNER JOIN unit un ON un.unit_id = mt.unit_id
INNER JOIN missionary_service ms ON up.user_id = ms.user_id
    WHERE un.unit_name = 'Ramo Oswaldo Cruz';


CURRVAL('user_access_user_id_seq');
CURRVAL('unit_unit_id_seq');

SELECT * FROM user_access WHERE username='leonidasyopan' OR email='yopanssudo@gmail.com' LIMIT 1;

SELECT password FROM user_access WHERE username='arthuryopan';
