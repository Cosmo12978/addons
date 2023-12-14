delay = 0
net.Receive( "airleftintank", function()
if CurTime() < delay then return end	
 airtank = net.ReadFloat()
delay = CurTime() + .1
end)

hook.Add("HUDPaint", "airbar", function()
local scrw,scrh = ScrW(), ScrH()
local boxW = scrw * .1
local boxH = scrh * .02
surface.SetDrawColor(0,0,0,200)
surface.DrawRect(scrw /2 - boxW /2, scrh - boxH *1.1, boxW, boxH)
surface.SetDrawColor(3, 236, 252,200)
surface.DrawRect(scrw /2 - boxW /2, scrh - boxH *1.1, boxW*(airtank/100), boxH)


	surface.SetFont( "Default" )
	surface.SetTextColor( 255, 255, 255 )
	surface.SetTextPos( scrw /2 - boxW /12, scrh - boxH *1, boxW, boxH) 
	surface.DrawText( "AirTank" )

end)
