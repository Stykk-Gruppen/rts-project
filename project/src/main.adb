with Arduino_Nano_33_Ble_Sense.IOs;
with Arduino_Nano_33_Ble_Sense.Time;
with VehicleController;
with HCSR04;

procedure Main is
   package Arduino renames Arduino_Nano_33_Ble_Sense;

   frontWheelsPin : constant Arduino.IOs.Pin_Id := 1;
   rearWheelsPin : constant Arduino.IOs.Pin_Id := 2;
begin

   VehicleController.Init(frontWheelsPin, rearWheelsPin);

   loop

      for i in Arduino.IOs.Pin_Id loop
         Arduino.IOs.DigitalWrite (i, True);
      end loop;

      --  Wait 500 milliseconds
      Arduino.Time.Delay_Ms (500);


      --  Turn off the LED connected to pin 17
      for i in Arduino.IOs.Pin_Id loop
         Arduino.IOs.DigitalWrite (i, False);
      end loop;

      --  Wait 500 milliseconds
      Arduino.Time.Delay_Ms (500);
   end loop;
end Main;
