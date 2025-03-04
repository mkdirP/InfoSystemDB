CREATE OR REPLACE FUNCTION check_order_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id > 100 THEN
        NEW.status = 'High Value';
    ELSE
        NEW.status = 'Regular';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_order_status
BEFORE INSERT ON "order"
FOR EACH ROW
EXECUTE FUNCTION check_order_status();
