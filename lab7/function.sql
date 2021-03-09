CREATE OR REPLACE FUNCTION get_address()
RETURNS TABLE(address VARCHAR(50)) AS
$$
BEGIN
RETURN QUERY
SELECT address.address FROM address
WHERE address.address LIKE '%11%' AND address.city_id>400 AND address.city_id<600;
END; 
$$
LANGUAGE plpgsql;
