/*------------------------------------------
            Addon By GayToz
----------------BLUR-----------------------*/

local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)
    for i = 1, 3 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

/*------------------------------------------
                 FONTS
------------------------------------------*/

surface.CreateFont( "GTContext_Title", {   font = "Roboto",    size = 50,  weight = 500,   blursize = 0,   scanlines = 0,  antialias = true,} )
surface.CreateFont( "GTContext_TextBase", {   font = "Roboto",    size = 35,  weight = 500,   blursize = 0,   scanlines = 0,  antialias = true,} )
surface.CreateFont( "GTContext_Info", {   font = "Roboto",    size = 25,  weight = 500,   blursize = 0,   scanlines = 0,  antialias = true,} )
surface.CreateFont( "GTContext_Money", {   font = "Roboto",    size = 25,  weight = 500,   blursize = 0,   scanlines = 0,  antialias = true,} )

/*------------------------------------------
                 Frame
------------------------------------------*/

local langue = GTContext.choice

local color = GTContext.colorchoice

hook.Add("OnContextMenuOpen","GTContext_MenuOpen",function()
    gui.EnableScreenClicker(true)

    ContextMenu = vgui.Create("DFrame")
    ContextMenu:SetTitle("")
    ContextMenu:SetSize(500,600)
    ContextMenu:SetPos( ScrW() * 0.610, ScrH() * 0.100 )
    ContextMenu:ShowCloseButton(false)
    ContextMenu:SetDraggable(false)
    ContextMenu:MakePopup()
    ContextMenu.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        draw.RoundedBox(0, ScrW() * 0.010, ScrH() * 0.020, 470, 50, GTContext.style[color].color2)
        draw.DrawText(GTContext.TextServer, "GTContext_Title", ScrW() * 0.110, ScrH() * 0.020, Color(255, 255, 255, 255))
        draw.RoundedBox(0, ScrW() * 0.010, ScrH() * 0.100, 470, 30, GTContext.style[color].color2)
        draw.DrawText(GTContext.lang[langue].txt1, "GTContext_TextBase", ScrW() * 0.125, ScrH() * 0.093, Color(255, 255, 255, 255))
        draw.RoundedBox(0, ScrW() * 0.010, ScrH() * 0.450, 470, 30, GTContext.style[color].color2)
        draw.DrawText(GTContext.lang[langue].txt8, "GTContext_TextBase", ScrW() * 0.125, ScrH() * 0.447, Color(255, 255, 255, 255))
    end

    local CallAdmin4 = vgui.Create( "DButton", ContextMenu )
    CallAdmin4:SetText( GTContext.lang[langue].txt13 )
    CallAdmin4:SetPos( ScrW() * 0.008, ScrH() * 0.410 )
    CallAdmin4:SetSize( 475, 25 )
    CallAdmin4:SetTextColor(Color(255,255,255))
    CallAdmin4:SetFont("Trebuchet24")

    CallAdmin4.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
    end

    CallAdmin4.DoClick = function()
        RunConsoleCommand( "say", "/// "..GTContext.lang[langue].txt15 )
    end

    local AreaButton = vgui.Create("DPanel", ContextMenu)
    AreaButton:Dock(TOP)
    AreaButton:SetSize(0,180)
    AreaButton:DockMargin(5,90,5,5)

    AreaButton.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
    end

    local Scroll = vgui.Create( "DScrollPanel", AreaButton )
    Scroll:Dock( FILL )
    local sbar = Scroll:GetVBar()
    function sbar:Paint( w, h )
        draw.RoundedBox( 0, 0, 0, w, h, GTContext.style[color].color6 )
    end
    function sbar.btnUp:Paint( w, h )
        draw.RoundedBox( 0, 0, 0, w, h, GTContext.style[color].color6 )
    end
    function sbar.btnDown:Paint( w, h )
        draw.RoundedBox( 0, 0, 0, w, h, GTContext.style[color].color6 )
    end
    function sbar.btnGrip:Paint( w, h )
        draw.RoundedBox( 0, 0, 0, w, h, GTContext.style[color].color5 )
    end

    local List = vgui.Create( "DIconLayout", Scroll )
    List:Dock( FILL )
    List:SetSpaceY( 7 ) 
    List:SetSpaceX( 5 )

    local DropMoney = vgui.Create( "DButton", List )
    DropMoney:SetText( GTContext.lang[langue].txt2 )
    DropMoney:SetPos( ScrW() * 0.100, ScrH() * 0.850 )
    DropMoney:SetSize( 475, 35 )
    DropMoney:SetTextColor(Color(255,255,255))
    DropMoney:SetFont("Trebuchet24")

    DropMoney.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    DropMoney.DoClick = function()
        local Menu_DropMoney = vgui.Create("DFrame")
        Menu_DropMoney:SetTitle("")
        Menu_DropMoney:SetSize(380,125)
        Menu_DropMoney:Center()
        Menu_DropMoney:ShowCloseButton(true)
        Menu_DropMoney:SetDraggable(false)
        Menu_DropMoney:MakePopup()
        Menu_DropMoney.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.DrawText(GTContext.lang[langue].txt16, "GTContext_Money", ScrW() * 0.0, ScrH() * 0.028, Color(255, 255, 255, 255))
        end

        local TextEntry = vgui.Create( "DTextEntry", Menu_DropMoney ) -- create the form as a child of frame
        TextEntry:SetPos( ScrW() * 0.005, ScrH() * 0.080 )
        TextEntry:SetSize( 370, 55 )
        TextEntry:SetFont("GTContext_TextBase")
        TextEntry:SetText( "" )

        TextEntry.OnEnter = function( self )
            RunConsoleCommand( "say", "/dropmoney "..TextEntry:GetValue() )
            Menu_DropMoney:Close()
        end
    end

    local GiveMoney = vgui.Create( "DButton", List )
    GiveMoney:SetText( GTContext.lang[langue].txt3 )
    GiveMoney:SetPos( ScrW() * 0.100, ScrH() * 0.850 )
    GiveMoney:SetSize( 475, 35 )
    GiveMoney:SetTextColor(Color(255,255,255))
    GiveMoney:SetFont("Trebuchet24")

    GiveMoney.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    GiveMoney.DoClick = function()
        local Menu_GiveMoney = vgui.Create("DFrame")
        Menu_GiveMoney:SetTitle("")
        Menu_GiveMoney:SetSize(380,125)
        Menu_GiveMoney:Center()
        Menu_GiveMoney:ShowCloseButton(true)
        Menu_GiveMoney:SetDraggable(false)
        Menu_GiveMoney:MakePopup()
        Menu_GiveMoney.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.DrawText(GTContext.lang[langue].txt17, "GTContext_Money", ScrW() * 0.0, ScrH() * 0.028, Color(255, 255, 255, 255))
        end

        local TextEntry = vgui.Create( "DTextEntry", Menu_GiveMoney ) -- create the form as a child of frame
        TextEntry:SetPos( ScrW() * 0.005, ScrH() * 0.080 )
        TextEntry:SetSize( 370, 55 )
        TextEntry:SetFont("GTContext_TextBase")
        TextEntry:SetText( "" )
        TextEntry.OnEnter = function( self )
            RunConsoleCommand( "say", "/give "..TextEntry:GetValue() )
            Menu_GiveMoney:Close()
        end
    end

    local DropWeapon = vgui.Create( "DButton", List )
    DropWeapon:SetText( GTContext.lang[langue].txt4 )
    DropWeapon:SetPos( ScrW() * 0.100, ScrH() * 0.850 )
    DropWeapon:SetSize( 475, 35 )
    DropWeapon:SetTextColor(Color(255,255,255))
    DropWeapon:SetFont("Trebuchet24")

    DropWeapon.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    DropWeapon.DoClick = function()
        RunConsoleCommand( "say", "/dropweapon " )
    end

    local Sleep = vgui.Create( "DButton", List )
    Sleep:SetText( GTContext.lang[langue].txt5 )
    Sleep:SetPos( ScrW() * 0.100, ScrH() * 0.850 )
    Sleep:SetSize( 475, 35 )
    Sleep:SetTextColor(Color(255,255,255))
    Sleep:SetFont("Trebuchet24")

    Sleep.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    Sleep.DoClick = function()
        RunConsoleCommand( "say", "/sleep " )
    end

/*------------------------------------------
            BUTTON POLICE
------------------------------------------*/
if (table.HasValue(GTContext.JobPolice , team.GetName(LocalPlayer():Team()))) then
    local Warrant = vgui.Create( "DButton", List )
    Warrant:SetText( GTContext.lang[langue].txt19 )
    Warrant:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    Warrant:SetSize( 475, 35 )
    Warrant:SetFont("Trebuchet24")
    Warrant:SetTextColor(Color(255,255,255))

    Warrant.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    Warrant.DoClick = function()

        local Wanted_Player = vgui.Create("DFrame")
        Wanted_Player:SetTitle(GTContext.lang[langue].txt19)
        Wanted_Player:SetSize(380,125)
        Wanted_Player:Center()
        Wanted_Player:ShowCloseButton(true)
        Wanted_Player:SetDraggable(false)
        Wanted_Player:MakePopup()

        Wanted_Player.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        end

        local TextEntry4 = vgui.Create( "DTextEntry", Wanted_Player ) -- create the form as a child of frame
        TextEntry4:SetPos( ScrW() * 0.005, ScrH() * 0.030 )
        TextEntry4:SetSize( 170, 55 )
        TextEntry4:SetFont("GTContext_TextBase")
        TextEntry4:SetText( GTContext.lang[langue].txt9 )

        local TextEntry5 = vgui.Create( "DTextEntry", Wanted_Player ) -- create the form as a child of frame
        TextEntry5:SetPos( ScrW() * 0.135, ScrH() * 0.030 )
        TextEntry5:SetSize( 190, 55 )
        TextEntry5:SetFont("GTContext_TextBase")
        TextEntry5:SetText( GTContext.lang[langue].txt14 )

        local Accept = vgui.Create( "DButton", Wanted_Player )
        Accept:SetText( GTContext.lang[langue].txt21 )
        Accept:SetPos( ScrW()* 0.010, ScrH()* 0.110 )
        Accept:SetSize( 350, 35 )
        Accept:SetFont("Trebuchet24")
        Accept:SetTextColor(Color(255,255,255))

        Accept.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(66, 70, 80, 255))
        draw.RoundedBox(0, 0, 0, w, 30, Color(66, 70, 80, 255))
        end

        Accept.DoClick = function()
            RunConsoleCommand( "say", "/wanted "..TextEntry4:GetValue().." "..TextEntry5:GetValue())
            Wanted_Player:Close()
        end
    end

    local UnWanted = vgui.Create( "DButton", List )
    UnWanted:SetText( GTContext.lang[langue].txt20 )
    UnWanted:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    UnWanted:SetSize( 475, 35 )
    UnWanted:SetFont("Trebuchet24")
    UnWanted:SetTextColor(Color(255,255,255))

    UnWanted.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    UnWanted.DoClick = function()

        local UnWanted_Player = vgui.Create("DFrame")
        UnWanted_Player:SetTitle(GTContext.lang[langue].txt20)
        UnWanted_Player:SetSize(400,125)
        UnWanted_Player:Center()
        UnWanted_Player:ShowCloseButton(true)
        UnWanted_Player:SetDraggable(false)
        UnWanted_Player:MakePopup()

        UnWanted_Player.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        end

        local TextEntry6 = vgui.Create( "DTextEntry", UnWanted_Player ) -- create the form as a child of frame
        TextEntry6:SetPos( ScrW() * 0.010, ScrH() * 0.040 )
        TextEntry6:SetSize( 365, 40 )
        TextEntry6:SetFont("GTContext_TextBase")
        TextEntry6:SetText( GTContext.lang[langue].txt9 )

        local Accept1 = vgui.Create( "DButton", UnWanted_Player )
        Accept1:SetText( GTContext.lang[langue].txt21 )
        Accept1:SetPos( ScrW()* 0.010, ScrH()* 0.110 )
        Accept1:SetSize( 365, 35 )
        Accept1:SetFont("Trebuchet24")
        Accept1:SetTextColor(Color(255,255,255))

        Accept1.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
        end

        Accept1.DoClick = function()
            RunConsoleCommand( "say", "/unwanted "..TextEntry6:GetValue())
            UnWanted_Player:Close()
        end 
    end

    local Warrant = vgui.Create( "DButton", List )
    Warrant:SetText( GTContext.lang[langue].txt22 )
    Warrant:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    Warrant:SetSize( 475, 35 )
    Warrant:SetFont("Trebuchet24")
    Warrant:SetTextColor(Color(255,255,255))

    Warrant.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    Warrant.DoClick = function()

        local Warrant_Player = vgui.Create("DFrame")
        Warrant_Player:SetTitle(GTContext.lang[langue].txt22)
        Warrant_Player:SetSize(380,125)
        Warrant_Player:Center()
        Warrant_Player:ShowCloseButton(true)
        Warrant_Player:SetDraggable(false)
        Warrant_Player:MakePopup()

        Warrant_Player.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        end

        local TextEntry = vgui.Create( "DTextEntry", Warrant_Player ) -- create the form as a child of frame
        TextEntry:SetPos( ScrW() * 0.005, ScrH() * 0.030 )
        TextEntry:SetSize( 170, 55 )
        TextEntry:SetFont("GTContext_TextBase")
        TextEntry:SetText( GTContext.lang[langue].txt9 )

        local TextEntry2 = vgui.Create( "DTextEntry", Warrant_Player ) -- create the form as a child of frame
        TextEntry2:SetPos( ScrW() * 0.135, ScrH() * 0.030 )
        TextEntry2:SetSize( 190, 55 )
        TextEntry2:SetFont("GTContext_TextBase")
        TextEntry2:SetText( GTContext.lang[langue].txt14 )

        local Accept = vgui.Create( "DButton", Warrant_Player )
        Accept:SetText( GTContext.lang[langue].txt21 )
        Accept:SetPos( ScrW()* 0.010, ScrH()* 0.110 )
        Accept:SetSize( 350, 35 )
        Accept:SetFont("Trebuchet24")
        Accept:SetTextColor(Color(255,255,255))

        Accept.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
        end

        Accept.DoClick = function()
            RunConsoleCommand( "say", "/warrant "..TextEntry:GetValue().." "..TextEntry2:GetValue())
            Warrant_Player:Close()
        end
    end

    local UnWarrant = vgui.Create( "DButton", List )
    UnWarrant:SetText( GTContext.lang[langue].txt23 )
    UnWarrant:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    UnWarrant:SetSize( 475, 35 )
    UnWarrant:SetFont("Trebuchet24")
    UnWarrant:SetTextColor(Color(255,255,255))

    UnWarrant.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    UnWarrant.DoClick = function()

        local UnWarrant_Player = vgui.Create("DFrame")
        UnWarrant_Player:SetTitle(GTContext.lang[langue].txt23)
        UnWarrant_Player:SetSize(400,125)
        UnWarrant_Player:Center()
        UnWarrant_Player:ShowCloseButton(true)
        UnWarrant_Player:SetDraggable(false)
        UnWarrant_Player:MakePopup()

        UnWarrant_Player.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        end

        local TextEntry3 = vgui.Create( "DTextEntry", UnWarrant_Player ) -- create the form as a child of frame
        TextEntry3:SetPos( ScrW() * 0.010, ScrH() * 0.040 )
        TextEntry3:SetSize( 365, 40 )
        TextEntry3:SetFont("GTContext_TextBase")
        TextEntry3:SetText( GTContext.lang[langue].txt9 )

        local Accept1 = vgui.Create( "DButton", UnWarrant_Player )
        Accept1:SetText( GTContext.lang[langue].txt21 )
        Accept1:SetPos( ScrW()* 0.010, ScrH()* 0.110 )
        Accept1:SetSize( 365, 35 )
        Accept1:SetFont("Trebuchet24")
        Accept1:SetTextColor(Color(255,255,255))

        Accept1.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
        end

        Accept1.DoClick = function()
            RunConsoleCommand( "say", "/unwarrant "..TextEntry3:GetValue())
            UnWarrant_Player:Close()
        end
    end
