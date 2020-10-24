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
   begin
      Time_Now := Ada.Real_Time.Clock;
      delay until Time_Now + Ada.Real_Time.Milliseconds(1000);
      loop
         --Next state logic
         if Distance_Sensor_Controller.Front.Value < Stop_Distance_Front and Distance_Sensor_Controller.Back.Value < Stop_Distance_Back then
            Next_Direction := Stop;
            null;
         elsif Distance_Sensor_Controller.Front.Value < Stop_Distance_Front then
            Next_Direction := Backward;
         elsif  Distance_Sensor_Controller.Back.Value < Stop_Distance_Back then
            Next_Direction := Forward;
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
            if Current_Direction /= Backward then
               Status_Light_Colour := Yellow;
               Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Backward;
               Time_Now := Ada.Real_Time.Clock;
               delay until Time_Now + Ada.Real_Time.Milliseconds(200);
               Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Stop;
               Time_Now := Ada.Real_Time.Clock;
               delay until Time_Now + Ada.Real_Time.Milliseconds(600);
            end if;
            Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Backward;
            Status_Light_Colour := Blue;
         when Stop =>
            Servo_Controller.Engine_Servo.Current_Direction := Servo_Controller.Stop;
            Status_Light_Colour := Red;
         when Braking =>
            -- It will never end up here.
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
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, False);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(100);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, True);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, True);
         end case;
         Time_Now := Ada.Real_Time.Clock;
         delay until Time_Now + Ada.Real_Time.Milliseconds(100);
      end loop;
   end Status_Light;

end Vehicle_Controller;
