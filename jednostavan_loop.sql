DELIMITER //

CREATE PROCEDURE SimpleLoop()
BEGIN
    DECLARE counter INT DEFAULT 1;

    my_loop: LOOP
        -- Ispis trenutne vrijednosti brojača
        SELECT counter;

        -- Povećaj brojač
        SET counter = counter + 1;

        -- Prekini petlju kada brojač dostigne 5
        IF counter > 5 THEN
            LEAVE my_loop;
        END IF;
    END LOOP my_loop;
END //

DELIMITER ;

-- Poziv procedure