end

    if team.GetName(LocalPlayer():Team()) == GTContext.JobMayor then

    local LawTab = vgui.Create( "DButton", List )
    LawTab:SetText( GTContext.lang[langue].txt24 )
    LawTab:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    LawTab:SetSize( 475, 35 )
    LawTab:SetFont("Trebuchet24")
    LawTab:SetTextColor(Color(255,255,255))

    LawTab.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    LawTab.DoClick = function()
    RunConsoleCommand( "say", "/placelaws" )
    end

    local AddLaw = vgui.Create( "DButton", List )
    AddLaw:SetText( GTContext.lang[langue].txt25 )
    AddLaw:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    AddLaw:SetSize( 475, 35 )
    AddLaw:SetFont("Trebuchet24")
    AddLaw:SetTextColor(Color(255,255,255))

    AddLaw.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    AddLaw.DoClick = function()
        local LawAdd = vgui.Create("DFrame")
        LawAdd:SetTitle(GTContext.lang[langue].txt25)
        LawAdd:SetSize(400,125)
        LawAdd:Center()
        LawAdd:ShowCloseButton(true)
        LawAdd:SetDraggable(false)
        LawAdd:MakePopup()
        LawAdd.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        end

        local TextEntry7 = vgui.Create( "DTextEntry", LawAdd ) -- create the form as a child of frame
        TextEntry7:SetPos( ScrW() * 0.010, ScrH() * 0.040 )
        TextEntry7:SetSize( 365, 40 )
        TextEntry7:SetFont("GTContext_TextBase")
        TextEntry7:SetText( "" )

        local Accept35 = vgui.Create( "DButton", LawAdd )
        Accept35:SetText( GTContext.lang[langue].txt21 )
        Accept35:SetPos( ScrW()* 0.010, ScrH()* 0.110 )
        Accept35:SetSize( 365, 35 )
        Accept35:SetFont("Trebuchet24")
        Accept35:SetTextColor(Color(255,255,255))

        Accept35.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
        end

        Accept35.DoClick = function()
            RunConsoleCommand( "say", "/addlaw "..TextEntry7:GetValue())
            LawAdd:Close()
        end 
    end

    local DltLaw = vgui.Create( "DButton", List )
    DltLaw:SetText( GTContext.lang[langue].txt26 )
    DltLaw:SetPos( ScrW()* 0.100, ScrH()* 0.850 )
    DltLaw:SetSize( 475, 35 )
    DltLaw:SetFont("Trebuchet24")
    DltLaw:SetTextColor(Color(255,255,255))

    DltLaw.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    DltLaw.DoClick = function()
        local LawDlt = vgui.Create("DFrame")
        LawDlt:SetTitle(GTContext.lang[langue].txt26)
        LawDlt:SetSize(400,125)
        LawDlt:Center()
        LawDlt:ShowCloseButton(true)
        LawDlt:SetDraggable(false)
        LawDlt:MakePopup()
        LawDlt.Paint = function(self, w, h)
            DrawBlur(self, 2)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
            draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color1)
        end

        local TextEntry8 = vgui.Create( "DTextEntry", LawDlt ) -- create the form as a child of frame
        TextEntry8:SetPos( ScrW() * 0.010, ScrH() * 0.040 )
        TextEntry8:SetSize( 365, 40 )
        TextEntry8:SetFont("GTContext_TextBase")
        TextEntry8:SetText( GTContext.lang[langue].txt27 )

        local Accept36 = vgui.Create( "DButton", LawDlt )
        Accept36:SetText( GTContext.lang[langue].txt21 )
        Accept36:SetPos( ScrW()* 0.010, ScrH()* 0.110 )
        Accept36:SetSize( 365, 35 )
        Accept36:SetFont("Trebuchet24")
        Accept36:SetTextColor(Color(255,255,255))

        Accept36.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color3)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color3)
        end

        Accept36.DoClick = function()
            RunConsoleCommand( "say", "/removelaw "..TextEntry8:GetValue())
            LawDlt:Close()
        end
    end
