DELIMITER //

CREATE PROCEDURE LoopWithIterate()
BEGIN
    DECLARE counter INT DEFAULT 0;

    my_loop: LOOP
        -- Povećaj brojač
        SET counter = counter + 1;

        -- Preskoči parne brojeve
        IF counter % 2 = 0 THEN
            ITERATE my_loop;
        END IF;

        -- Ispis neparnih brojeva
        SELECT counter;

        -- Prekini petlju kada brojač dostigne 10
        IF counter >= 10 THEN
            LEAVE my_loop;
        END IF;
    END LOOP my_loop;
END //

DELIMITER ;

-- Poziv procedure
CALL LoopWithIterate();