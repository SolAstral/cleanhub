local foodEnabled = false

local autofarm = false

coroutine.wrap(function()
    while wait() do
        if foodEnabled then
			local ohInstance1 = workspace.GameMap.Ferns.Fern
			local ohNumber2 = 5
			workspace.GameEvents.EatPlant:FireServer(ohInstance1, ohNumber2)
        end;
    end;
end)();

coroutine.wrap(function()
    while wait(0.5) do
        if autofarm then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(207.851, 265.187, -911.327))
        end;
    end;
end)();

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local function DinosaurSimulator()

local win = lib:Window("Dinosaur Simulator",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightShift)

local tab = win:Tab("Functions")

tab:Toggle("Inf Jump", false, function(value)
	_G.InfJump = value
    if _G.InfJump then
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        Mouse.KeyDown:connect(function(k)
            if _G.InfJump then
                if k:byte() == 32 then
                    Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    Humanoid:ChangeState("Jumping")
                    wait(0.1)
                    Humanoid:ChangeState("Seated")
                end;
            end;
        end);
    end;
end);

tab:Toggle("Inf Food", false, function(value)
    foodEnabled = value
end);

tab:Button("Inf Oxygen", function()
	game.Players.LocalPlayer.Character.CharacterScripts.UnderWater:Remove()
	lib:Notification("Granted", "Infinite Oxygen", "Ok")
end);

tab:Slider("Walkspeed",0,300,16, function(value)
game.Players.LocalPlayer.Character.Dinosaur.WalkSpeed = value
end);

tab:Toggle("Auto-Farm", false, function(value)
   autofarm = value
end);
   game:GetService("Players").LocalPlayer.Idled:connect(function()
       if autofarm then
   local vu = game:GetService("VirtualUser")
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   end;
end);

local tab = win:Tab("PVP")

tab:Button("Semi-God", function()
game.Players.LocalPlayer.Character.Stats.Armor:Remove()
lib:Notification("Granted", "Semi-God Mode", "Ok")
end);

tab:Button("Click TP", function()
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V) then return end
if not Mouse.Target then return end
Plr.Character:MoveTo(Mouse.Hit.p)
lib:Notification("Granted", "V + Click anywhere to teleport.", "Ok")
end);

local tab = win:Tab("Misc")

tab:Toggle("Jesus", false, function(value)
if value then
    game.Workspace.GameMap.Water.Water.CanCollide = true
else
    game.Workspace.GameMap.Water.Water.CanCollide = false
end;
end);

tab:Button("Anti-Afk", function()
   local vu = game:GetService("VirtualUser")
   game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end);
end);

end);
end
