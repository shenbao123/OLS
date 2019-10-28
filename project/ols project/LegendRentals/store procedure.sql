create or replace PROCEDURE RESERVE_VEHICLE(
    pmodel IN VARCHAR2,
    psuccess OUT NUMBER
)
IS
BEGIN
    UPDATE RENTAL_CAR SET customer_id = (select user from dual) where customer_id is null AND vehicle_model = pmodel AND ROWNUM < 2;
    IF SQL%ROWCOUNT = 1 THEN
        psuccess := 1;
    ELSE
      RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    psuccess := 0;
END;
