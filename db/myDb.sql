DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS missionary_service CASCADE;
DROP TABLE IF EXISTS missionary_timeline CASCADE;
DROP TABLE IF EXISTS unit CASCADE;

DROP SEQUENCE IF EXISTS users_s1;
DROP SEQUENCE IF EXISTS missionary_service_s1;
DROP SEQUENCE IF EXISTS missionary_timeline_s1;
DROP SEQUENCE IF EXISTS unit_s1;


CREATE TABLE public.users (
    user_id      INTEGER         CONSTRAINT users_pk PRIMARY KEY    NOT NULL,
    username     VARCHAR(100)                                       NOT NULL UNIQUE,
    password     VARCHAR(255)                                       NOT NULL,
    first_name   VARCHAR(30)                                        NOT NULL,   
    middle_name  VARCHAR(30),
    last_name    VARCHAR(30)                                        NOT NULL,
    birthday     DATE,
    email        VARCHAR(50)                                        NOT NULL,
    phone_number VARCHAR(20)
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
    phone_number)
VALUES (
    NEXTVAL('users_s1'), 
    'leonidasyopan', 
    '10081985', 
    'Leonidas',
    '',
    'Yopan',
    '10-08-1985',
    'leonidasyopan@gmail.com',
    '+55 48 99823-5707');

INSERT INTO public.users (
    user_id, 
    username, 
    password, 
    first_name, 
    middle_name, 
    last_name, 
    birthday, 
    email, 
    phone_number)
VALUES (
    NEXTVAL('users_s1'), 
    'larissayopan', 
    '06051991', 
    'Larissa',
    'Machado Motta',
    'Yopan',
    '05-06-1991',
    'larissayopan@gmail.com',
    '+55 48 99821-1421');

/* UPDATING INFOR FROM USER */     

UPDATE users
SET password = '06051991',
    birthday = '08-10-1985'
WHERE
    username = 'larissayopan';


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


INSERT INTO public.missionary_service VALUES
    (NEXTVAL('missionary_timeline_s1'), 'Sunday Evening', '2015', 'October');

INSERT INTO public.missionary_timeline VALUES
    (NEXTVAL('unit_s1'), '1003', '1003', '1002', 'Elder Bednar said something cool about something nice');

/* JOIN TABLES */

SELECT
    us.first_name,
    us.last_name,
    un.unit_name,
    un.stake_name
FROM
    public.users us
INNER JOIN public.unit un ON us.user_id = n.user_id
;