CREATE TABLE role
(
    web_id       INT                     NOT NULL,
    version      INT       DEFAULT 0     NOT NULL,
    date_created TIMESTAMP DEFAULT NOW() NOT NULL,
    date_updated TIMESTAMP DEFAULT NOW() NOT NULL,
    external_key VARCHAR(255)            NOT NULL,
    role_code    VARCHAR(255),
    title        VARCHAR(255)            NOT NULL,
    description  VARCHAR(255),
    use       TEXT,
    active       boolean   default true

);

create table if not exists permission_group
(
    web_id        INT                     not null,
    version       INT       default 0     not null,
    date_created  TIMESTAMP default now() not null,
    date_updated  TIMESTAMP default now() not null,
    description      VARCHAR(255)            not null,
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
    description           varchar(255)            not null,
    permission_group_id INT,
    use                text,
    active             boolean   default true
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
create table IF NOT EXISTS web_user
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
    user_name    varchar(255),
    password         varchar(255),
    gender       int,
    dob          timestamp,
    active        boolean   default true,
    middle_name  varchar(255),
    time_zone    timestamp,
    language        varchar(255)
);
create table IF NOT EXISTS web_user_role
(
    web_id       INT                     not null,
    version      INT       default 0     not null,
    date_created timestamp default now() not null,
    date_updated timestamp default now() not null,
    web_user_id  INT,
    role_id      INT                     not null,
    active        boolean   default true
);
create table IF NOT EXISTS web_user_permission
(
    web_id        INT                     not null,
    version       integer   default 0     not null,
    date_created  timestamp default now() not null,
    date_updated  timestamp default now() not null,
    web_user_id   INT,
    permission_id INT                     not null,
    activ         boolean   default true
);
create table IF NOT EXISTS web_user_permission_group
(
    web_id              INT                     not null,
    version             INT       default 0     not null,
    date_created        timestamp default now() not null,
    date_updated        timestamp default now() not null,
    web_user_id         INT,
    permission_id       INT,
    permission_group_id INT                     not null,
    permission          varchar(20),
    active               boolean   default true
);


# INSERT 




INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (1, now(), now(), 'ROLE_USER', null, 'Customer User',
        'User for a customer', 'CUSTOMER');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (2, now(), now(), 'ROLE_TEST_X', null,
        'Test X', 'Test X', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (3, now(), now(), 'ROLE_SUPER_ADMIN', null,
        'Super Admin', 'Super Admin', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (4, now(), now(), 'ROLE_STAFF', null, 'Staff',
        'Client staff', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (5, now(), now(), 'ROLE_X', null, 'X',
        'APP X - Needs to be updated', 'STAFF');
INSERT INTO role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (6, now(), now(), 'ROLE_SUPPORT', null, 'support', 'support',
        'STAFF');

-- TODO data for permission_group
INSERT INTO permission_group (web_id, date_created, date_updated, description,
                                     group_code, parent_web_id)
VALUES (1, now(), now(), 'Admin Settings', 'ADMIN_SETTING', null);

-- TODO data for permission
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (1, now(), now(), 'APP:USER:CREATE', 'APP:USER:CREATE',
        'Create permission for the user in the app', 1, 'STAFF');
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (2, now(), now(), 'APP:USER:DELETE', 'APP:USER:DELETE',
        'Delete permission for the user in the app', 1, 'STAFF');
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (3, now(), now(), 'APP:USER:READ', 'APP:USER:READ',
        'View permission for the user in the app',
        1, 'STAFF');
INSERT INTO permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (4, now(), now(), 'APP:USER:UPDATE', 'APP:USER:UPDATE',
        'Update permission for the user in the app', 1, 'STAFF');


-- TODO data for web_user -- password is hash of password
INSERT INTO web_user (web_id, date_created, date_updated, first_name, last_name, email,
                             user_name, password)
VALUES (1, now(), now(), 'Support', 'User', 'admin@TEST01.com', 'admin@TEST01.com',
        '$2a$10$CkQY8PpSb2tvPHnAnXb3ju00RZec4ivvrfSilQLywJFs2PYqWqAu6');

-- TODO data for web_user_role
INSERT INTO web_user_role (web_id, date_created, date_updated, web_user_id, role_id)
VALUES (1, now(), now(), 1, 3);