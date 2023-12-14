if (CLIENT) then
    
surface.CreateFont( "Location Font", {
    font = "Default", 
    extended = true,
    size = 13,
    weight = 700,


} )





    local background = vgui.Create( "DPanel" )
background:SetPos( 1750, 30 ) -- Set the position of the panel
background:SetSize( 140, 40 ) 
background:SetBackgroundColor(Color(0,0,0))

local spawnccl = vgui.Create( "DLabel", background )
spawnccl:SetPos( 10, 20 ) -- Set the position of the label
spawnccl:SetText( "Area Clearance Level:" ) --  Set the text of the label
spawnccl:SetTextColor(Color(249,215,28))
spawnccl:SizeToContents() -- Size the label to fit the text in it
spawnccl:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one

local spawncl = vgui.Create( "DLabel", background )
spawncl:SetPos( 120, 20 ) -- Set the position of the label
spawncl:SetText("0") --  Set the text of the label
spawncl:SetTextColor(Color(249,215,28))
spawncl:SizeToContents() -- Size the label to fit the text in it
spawncl:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one

local spawnlo = vgui.Create( "DLabel", background )
spawnlo:SetPos( 10, 6 ) -- Set the position of the label
spawnlo:SetText( "Location:" ) --  Set the text of the label
spawnlo:SetTextColor(Color(249,215,28))
spawnlo:SizeToContents() -- Size the label to fit the text in it
spawnlo:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one

local spawnloc = vgui.Create( "DLabel", background )
spawnloc:SetPos( 60, 6 ) -- Set the position of the label
spawnloc:SetAutoStretchVertical(true)
spawnloc:SetWrap( false )
spawnloc:SetFont("Location Font")
spawnloc:SetText("Hallway") --  Set the text of the label
spawnloc:SetTextColor(Color(249,215,28))
spawnloc:SizeToContents() -- Size the label to fit the text in it
spawnloc:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one

 
 
hook.Add("PostDrawTranslucentRenderables", "TestPlayerInBox", function()

    --The box coordinates
    local boxStart  = Vector( 1119, 895, 63 )
    local boxEnd    = Vector( 656, -896, -144 )

    --The coordinate to test (the player position)
    local testCoord = LocalPlayer():GetPos()

    --- if player in
    local col = Color(255, 0, 0)
    if (testCoord:WithinAABox( boxStart, boxEnd )) then
        spawncl:SetText("4") --  Set the text of the label
        spawnloc:SetText("Bridge")
        col = Color(0, 255, 0)
    end

    --Draw the box
    render.DrawWireframeBox(Vector(0,0,0), Angle(0,0,0), boxStart, boxEnd, col, true)

end)

hook.Add("PostDrawTranslucentRenderables", "f", function()

    local boxStart1  = Vector(-1023.9688110352, -1025.8229980469, 237.01739501953 )
    local boxEnd1    = Vector( 703.96862792969, -1922.5369873047, -152.26443481445 )

    --The coordinate to test (the player position)
    local testCoord1 = LocalPlayer():GetPos()

    --- if player in
    local col1 = Color(255, 0, 0)
    if (testCoord1:WithinAABox( boxStart1, boxEnd1 )) then
        spawncl:SetText("2") --  Set the text of the label
        spawnloc:SetText("Loading")
        col1 = Color(0, 255, 0)
    end

    --Draw the box
    render.DrawWireframeBox(Vector(0,0,0), Angle(0,0,0), boxStart1, boxEnd1, col1, true)


end)

end