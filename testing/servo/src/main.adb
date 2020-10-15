with Arduino_Nano_33_Ble_Sense.Servo; use Arduino_Nano_33_Ble_Sense.Servo;
with Arduino_Nano_33_Ble_Sense.IOs; use Arduino_Nano_33_Ble_Sense.Servo;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is

subtype Servo_Pin_Id is Arduino_Nano_33_Ble_Sense.IOs.Pin_Id range 3 .. 4;
   type Servo_Pin_State (Active : Boolean := False) is record
      case Active is
         when True => Setpoint : Servo_Set_Point;
         when False => null;
      end case;
   end record;
   type Servo_Pin_Array is array (Servo_Pin_Id) of Servo_Pin_State;

   Servo_Pins, Cur_Servo_Pins : Servo_Pin_Array := (others => (Active => False));
   Starting : Boolean := True;
   TimeNow : Ada.Real_Time.Time := Ada.Real_Time.Clock;
begin
   loop

      Servo_Pins := (3 => (Active => True, Setpoint => 0),
                        4 => (Active => True, Setpoint => 180));


      --  Update PWM pulse size

      if Starting then -- or else Cur_Servo_Pins /= Servo_Pins then
         Starting := False;
         for J in Servo_Pins'Range loop
            if Servo_Pins (J).Active then
               Go (J, Servo_Pins (J).Setpoint);
            else
               Stop (J);
            end if;
         end loop;
         Cur_Servo_Pins := Servo_Pins;
      end if;

      TimeNow := Ada.Real_Time.Clock;
      delay until TimeNow + Ada.Real_Time.Milliseconds(20);

   end loop;
end Main;
