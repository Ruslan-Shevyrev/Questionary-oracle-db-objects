CREATE TABLE QUESTIONARY_ANSWER_TYPE
(ID 		NUMBER, 
 NAME		VARCHAR2(100) NOT NULL);

ALTER TABLE QUESTIONARY_ANSWER_TYPE ADD CONSTRAINT QUESTIONARY_ANSWER_TYPE_PK PRIMARY KEY (ID);
ALTER TABLE QUESTIONARY_ANSWER_TYPE ADD CONSTRAINT QUESTIONARY_ANSWER_TYPE_UK UNIQUE (NAME);

CREATE SEQUENCE SEQ_QUESTIONARY_ANSWER_TYPE
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE TRIGGER TRG_QUESTIONARY_ANSWER_TYPE_I_U
	before update or insert
		ON QUESTIONARY_ANSWER_TYPE
	for each row
begin
    IF(inserting) THEN
		:NEW.id := SEQ_QUESTIONARY_ANSWER_TYPE.nextval;
    END IF;
   
    IF(updating) THEN
		IF :NEW.id <> :OLD.id THEN 
			raise_application_error(-20555, 'Can`t change id');
		END IF;
    END IF; 
end;
/