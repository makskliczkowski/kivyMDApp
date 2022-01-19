DELIMITER $$
CREATE TRIGGER IF NOT EXISTS before_new_log
BEFORE INSERT
ON log FOR EACH ROW
BEGIN
IF NOT EXISTS (SELECT 1 FROM places WHERE places.id = NEW.place) THEN
    INSERT INTO places (NAME,address)
    VALUES ('RandomPlace', 'RandomAddress');
END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER IF NOT EXISTS before_new_shopping
BEFORE INSERT
ON shopping FOR EACH ROW
BEGIN
	IF NOT EXISTS (SELECT 1 FROM log WHERE log.id = NEW.purchase_id) THEN
	    INSERT INTO log (place,time)
	    VALUES (13, 13);
	END IF;
	IF NEW.groceries_id IS NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM groceries WHERE groceries.id = NEW.groceries_id) THEN
		    INSERT INTO groceries (name)
		    VALUES ('guanciale');
		END IF;
	END IF;
	
	IF NEW.stuff_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM stuff WHERE stuff.id = NEW.stuff_id) THEN
		    INSERT INTO stuff (name)
		    VALUES ('hammer');
		END IF;
	END IF;
	IF NEW.party_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM party WHERE party.id = NEW.party_id) THEN
		    INSERT INTO party (type)
		    VALUES ('PAAAAARTTYYYY!');
		END IF;
	END IF;
	IF NEW.transport_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM transport WHERE transport.id = NEW.transport_id) THEN
		    INSERT INTO transport (type)
		    VALUES ('some_vehicle');
		END IF;
	END IF;

	IF NEW.health_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM health WHERE health.id = NEW.health_id) THEN
		    INSERT INTO health (type)
		    VALUES ('some_medical_stuff');
		END IF;
	END IF;
END$$    
DELIMITER ;

DELIMITER $$
CREATE TRIGGER IF NOT EXISTS before_delete_log
BEFORE DELETE
ON log FOR EACH ROW
BEGIN
DELETE FROM shopping WHERE shopping.purchase_id=OLD.id;
END$$    
DELIMITER ;