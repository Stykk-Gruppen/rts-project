with Distance_Sensor_Controller;
with Ada.Real_Time; use Ada.Real_Time;
with Arduino_Nano_33_Ble_Sense.IOs;
with Servo_Controller;

package body Vehicle_Controller is

   -------------
   -- Compute --
   -------------

   task body Compute is
      Time_Now : Ada.Real_Time.Time;
      Front_Blocked : Boolean;
      Back_Blocked : Boolean;
   begin
      Time_Now := Ada.Real_Time.Clock;
      delay until Time_Now + Ada.Real_Time.Milliseconds(1000);
      loop
         Front_Blocked := Distance_Sensor_Controller.Front.Value < Stop_Distance_Front;
         Back_Blocked := Distance_Sensor_Controller.Back.Value < Stop_Distance_Back;

         --Check braking before sensors, can only enter Stop after braking.
         if Current_Direction = Braking then
            Next_Direction := Stop;
            --If both sensors are blocked, stop, or brake if moving forward.
         elsif Front_Blocked and Back_Blocked then
            if Current_Direction = Forward then
               Next_Direction := Braking;
            else
               Next_Direction := Stop;
            end if;
            --If only front is blocked, reverse, or brake if moving forward.
         elsif Front_Blocked then
             if Current_Direction = Forward then
               Next_Direction := Braking;
            else
               Next_Direction := Backward;
            end if;
            --If only back is blocked, go forward, or stop if reversing.
         elsif  Back_Blocked then
             if Current_Direction = Backward then
               Next_Direction := Stop;
            else
               Next_Direction := Forward;
            end if;
            --Default direction if stopped and both sensors are ok is forward.
         else
            if Current_Direction = Stop then
               Next_Direction := Forward;
            else
               Next_Direction := Current_Direction;
            end if;
         end if;

         Change_Direction;
         Time_Now := Ada.Real_Time.Clock;
         delay until Time_Now + Ada.Real_Time.Milliseconds(200);

      end loop;
   end Compute;

   ----------------------
   -- Change_Direction --
   ----------------------

   procedure Change_Direction is
      Time_Now : Ada.Real_Time.Time;
   begin
      case Next_Direction is
         when Forward =>
            Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Forward;
            Status_Light_Colour := Green;
         when Backward =>
            Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Backward;
            Status_Light_Colour := Blue;
         when Stop =>
            Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Stop;
            Time_Now := Ada.Real_Time.Clock;
            delay until Time_Now + Ada.Real_Time.Milliseconds(600);
            Status_Light_Colour := Red;
         when Braking =>
            Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Backward;
            Time_Now := Ada.Real_Time.Clock;
            delay until Time_Now + Ada.Real_Time.Milliseconds(200);
            Status_Light_Colour := Yellow;
         end case;
         Current_Direction := Next_Direction;

   end Change_Direction;

   ------------------
   -- Status_Light --
   ------------------

   task body Status_Light is
      Time_Now : Ada.Real_Time.Time;
   begin
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, True);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, True);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (6, True);
      Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (13, False);
      loop
         Time_Now := Ada.Real_Time.Clock;
         case Status_Light_Colour is
            when Red =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(100);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, True);
            when Green =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(100);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, True);
            when Blue =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (6, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(100);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (6, True);
            when Yellow =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (13, True);
               delay until Time_Now + Ada.Real_Time.Milliseconds(100);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (13, False);
         end case;
         Time_Now := Ada.Real_Time.Clock;
         delay until Time_Now + Ada.Real_Time.Milliseconds(100);
      end loop;
   end Status_Light;

end Vehicle_Controller;
