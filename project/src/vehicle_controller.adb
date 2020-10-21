with Distance_Sensor_Controller;
with Servo_Controller;
with Ada.Real_Time; use Ada.Real_Time;
with Arduino_Nano_33_Ble_Sense.IOs;

package body Vehicle_Controller is

   -------------
   -- Compute --
   -------------

   task body Compute is
      Time_Now : Ada.Real_Time.Time;
      Current_Direction : Direction;
      Previous_Direction : Direction;
   begin
      Current_Direction := Forward;
      Set_Velocity (1.0);
      loop
         if Distance_Sensor_Controller.Dispenser.Value < 20.0 then
            Status_Light_Colour := Blue;
            Previous_Direction := Current_Direction;
            Current_Direction := Stop;
            Set_Velocity (0.0);

            Time_Now := Ada.Real_Time.Clock;
            delay until Time_Now + Ada.Real_Time.Milliseconds(1000);

            Activate_Dispenser;

            Time_Now := Ada.Real_Time.Clock;
            delay until Time_Now + Ada.Real_Time.Milliseconds(1000);
         elsif Distance_Sensor_Controller.Front.Value < 20.0 and Distance_Sensor_Controller.Back.Value < 20.0 then
            Set_Velocity (0.0);
            Current_Direction := Stop;
            Status_Light_Colour := Red;
         elsif Distance_Sensor_Controller.Front.Value < 20.0 then
            Status_Light_Colour := Green;
            Set_Velocity (-1.0);
            Current_Direction := Backward;
         elsif  Distance_Sensor_Controller.Back.Value < 20.0 then
            Status_Light_Colour := Green;
            Set_Velocity (1.0);
            Current_Direction := Forward;
         else
            if Current_Direction = Stop then
               case Previous_Direction is
                  when Forward =>
                     Set_Velocity (1.0);
                  when Backward =>
                     Set_Velocity (-1.0);
                  when Stop =>
                     Set_Velocity (1.0);
                     Previous_Direction := Forward;
               end case;
               Current_Direction := Previous_Direction;
            end if;
         end if;

      end loop;
   end Compute;

   ------------------
   -- Status_Light --
   ------------------

   task body Status_Light is
      Time_Now : Ada.Real_Time.Time;
   begin
      loop
         Time_Now := Ada.Real_Time.Clock;
         case Status_Light_Colour is
            when Red =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(200);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (24, True);
            when Green =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(200);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (16, True);
            when Blue =>
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (6, False);
               delay until Time_Now + Ada.Real_Time.Milliseconds(200);
               Arduino_Nano_33_Ble_Sense.IOs.DigitalWrite (6, True);
         end case;
         Time_Now := Ada.Real_Time.Clock;
         delay until Time_Now + Ada.Real_Time.Milliseconds(200);

      end loop;
   end Status_Light;

   ------------------
   -- Set_Velocity --
   ------------------

   procedure Set_Velocity (Velocity : Float) is
      Rpm : Servo_Controller.Rpm_Range;
   begin
      Rpm := Integer((60.0 * Velocity) / (2.0 * Wheel_Radius * 3.0));
      Servo_Controller.Engine_Servo.Rpm := Rpm;
   end Set_Velocity;

   ------------------------
   -- Set_Steering_Angle --
   ------------------------

   procedure Set_Steering_Angle (Angle : Steering_Angle) is
   begin
      case Angle is
         when Straight =>
            Servo_Controller.Steering_Servo.Angle := 0;
         when Left =>
            Servo_Controller.Steering_Servo.Angle := -15;
         when Hard_Left =>
            Servo_Controller.Steering_Servo.Angle := -30;
         when Right =>
            Servo_Controller.Steering_Servo.Angle := 15;
         when Hard_Right =>
            Servo_Controller.Steering_Servo.Angle := 30;
      end case;
   end Set_Steering_Angle;

   ------------------------
   -- Activate_Dispenser --
   ------------------------

   procedure Activate_Dispenser is
      Time_Now : Ada.Real_Time.Time;
   begin
      Servo_Controller.Dispenser_Servo_Left.Angle := 90;
      Servo_Controller.Dispenser_Servo_Right.Angle := -90;

      Time_Now := Ada.Real_Time.Clock;
      delay until Time_Now + Ada.Real_Time.Milliseconds(1000);

      Servo_Controller.Dispenser_Servo_Left.Angle := -90;
      Servo_Controller.Dispenser_Servo_Right.Angle := 90;

   end Activate_Dispenser;

end Vehicle_Controller;
