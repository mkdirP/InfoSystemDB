CREATE OR REPLACE FUNCTION generate_unique_id() RETURNS INTEGER AS $$
DECLARE
    new_id INTEGER;
BEGIN
    SELECT MAX(id) + 1 INTO new_id FROM "login0";
    IF new_id IS NULL THEN
        new_id := 1;
    END IF;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;
-- 用户注册
CREATE OR REPLACE FUNCTION register(name_u VARCHAR(64), password_u VARCHAR(256)) 
RETURNS SETOF "client" AS $$
DECLARE
    new_id INT;
BEGIN
    new_id := generate_unique_id();
    INSERT INTO "client" (id, name) VALUES (new_id, name_u);
    INSERT INTO "login0" (id, client_id, code) VALUES (new_id, new_id, password_u);
    RETURN QUERY SELECT * FROM "client" WHERE id = new_id;
END;
$$ LANGUAGE plpgsql;

--    查看所有订单状态
CREATE OR REPLACE FUNCTION view_order_status() 
RETURNS TABLE (status TEXT) AS $$
BEGIN
    RETURN QUERY 
    SELECT "order".status FROM "order";
END;
$$ LANGUAGE plpgsql;

-- 订单支付
CREATE OR REPLACE FUNCTION generate_unique_id_order() RETURNS INTEGER AS $$
DECLARE
    new_id INTEGER;
BEGIN
    SELECT MAX(id) + 1 INTO new_id FROM "order";
    IF new_id IS NULL THEN
        new_id := 1;
    END IF;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION pay(empolyee_id integer,client_id integer,storehouse_id integer,status text)
RETURNS SETOF "order" AS $$
DECLARE
    new_id INT;
BEGIN
    new_id := generate_unique_id_order();
    INSERT INTO "order" (id,empolyee_id,client_id,storehouse_id,status) VALUES (new_id, empolyee_id,client_id,storehouse_id,status);
    RETURN QUERY SELECT * FROM "order" WHERE id = new_id;
END;
$$ LANGUAGE plpgsql;
