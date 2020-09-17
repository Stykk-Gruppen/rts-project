with NRF52_DK.IOs;
with NRF52_DK.Time;
with VehicleController;

procedure Main is
   frontWheelsPin : constant NRF52_DK.IOs.Pin_Id := 1;
   rearWheelsPin : constant NRF52_DK.IOs.Pin_Id := 2;
begin

   VehicleController.Init(frontWheelsPin, rearWheelsPin);

   loop

      for i in NRF52_DK.IOs.Pin_Id loop
         NRF52_DK.IOs.Set (i, True);
      end loop;

      --  Wait 500 milliseconds
      NRF52_DK.Time.Delay_Ms (500);

      --  Turn off the LED connected to pin 17
      for i in NRF52_DK.IOs.Pin_Id loop
         NRF52_DK.IOs.Set (i, False);
      end loop;

      --  Wait 500 milliseconds
      NRF52_DK.Time.Delay_Ms (500);
   end loop;
end Main;