end

if GTContext.ShowDiscord == true then
    local Discord = vgui.Create( "DButton", List )
    Discord:SetText( GTContext.lang[langue].txt6 )
    Discord:SetPos( ScrW() * 0.100, ScrH() * 0.850 )
    Discord:SetSize( 475, 35 )
    Discord:SetTextColor(Color(255,255,255))
    Discord:SetFont("Trebuchet24")

    Discord.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    Discord.DoClick = function()
        gui.OpenURL(GTContext.LinkDiscord)
    end
end
if GTContext.ShowWebsite == true then
    local Forum = vgui.Create( "DButton", List )
    Forum:SetText( GTContext.lang[langue].txt7 )
    Forum:SetPos( ScrW() * 0.100, ScrH() * 0.850 )
    Forum:SetSize( 475, 35 )
    Forum:SetTextColor(Color(255,255,255))
    Forum:SetFont("Trebuchet24")

    Forum.Paint = function(self, w, h)
    DrawBlur(self, 2)
    draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color4)
    draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color4)
    end

    Forum.DoClick = function()
        gui.OpenURL(GTContext.LinkWebsite)
    end
end
/*------------------------------------------
                 INFOS
------------------------------------------*/

    local GTContext_InfoPanel = vgui.Create("DPanel", ContextMenu)
    GTContext_InfoPanel:SetPos(ScrW() * 0.005, ScrH() * 0.500)
    GTContext_InfoPanel:SetSize(485,200)
    GTContext_InfoPanel.Paint = function(self, w, h)
        DrawBlur(self, 2)
        draw.RoundedBox(0, 0, 0, w, h, GTContext.style[color].color5)
        draw.RoundedBox(0, 0, 0, w, 30, GTContext.style[color].color5)
        draw.DrawText(GTContext.lang[langue].txt9.." :                      "..LocalPlayer():Name(), "GTContext_Info", ScrW() * 0.110, ScrH() * 0.020, Color(255, 255, 255, 255))
        draw.DrawText(GTContext.lang[langue].txt10.." :                  "..team.GetName(LocalPlayer():Team()), "GTContext_Info", ScrW() * 0.110, ScrH() * 0.060, Color(255, 255, 255, 255))
        draw.DrawText(GTContext.lang[langue].txt11.." :                  "..DarkRP.formatMoney(LocalPlayer():getDarkRPVar("money")), "GTContext_Info", ScrW() * 0.110, ScrH() * 0.100, Color(255, 255, 255, 255))
        draw.DrawText(GTContext.lang[langue].txt12.." :                  "..DarkRP.formatMoney(LocalPlayer():getDarkRPVar("salary")), "GTContext_Info", ScrW() * 0.110, ScrH() * 0.140, Color(255, 255, 255, 255))
    end

    local GTContext_Mdl = vgui.Create( "DModelPanel", GTContext_InfoPanel )
    GTContext_Mdl:SetPos(ScrW() * -0.030, ScrH() * -0.040)
    GTContext_Mdl:SetSize( 230, 230 )
    GTContext_Mdl:SetModel( LocalPlayer():GetModel() )
    function GTContext_Mdl:LayoutEntity( Entity ) return end
end)

hook.Add("OnContextMenuClose","GTMenuClose",function()
    gui.EnableScreenClicker(false)
    ContextMenu:Close()
end)
