DECLARE
    i NUMBER := 1;
    name VARCHAR2(20) := 'kim';
    sal NUMBER := 0;
BEGIN
    WHILE i<=1000000 LOOP
        if i mod 2 = 0 then
             name :='kim'|| to_char(i);
             sal := 300;
        ELSIF i mod 3 = 0 then
            name :='park'|| to_char(i);
             sal := 400;
        ELSIF i mod 5 = 0 then
            name :='hong'|| to_char(i);
             sal := 500;
        ELSE 
            name :='shin'|| to_char(i);
             sal := 250;
        END IF;
        INSERT INTO emp3 VALUES(i, name, sal);
        i := i+1;
    end loop;
END;