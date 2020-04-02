set serveroutput on echo on timing on

DECLARE
  lc_trials CONSTANT NUMBER := 1000;

  TYPE faces IS TABLE OF NUMBER;

  la_reference     faces := faces(1,2,3,4,5,6);

  la_current_faces faces;
  la_new_faces     faces;
  la_scratch       faces;

  lv_distinct_values          NUMBER;
  lv_iterations               NUMBER;
  lv_iterations_running_total NUMBER := 0;

BEGIN
  dice.disable_dice_logging;

  FOR i IN 1 .. lc_trials
  LOOP

    /* init new trial */
    la_current_faces := la_reference;
    la_new_faces     := la_reference;
    lv_distinct_values := 6;
    lv_iterations      := 0;

    /* start trial */
    WHILE lv_distinct_values > 1 
    LOOP
  
      FOR j IN la_new_faces.FIRST .. la_new_faces.LAST 
      LOOP 
        la_new_faces(j) := la_current_faces(dice.roll_1d6);
      END LOOP;  --assign die faces

      la_scratch := la_new_faces MULTISET INTERSECT DISTINCT la_reference;
      lv_distinct_values := la_scratch.COUNT;

      la_current_faces := la_new_faces;
      lv_iterations := lv_iterations + 1;
    
    END LOOP;  --individual trial

    lv_iterations_running_total := lv_iterations_running_total + lv_iterations;

  END LOOP;  --trials

  dbms_output.put_line(to_char(lc_trials) || ' trials');
  dbms_output.put_line(to_char(lv_iterations_running_total) || ' iterations across all trials');
  dbms_output.put_line('Average ' || to_char(ROUND(lv_iterations_running_total/lc_trials, 2)) || 
                       ' iterations per trial.');

END;
/

exit

