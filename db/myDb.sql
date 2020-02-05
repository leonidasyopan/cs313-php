DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS missionary_service CASCADE;
DROP TABLE IF EXISTS missionary_timeline CASCADE;
DROP TABLE IF EXISTS unit CASCADE;

DROP SEQUENCE IF EXISTS users_s1;
DROP SEQUENCE IF EXISTS missionary_service_s1;
DROP SEQUENCE IF EXISTS missionary_timeline_s1;
DROP SEQUENCE IF EXISTS unit_s1;


CREATE TABLE public.users (
    user_id             INTEGER         CONSTRAINT users_pk PRIMARY KEY    NOT NULL,
    username            VARCHAR(100)                                       NOT NULL UNIQUE,
    password            VARCHAR(255)                                       NOT NULL,
    first_name          VARCHAR(30)                                        NOT NULL,   
    middle_name         VARCHAR(30),
    last_name           VARCHAR(30)                                        NOT NULL,
    birthday            DATE,
    email               VARCHAR(50)                                        NOT NULL,
    phone_number        VARCHAR(20),
    returned_missionary BOOLEAN                                            NOT NULL
);

CREATE SEQUENCE users_s1 START WITH 1001;

CREATE TABLE public.unit (
    unit_id         INTEGER     CONSTRAINT unit_pk PRIMARY KEY      NOT NULL,
    unit_number     INTEGER,
    unit_name       VARCHAR(50)                                     NOT NULL,
    stake_name      VARCHAR(50)                                     NOT NULL,
    city            VARCHAR(50)                                     NOT NULL,
    state           VARCHAR(50)                                     NOT NULL,
    country         VARCHAR(50)                                     NOT NULL
);

CREATE SEQUENCE unit_s1 START WITH 1001;

CREATE TABLE public.missionary_service (
    user_id             INTEGER         NOT NULL,
    missionary_title    VARCHAR(30)     NOT NULL,
    mission_start       DATE            NOT NULL,
    mission_end         DATE            NOT NULL,
    CONSTRAINT missionary_service_fk_1    FOREIGN KEY(user_id)      REFERENCES public.users(user_id)            
);

CREATE SEQUENCE missionary_service_s1 START WITH 1001;

CREATE TABLE public.missionary_timeline (
    user_id             INTEGER             NOT NULL,
    unit_id             INTEGER             NOT NULL,
    companion_name      VARCHAR(30)         NOT NULL,
    transfer_start      DATE                NOT NULL,
    transfer_end        DATE                NOT NULL,
    CONSTRAINT missionary_timeline_fk_1    FOREIGN KEY(user_id)      REFERENCES public.users(user_id),
    CONSTRAINT missionary_timeline_fk_2    FOREIGN KEY(unit_id)      REFERENCES public.unit(unit_id)   
);

CREATE SEQUENCE missionary_timeline_s1 START WITH 1001;

/* INSERT USERS INTO USERS TABLE */ 

INSERT INTO public.users (
    user_id, 
    username, 
    password, 
    first_name, 
    middle_name, 
    last_name, 
    birthday, 
    email, 
    phone_number,
    returned_missionary)
VALUES (
    NEXTVAL('users_s1'), 
    'leonidasyopan', 
    '10081985', 
    'Leonidas',
    '',
    'Yopan',
    '10-08-1985',
    'leonidasyopan@gmail.com',
    '+55 48 99823-5707',
    'true');

INSERT INTO public.users (
    user_id, 
    username, 
    password, 
    first_name, 
    middle_name, 
    last_name, 
    birthday, 
    email, 
    phone_number,
    returned_missionary)
VALUES (
    NEXTVAL('users_s1'), 
    'larissayopan', 
    '06051991', 
    'Larissa',
    'Machado Motta',
    'Yopan',
    '05-06-1991',
    'larissayopan@gmail.com',
    '+55 48 99821-1421',
    'false');

/* INSERT UNITS INTO UNIT TABLE */

INSERT INTO public.unit (
    unit_id, 
    unit_number, 
    unit_name,
    stake_name,
    city,
    state,
    country) 
VALUES (
    NEXTVAL('unit_s1'),
    NULL,
    'Ramo Oswaldo Cruz',
    'Distrito Tupã',
    'Oswaldo Cruz',
    'São Paulo',
    'Brasil'    
);

INSERT INTO public.unit (
    unit_id, 
    unit_number, 
    unit_name,
    stake_name,
    city,
    state,
    country) 
VALUES (
    NEXTVAL('unit_s1'),
    NULL,
    'Ramo Nova Tupã',
    'Distrito Tupã',
    'Tupã',
    'São Paulo',
    'Brasil'    
);

/* INSERT MISSION INTO MISSIONARY SERVICE TABBE */

INSERT INTO public.missionary_service (
    user_id,
    missionary_title,
    mission_start,
    mission_end)
VALUES (
    (SELECT user_id FROM users WHERE username = 'leonidasyopan'),
    'Elder Yopán',
    '03-23-2005',
    '03-23-2007'
);

/* INSERT TRANSFER INTO MISSIONARY_TIMELINE */

INSERT INTO public.missionary_timeline (
    user_id,
    unit_id,
    companion_name,
    transfer_start,
    transfer_end)
VALUES (
    (SELECT user_id FROM users WHERE username = 'leonidasyopan'),
    (SELECT unit_id FROM unit WHERE unit_name = 'Ramo Oswaldo Cruz'),
    'Elder Evans',
    '07-10-2005',
    '08-24-2005'
);

INSERT INTO public.missionary_timeline (
    user_id,
    unit_id,
    companion_name,
    transfer_start,
    transfer_end)
VALUES (
    (SELECT user_id FROM users WHERE username = 'leonidasyopan'),
    (SELECT unit_id FROM unit WHERE unit_name = 'Ramo Nova Tupã'),
    'Elder Price',
    '07-03-2006',
    '08-05-2006'
);


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

DELETE FROM public.missionary_service 
    WHERE user_id = (SELECT user_id FROM users WHERE username = 'leonidasyopan');




/* JOIN TABLES */

SELECT
    us.first_name || ' ' || us.last_name AS full_name,
    ms.missionary_title AS missionary_name,
    mt.companion_name AS companion,
    un.unit_name AS ward_or_branch,
    un.stake_name AS stake,
    mt.transfer_start,
    mt.transfer_end
FROM
    public.users us
INNER JOIN public.missionary_timeline mt ON us.user_id = mt.user_id
INNER JOIN public.unit un ON un.unit_id = mt.unit_id
INNER JOIN public.missionary_service ms ON us.user_id = ms.user_id
    WHERE un.unit_name = 'Ramo Oswaldo Cruz';