CREATE TABLE role
(
    web_id       INT                     NOT NULL,
    version      INT       DEFAULT 0     NOT NULL,
    date_created TIMESTAMP DEFAULT NOW() NOT NULL,
    date_updated TIMESTAMP DEFAULT NOW() NOT NULL,
    external_key VARCHAR(255)            NOT NULL,
    role_code    VARCHAR(255),
    title        VARCHAR(255)            NOT NULL,
    descript  VARCHAR(255),
    uses       TEXT,
    activ       boolean   default true

);

create table if not exists permission_group
(
    web_id        INT                     not null,
    version       INT       default 0     not null,
    date_created  TIMESTAMP default now() not null,
    date_updated  TIMESTAMP default now() not null,
    descript      VARCHAR(255)            not null,
    group_code    VARCHAR(255),
    parent_web_id INT
);
create table if not exists permission
(
    web_id              INT                     not null,
    version             INT       default 0     not null,
    date_created        timestamp default now() not null,
    date_updated        timestamp default now() not null,
    permission_code     varchar(255)            not null,
    title               varchar(255)            not null,
    descript           varchar(255)            not null,
    permission_group_id INT,
    uses               text,
    activ             boolean   default true
);

create table if not exists role_permission
(
    web_id        INT                     not null,
    version       integer   default 0     not null,
    date_created  timestamp default now() not null,
    date_updated  timestamp default now() not null,
    role_id       INT                     not null,
    permission_id INT                     not null
);
create table IF NOT EXISTS web_usesr
(
    web_id       INT                     not null,
    version      INT       default 0     not null,
    date_created timestamp default now() not null,
    date_updated timestamp default now() not null,
    stat         INT       default 0     not null,
    first_name   varchar(255),
    last_name    varchar(255),
    email        varchar(255),
    phone        varchar(255),
    usesr_name    varchar(255),
    pass         varchar(255),
    gender       int,
    dob          timestamp,
    activ        boolean   default true,
    middle_name  varchar(255),
    time_zone    timestamp,
    lang        varchar(255)
);
create table IF NOT EXISTS web_usesr_role
(
    web_id       INT                     not null,
    version      INT       default 0     not null,
    date_created timestamp default now() not null,
    date_updated timestamp default now() not null,
    web_usesr_id  INT,
    role_id      INT                     not null,
    activ        boolean   default true
);
create table IF NOT EXISTS web_usesr_permission
(
    web_id        INT                     not null,
    version       integer   default 0     not null,
    date_created  timestamp default now() not null,
    date_updated  timestamp default now() not null,
    web_usesr_id   INT,
    permission_id INT                     not null,
    activ         boolean   default true
);
create table IF NOT EXISTS web_usesr_permission_group
(
    web_id              INT                     not null,
    version             INT       default 0     not null,
    date_created        timestamp default now() not null,
    date_updated        timestamp default now() not null,
    web_usesr_id         INT,
    permission_id       INT,
    permission_group_id INT                     not null,
    permission          varchar(20),
    activ               boolean   default true
);


# INSERT




INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                  descript, uses)
VALUES (1, now(), now(), 'ROLE_usesR', null, 'Customer usesr',
        'usesr for a customer', 'CUSTOMER');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                  descript, uses)
VALUES (2, now(), now(), 'ROLE_TEST_X', null,
        'Test X', 'Test X', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                  descript, uses)
VALUES (3, now(), now(), 'ROLE_SUPER_ADMIN', null,
        'Super Admin', 'Super Admin', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                  descript, uses)
VALUES (4, now(), now(), 'ROLE_STAFF', null, 'Staff',
        'Client staff', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                  descript, uses)
VALUES (5, now(), now(), 'ROLE_X', null, 'X',
        'APP X - Needs to be updated', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                  descript, uses)
VALUES (6, now(), now(), 'ROLE_SUPPORT', null, 'support', 'support',
        'STAFF');

-- TODO data for permission_group
INSERT INTO permission_group (web_id, date_created, date_updated, descript,
                              group_code, parent_web_id)
VALUES (1, now(), now(), 'Admin Settings', 'ADMIN_SETTING', null);

-- TODO data for permission
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                        descript, permission_group_id, uses)
VALUES (1, now(), now(), 'APP:usesR:CREATE', 'APP:usesR:CREATE',
        'Create permission for the usesr in the app', 1, 'STAFF');
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                        descript, permission_group_id, uses)
VALUES (2, now(), now(), 'APP:usesR:DELETE', 'APP:usesR:DELETE',
        'Delete permission for the usesr in the app', 1, 'STAFF');
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                        descript, permission_group_id, uses)
VALUES (3, now(), now(), 'APP:usesR:READ', 'APP:usesR:READ',
        'View permission for the usesr in the app',
        1, 'STAFF');
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                        descript, permission_group_id, uses)
VALUES (4, now(), now(), 'APP:usesR:UPDATE', 'APP:usesR:UPDATE',
        'Update permission for the usesr in the app', 1, 'STAFF');


-- TODO data for web_usesr -- pass is hash of pass
INSERT INTO web_usesr (web_id, date_created, date_updated, first_name, last_name, email,
                      usesr_name, pass)
VALUES (1, now(), now(), 'Support', 'usesr', 'admin@TEST01.com', 'admin@TEST01.com',
        '$2a$10$CkQY8PpSb2tvPHnAnXb3ju00RZec4ivvrfSilQLywJFs2PYqWqAu6');

-- TODO data for web_usesr_role
INSERT INTO web_usesr_role (web_id, date_created, date_updated, web_usesr_id, role_id)
VALUES (1, now(), now(), 1, 3);