alter table mdsMSH change dateTime dateTime datetime NOT NULL;
alter table waitingListName change `create_date` `create_date` datetime NOT NULL;
alter table waitingList change `onListSince` `onListSince` datetime NOT NULL;
alter table fileUploadCheck change `date_time` `date_time` datetime NOT NULL;
alter table caisi_role change `update_date` update_date datetime NOT NULL;
alter table casemgmt_issue change `update_date` update_date datetime NOT NULL;
alter table room_demographic change assign_start assign_start date;
alter table room_demographic change assign_end assign_end date;
alter table room_bed change assign_start assign_start date;
alter table room_bed change assign_end assign_end date;
alter table programSignature change updateDate updateDate datetime;
