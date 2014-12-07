
SET foreign_key_checks = 0;

DROP TABLE if exists node;
CREATE TABLE node (
  n_uuid        varchar(37) not null,
  model         varchar(10),
  owner_email   varchar(30) not null, 
  primary key (n_uuid)
);


DROP TABLE if exists event;
CREATE TABLE event (
  id            char(9) not null, 
  event_name    varchar(25),
  date_time     datetime,
  descr         varchar(50),
  primary key (id),
  foreign key (event_name, date_time) references event_nt(event_name, date_time)
);


DROP TABLE if exists detected_at_by;
CREATE TABLE detected_at_by (
  ep_UUID      varchar(37) not null,
  event_id     char(9) not null,
  n_uuid       varchar(37) not null,
  start_time   datetime,
  end_time     datetime,
  primary key (ep_UUID, event_id, n_uuid),
  foreign key (ep_UUID) references end_point(ep_UUID)
);


DROP TABLE if exists end_point;
CREATE TABLE end_point (
  ep_UUID       varchar(37) not null,
  email         varchar(30) not null, 
  primary key (ep_UUID,email),
  foreign key (email) references user(email)
);


DROP TABLE if exists user;
CREATE TABLE user (
  email           varchar(30) not null,
  name            varchar(15),
  role            varchar(15),
  password        varchar(15),
  phone           varchar(13),
  primary key (email)
);
