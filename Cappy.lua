local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function safeDestroy(name)
    local g = playerGui:FindFirstChild(name)
    if g then g:Destroy() end
end
safeDestroy("AutoTypingOverlay")
safeDestroy("CAPPYBARA")
safeDestroy("KeySystem")

local KeySystem = Instance.new("ScreenGui")
KeySystem.Name = "KeySystem"
KeySystem.Parent = CoreGui
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Parent = KeySystem
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Size = UDim2.new(0, 310, 0, 170)
Frame.Position = UDim2.new(0.5, -155, 0.5, -85)
Frame.ZIndex = 0

local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = Frame
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 130, 238))
})
UIGradient.Rotation = 90

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 12)

local Frame_2 = Instance.new("Frame")
Frame_2.Parent = KeySystem
Frame_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame_2.Size = UDim2.new(0, 300, 0, 160)
Frame_2.Position = UDim2.new(0.5, -150, 0.5, -80)
Frame_2.ZIndex = 1
Frame_2.Active = true
Frame_2.Draggable = false

local UICorner_2 = Instance.new("UICorner")
UICorner_2.Parent = Frame_2
UICorner_2.CornerRadius = UDim.new(0, 10)

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Frame_2
UIStroke.Color = Color3.fromRGB(100, 100, 100)
UIStroke.Thickness = 2

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = Frame_2
TitleLabel.Text = "CAPPYBARA Hub - Key Premium"
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 18
TitleLabel.ZIndex = 2

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame_2
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 16
CloseButton.ZIndex = 2

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = CloseButton
CloseCorner.CornerRadius = UDim.new(0, 5)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    }):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    }):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    KeySystem:Destroy()
end)

local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame_2
TextBox.PlaceholderText = "Nhập key tại đây..."
TextBox.Text = ""
TextBox.Size = UDim2.new(0.9, 0, 0, 35)
TextBox.Position = UDim2.new(0.05, 0, 0.25, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 14
TextBox.ZIndex = 2

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.Parent = TextBox
TextBoxCorner.CornerRadius = UDim.new(0, 5)

local CheckKey = Instance.new("TextButton")
CheckKey.Parent = Frame_2
CheckKey.Text = "Check Key"
CheckKey.Size = UDim2.new(0.4, 0, 0, 30)
CheckKey.Position = UDim2.new(0.05, 0, 0.65, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(80, 170, 80)
CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKey.Font = Enum.Font.SourceSansBold
CheckKey.TextSize = 14
CheckKey.ZIndex = 2

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.Parent = CheckKey
CheckKeyCorner.CornerRadius = UDim.new(0, 5)

CheckKey.MouseEnter:Connect(function()
    TweenService:Create(CheckKey, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    }):Play()
end)

CheckKey.MouseLeave:Connect(function()
    TweenService:Create(CheckKey, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(80, 170, 80)
    }):Play()
end)

local LinkGetKey = Instance.new("TextButton")
LinkGetKey.Parent = Frame_2
LinkGetKey.Text = "Get Key"
LinkGetKey.Size = UDim2.new(0.4, 0, 0, 30)
LinkGetKey.Position = UDim2.new(0.55, 0, 0.65, 0)
LinkGetKey.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
LinkGetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
LinkGetKey.Font = Enum.Font.SourceSansBold
LinkGetKey.TextSize = 14
LinkGetKey.ZIndex = 2

local LinkCorner = Instance.new("UICorner")
LinkCorner.Parent = LinkGetKey
LinkCorner.CornerRadius = UDim.new(0, 5)

LinkGetKey.MouseEnter:Connect(function()
    TweenService:Create(LinkGetKey, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(120, 120, 255)
    }):Play()
end)

LinkGetKey.MouseLeave:Connect(function()
    TweenService:Create(LinkGetKey, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    }):Play()
end)

LinkGetKey.MouseButton1Click:Connect(function()
    setclipboard("https://link4m.org/VHhzeq")
    StarterGui:SetCore("SendNotification", {
        Text = "Dán link lên trình duyệt để lấy key!",
        Title = "Đã copy link",
        Duration = 4
    })
end)

local function LoadMainScript()
    KeySystem:Destroy()
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "AutoTypingOverlay"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 0
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1,0,1,0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(0,255,0)
    textLabel.Font = Enum.Font.Code
    textLabel.TextSize = 20
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center
    textLabel.Text = "CAPPYBARA LOADING..."
    textLabel.Parent = bg

    task.delay(0.5, function()
        TweenService:Create(bg, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
        TweenService:Create(textLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
        task.delay(0.35, function()
            if gui and gui.Parent then gui:Destroy() end
        end)
    end)

    local SupportedExecutors = {
        "Synapse X", "Krnl", "ProtoSmasher", "Fluxus", "Script-Ware",
        "EasyExploits", "Electron", "JJSploit", "Calamari", "SirHurt",
        "Sentinel", "WEAREDEVS", "Comet", "Cellery", "Wave",
        "CODex", "Delta", "Medium", "Solara", "Xeno", "Vega X",
        "Hydrogen", "Oxygen U", "Nova", "Astral", "Ronix", "Elysian",
        "Astra", "Eclipse", "Lunar", "Zenox", "Storm", "Vortex", "Phantom"
    }
    _G.SupportedExecutors = SupportedExecutors

    local identity = syn and "Synapse X" or krnl and "Krnl" or proto and "ProtoSmasher" or fluxus and "Fluxus" or
        scriptware and "Script-Ware" or easyexploits and "EasyExploits" or electron and "Electron" or jjsploit and "JJSploit" or
        calamari and "Calamari" or sirlapu and "SirHurt" or sentinel and "Sentinel" or wearedevs and "WEAREDEVS" or
        comet and "Comet" or celery and "Cellery" or wave and "Wave" or codex and "CODex" or delta and "Delta" or
        medium and "Medium" or solara and "Solara" or xeno and "Xeno" or "Unknown"
    _G.CurrentExecutor = identity

    local function AntiDisconnect267()
        pcall(function()
            local originalKick = Players.Kick
            local originalPlayerKick = player.Kick
            Players.Kick = function(plr, msg)
                if msg and (string.find(msg, "267") or string.find(msg, "Kicked") or string.find(msg, "disconnect")) then
                    return
                end
                if originalKick then return originalKick(plr, msg) end
            end
            player.Kick = function(plr, msg)
                if msg and (string.find(msg, "267") or string.find(msg, "Kicked") or string.find(msg, "disconnect")) then
                    return
                end
                if originalPlayerKick then return originalPlayerKick(plr, msg) end
            end
            task.spawn(function()
                while task.wait(10) do
                    pcall(function()
                        if not getgc then return end
                        for _, v in pairs(getgc(true)) do
                            if type(v) == "function" then
                                local info = debug and debug.info and debug.info(v, "S")
                                if info and (string.find(info, "Kick") or string.find(info, "267") or string.find(info, "disconnect")) then
                                    pcall(function()
                                        debug.setconstant(v, 1, "AntiDisconnectBlocked_267")
                                        debug.setconstant(v, 2, "AntiDisconnectBlocked_267")
                                    end)
                                end
                            end
                        end
                    end)
                end
            end)
            if game:GetService("NetworkClient") and game:GetService("NetworkClient").Kick then
                local oldNetworkKick = game:GetService("NetworkClient").Kick
                game:GetService("NetworkClient").Kick = function(self, msg)
                    if msg and (string.find(msg, "267") or string.find(msg, "Kicked")) then
                        return
                    end
                    return oldNetworkKick(self, msg)
                end
            end
            for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                    local oldFire = remote.FireServer
                    if oldFire then
                        remote.FireServer = function(self, ...)
                            local args = {...}
                            for _, arg in ipairs(args) do
                                if type(arg) == "string" and (string.find(arg, "267") or string.find(arg, "kick")) then
                                    return
                                end
                            end
                            return oldFire(self, ...)
                        end
                    end
                end
            end
            if game:GetService("TeleportService") and game:GetService("TeleportService").Teleport then
                local oldTeleport = game:GetService("TeleportService").Teleport
                game:GetService("TeleportService").Teleport = function(...)
                    return
                end
            end
        end)
    end
    pcall(AntiDisconnect267)

    local Blacklist = {
        ["Hungdocdao"] = true, ["ToiLaThanhTuan"] = true, ["BinTranDev"] = true, ["akatobi2"] = true,
        ["akatobi1"] = true, ["Yellowmeomeo"] = true, ["akatobi6"] = true, ["phanphuday1"] = true,
        ["Luyengmaxx"] = true, ["luyengmax"] = true, ["b1722b"] = true, ["Moonne0909"] = true,
        ["MiniBT71"] = true, ["kookoomy2"] = true, ["KOL_akadata"] = true
    }

    local function KickBlacklistedPlayers()
        for _, plr in ipairs(Players:GetPlayers()) do
            if Blacklist[plr.Name] then
                pcall(function() plr:Kick("Ban da bi kick khoi server vi nam trong blacklist") end)
            end
        end
    end
    pcall(KickBlacklistedPlayers)
    Players.PlayerAdded:Connect(function(plr)
        if Blacklist[plr.Name] then
            pcall(function() plr:Kick("Ban da bi kick khoi server vi nam trong blacklist") end)
        end
    end)

    repeat task.wait() until game:IsLoaded()

    -- ============================================================
-- NEW FLUENT CUSTOM UI
-- Existing feature/logic code is kept below this UI layer.
-- ============================================================
local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/FluentCustom.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/Addons/InterfaceManager.luau"))()

-- Keep the original variable name so existing callbacks continue to work.
local Fluent = Library

local Window = Library:CreateWindow({
    Title = "CAPPYBARA HUB",
    SubTitle = "Version 5.2 • Custom UI",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 380),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

pcall(function()
    SaveManager:SetLibrary(Library)
    if SaveManager.SetFolder then
        SaveManager:SetFolder("CAPPYBARA_HUB")
    end
end)

pcall(function()
    InterfaceManager:SetLibrary(Library)
    if InterfaceManager.SetFolder then
        InterfaceManager:SetFolder("CAPPYBARA_HUB")
    end
end)

local HubScreenGui = Instance.new("ScreenGui")
HubScreenGui.Name = "CAPPYBARA_MenuButton"
HubScreenGui.ResetOnSpawn = false
HubScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
    HubScreenGui.Parent = CoreGui
end)
if not HubScreenGui.Parent then
    HubScreenGui.Parent = playerGui
end

    local ImageButton = Instance.new("ImageButton")
    ImageButton.Parent = HubScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton.BorderSizePixel = 0
    ImageButton.Position = UDim2.new(0.106, 0, 0.162, 0)
    ImageButton.Size = UDim2.new(0, 50, 0, 50)
    ImageButton.Draggable = true
    ImageButton.Image = "http://www.roblox.com/asset/?id=88198148103261"

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 10)
    UICorner.Parent = ImageButton

    local GreenStroke = Instance.new("UIStroke")
    GreenStroke.Thickness = 3
    GreenStroke.Color = Color3.fromRGB(0, 255, 0)
    GreenStroke.Parent = ImageButton
    ImageButton.MouseButton1Click:Connect(function()
        pcall(function()
            Window:Minimize()
        end)
    end)

-- ==========================================================
-- CAPPYBARA PVP - PLAYER HEALTH ESP
-- ==========================================================

local CAPPYHealthESPEnabled = false
local CAPPYHealthConnections = {}

local function CAPPYRemoveHealthESP(plr)
    if not plr or not plr.Character then return end
    local head = plr.Character:FindFirstChild("Head")
    if not head then return end
    local old = head:FindFirstChild("CAPPYBARA_HealthESP")
    if old then old:Destroy() end
end

local function CAPPYCreateHealthESP(plr)
    if not CAPPYHealthESPEnabled or plr == player then return end
    local char = plr.Character
    local head = char and char:FindFirstChild("Head")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not head or not hum then return end

    CAPPYRemoveHealthESP(plr)

    local gui = Instance.new("BillboardGui")
    gui.Name = "CAPPYBARA_HealthESP"
    gui.Size = UDim2.fromOffset(155, 48)
    gui.StudsOffset = Vector3.new(0, 3.25, 0)
    gui.AlwaysOnTop = true
    gui.MaxDistance = 1000
    gui.Parent = head

    local name = Instance.new("TextLabel")
    name.BackgroundTransparency = 1
    name.Size = UDim2.new(1, 0, 0, 18)
    name.Font = Enum.Font.GothamBold
    name.TextSize = 13
    name.Text = plr.DisplayName
    name.TextColor3 = Color3.fromRGB(255,255,255)
    name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    name.TextStrokeTransparency = 0.15
    name.Parent = gui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 0, 13)
    bg.Position = UDim2.new(0, 0, 0, 23)
    bg.BackgroundColor3 = Color3.fromRGB(8,8,8)
    bg.BorderSizePixel = 0
    bg.ClipsDescendants = true
    bg.Parent = gui

    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(1,0)
    bgCorner.Parent = bg

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1,0,1,0)
    bar.BackgroundColor3 = Color3.fromRGB(0,220,90)
    bar.BorderSizePixel = 0
    bar.Parent = bg

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1,0)
    barCorner.Parent = bar

    local hp = Instance.new("TextLabel")
    hp.BackgroundTransparency = 1
    hp.Size = UDim2.new(1,0,1,0)
    hp.Font = Enum.Font.GothamBold
    hp.TextSize = 9
    hp.TextColor3 = Color3.fromRGB(255,255,255)
    hp.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    hp.TextStrokeTransparency = 0.2
    hp.ZIndex = 2
    hp.Parent = bg

    local function update()
        if not gui.Parent or not hum.Parent then return end
        local maxHP = math.max(hum.MaxHealth, 1)
        local currentHP = math.clamp(hum.Health, 0, maxHP)
        local percent = currentHP / maxHP

        bar:TweenSize(UDim2.new(percent,0,1,0),
            Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.12, true)

        hp.Text = string.format("%d / %d", math.floor(currentHP), math.floor(maxHP))

        if percent <= 0.30 then
            bar.BackgroundColor3 = Color3.fromRGB(255,55,55)
        elseif percent <= 0.60 then
            bar.BackgroundColor3 = Color3.fromRGB(255,190,40)
        else
            bar.BackgroundColor3 = Color3.fromRGB(0,220,90)
        end
    end

    hum.HealthChanged:Connect(update)
    hum:GetPropertyChangedSignal("MaxHealth"):Connect(update)
    update()
end

local function CAPPYSetupHealthPlayer(plr)
    if plr == player then return end
    if CAPPYHealthConnections[plr] then
        CAPPYHealthConnections[plr]:Disconnect()
    end

    CAPPYHealthConnections[plr] = plr.CharacterAdded:Connect(function()
        if CAPPYHealthESPEnabled then
            task.wait(0.5)
            CAPPYCreateHealthESP(plr)
        end
    end)

    if CAPPYHealthESPEnabled then
        task.defer(function() CAPPYCreateHealthESP(plr) end)
    end
end

for _, plr in ipairs(Players:GetPlayers()) do
    CAPPYSetupHealthPlayer(plr)
end

Players.PlayerAdded:Connect(CAPPYSetupHealthPlayer)

Players.PlayerRemoving:Connect(function(plr)
    CAPPYRemoveHealthESP(plr)
    if CAPPYHealthConnections[plr] then
        CAPPYHealthConnections[plr]:Disconnect()
        CAPPYHealthConnections[plr] = nil
    end
end)



    local Tabs = {
        Main1 = Window:AddTab({Title = "Thong Tin & Main", Icon = "home"}),
        Main2 = Window:AddTab({Title = "Farm Level", Icon = "trending-up"}),
        Main3 = Window:AddTab({Title = "Farm Tien", Icon = "dollar-sign"}),
        Main4 = Window:AddTab({Title = "Farm Su Kien", Icon = "star"}),
        Main5 = Window:AddTab({Title = "Farm Boss", Icon = "swords"}),
        Main6 = Window:AddTab({Title = "PVP Combat", Icon = "target"}),
        Main7 = Window:AddTab({Title = "Fix Lag", Icon = "cpu"}),
        Main8 = Window:AddTab({Title = "Config", Icon = "settings"}),
        Main9 = Window:AddTab({Title = "Auto Kick", Icon = "user-x"}),
        Main10 = Window:AddTab({Title = "Auto Heal", Icon = "package"}),
        Main11 = Window:AddTab({Title = "Xe Bay", Icon = "plane"})
    }

    _G.AutoFarmLevel = false
    _G.NpcDistance = 18.2
    _G.NpcSpeed = 0.05
    _G.AutoLootEnabled = false
    _G.AutoFarmChua = false
    _G.AntiAFKEnabled = false
    _G.AutoFarmBanhMi = false
    _G.AutoFarmBenhVien = false
    _G.AutoFarmCaoSu = false
    _G.AutoFarmChotCongAn = false
    _G.AutoFarmSuKien = false
    _G.AutoFarmMatOng = false
    _G.TeleportToBoss = false
    _G.BossMode = "A"
    _G.AutoFarmBossCircle = false
    _G.AutoAimBossNoCam = false
    _G.ShowHealthEnabled = false
    _G.PvpAutoAttack = false
    _G.AutoBandageEnabled = false
    _G.AutoBuyHeal = false
    _G.FreecamEnabled = false
    _G.PvpAimNoCamActive = false
    _G.PvpHitboxActive = false
    _G.PvpSpinActive = false
    _G.PvpSpeedActive = false
    _G.PvpJumpActive = false
    _G.PvpHealthActive = false
    _G.FPSBoostState = false
    _G.Reduce20State = false
    _G.Reduce40State = false
    _G.Reduce60State = false
    _G.Reduce100State = false
    _G.ClearEverythingState = false
    _G.AutoReviveEnabled = false
    _G.AutoTakeReviveEnabled = false
    _G.AutoKickEnabled = false
    _G.AutoKickDistance = 15
    _G.AutoKickCooldown = 5
    _G.AutoHealEnabled = false
    _G.AutoBuyHealEnabled = false
    _G.HealThreshold = 80
    _G.NhatVatPham = false
    _G.Settings = {TargetName = "CityNPC", DashDist = 18.2, Speed = 0.05}

    local REVIVE_TARGET_POS = Vector3.new(791.07, 19.51, -392.51)

    local function hasDeadAnim(character)
        for _, v in ipairs(character:GetDescendants()) do
            if string.lower(v.Name) == "deadanim" then return true end
        end
        return false
    end

    local function stepTeleport(targetPos)
        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local distance = (targetPos - hrp.Position).Magnitude
        while distance > 5 and (_G.AutoReviveEnabled or _G.AutoTakeReviveEnabled) do
            local currentChar = player.Character
            if not currentChar then break end
            local currentHRP = currentChar:FindFirstChild("HumanoidRootPart")
            if not currentHRP then break end
            local dir = (targetPos - currentHRP.Position).Unit
            currentHRP.CFrame = currentHRP.CFrame + dir * math.min(18, distance)
            task.wait(0.01)
            distance = (targetPos - currentHRP.Position).Magnitude
        end
        if (_G.AutoReviveEnabled or _G.AutoTakeReviveEnabled) and char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(targetPos)
        end
    end

    task.spawn(function()
        while task.wait(0.1) do
            if _G.AutoReviveEnabled then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= player and plr.Character and hasDeadAnim(plr.Character) then
                        local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart")
                        if targetHRP then
                            stepTeleport(targetHRP.Position + Vector3.new(0, 2, 0))
                            break
                        end
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.3) do
            if _G.AutoTakeReviveEnabled then
                pcall(function()
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        stepTeleport(REVIVE_TARGET_POS)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.5) do
            if _G.AutoReviveEnabled then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if obj:IsA("ProximityPrompt") and obj.Enabled then
                            local parent = obj.Parent
                            if parent and parent:IsA("BasePart") and (parent.Position - hrp.Position).Magnitude <= 500 then
                                pcall(function() fireproximityprompt(obj) end)
                            end
                        end
                    end
                end
            end
        end
    end)

    local freecamEnabled = false
    local freecamSpeed = 1.5
    local freecamPitch = 0
    local freecamYaw = 0
    local freecamCamera = Workspace.CurrentCamera
    local freecamKeys = {}
    local freecamMobile = {Forward = false, Backward = false, Left = false, Right = false, Up = false, Down = false}

    local FreecamScreenGui = Instance.new("ScreenGui")
    FreecamScreenGui.Name = "FreecamMobileUI"
    FreecamScreenGui.IgnoreGuiInset = true
    FreecamScreenGui.ResetOnSpawn = false
    local freecamGuiOk = pcall(function()
        FreecamScreenGui.Parent = CoreGui
    end)
    if not freecamGuiOk then
        FreecamScreenGui.Parent = player:WaitForChild("PlayerGui")
    end

    local function CreateFreecamButton(name, text, pos)
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Size = UDim2.new(0, 65, 0, 65)
        btn.Position = pos
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        btn.BackgroundTransparency = 0.2
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.TextSize = 24
        btn.Visible = false
        btn.Parent = FreecamScreenGui
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 15)
        corner.Parent = btn
        return btn
    end

    local BtnFwd = CreateFreecamButton("Forward", "↑", UDim2.new(0.5, -35, 0.7, 0))
    local BtnBack = CreateFreecamButton("Backward", "↓", UDim2.new(0.5, -35, 0.85, 0))
    local BtnLeft = CreateFreecamButton("Left", "←", UDim2.new(0.35, -35, 0.775, 0))
    local BtnRight = CreateFreecamButton("Right", "→", UDim2.new(0.65, -35, 0.775, 0))
    local BtnUp = CreateFreecamButton("Up", "▲", UDim2.new(0.82, -35, 0.7, 0))
    local BtnDown = CreateFreecamButton("Down", "▼", UDim2.new(0.82, -35, 0.85, 0))

    local ToggleFreecamBtn = Instance.new("TextButton")
    ToggleFreecamBtn.Size = UDim2.new(0, 100, 0, 45)
    ToggleFreecamBtn.Position = UDim2.new(0.02, 0, 0.02, 0)
    ToggleFreecamBtn.Text = "FREECAM OFF"
    ToggleFreecamBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    ToggleFreecamBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleFreecamBtn.TextSize = 14
    ToggleFreecamBtn.Font = Enum.Font.GothamBold
    ToggleFreecamBtn.Parent = FreecamScreenGui
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 10)
    toggleCorner.Parent = ToggleFreecamBtn

    local function BindMobileButton(btn, keyName)
        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                freecamMobile[keyName] = true
            end
        end)
        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                freecamMobile[keyName] = false
            end
        end)
    end
    BindMobileButton(BtnFwd, "Forward")
    BindMobileButton(BtnBack, "Backward")
    BindMobileButton(BtnLeft, "Left")
    BindMobileButton(BtnRight, "Right")
    BindMobileButton(BtnUp, "Up")
    BindMobileButton(BtnDown, "Down")

    UserInputService.InputBegan:Connect(function(input, gp)
        if not gp and input.UserInputType == Enum.UserInputType.Keyboard then
            freecamKeys[input.KeyCode] = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            freecamKeys[input.KeyCode] = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input, gp)
        if not freecamEnabled then return end
        local isTouch = input.UserInputType == Enum.UserInputType.Touch and not gp
        local isMouse = input.UserInputType == Enum.UserInputType.MouseMovement and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        if isTouch or isMouse then
            local delta = input.Delta
            if delta then
                freecamYaw = (freecamYaw or 0) - delta.X * 0.3
                freecamPitch = math.clamp((freecamPitch or 0) - delta.Y * 0.3, -89, 89)
            end
            if freecamCamera then
                freecamCamera.CFrame = CFrame.new(freecamCamera.CFrame.Position) * CFrame.Angles(0, math.rad(freecamYaw), 0) * CFrame.Angles(math.rad(freecamPitch), 0, 0)
            end
        end
    end)

    local function ToggleFreecam(state)
        freecamEnabled = state
        freecamCamera = Workspace.CurrentCamera or freecamCamera
        _G.FreecamEnabled = state
        if state then
            pcall(function()
                if freecamCamera then
                    local rx, ry, _ = freecamCamera.CFrame:ToOrientation()
                    freecamPitch = math.deg(rx)
                    freecamYaw = math.deg(ry)
                    freecamCamera.CameraType = Enum.CameraType.Scriptable
                end
                ToggleFreecamBtn.Text = "FREECAM ON"
                ToggleFreecamBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                if UserInputService.TouchEnabled then
                    BtnFwd.Visible = true
                    BtnBack.Visible = true
                    BtnLeft.Visible = true
                    BtnRight.Visible = true
                    BtnUp.Visible = true
                    BtnDown.Visible = true
                end
            end)
        else
            pcall(function()
                if freecamCamera then freecamCamera.CameraType = Enum.CameraType.Custom end
                if player.Character and player.Character:FindFirstChild("Humanoid") and freecamCamera then
                    freecamCamera.CameraSubject = player.Character.Humanoid
                end
                ToggleFreecamBtn.Text = "FREECAM OFF"
                ToggleFreecamBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                BtnFwd.Visible = false
                BtnBack.Visible = false
                BtnLeft.Visible = false
                BtnRight.Visible = false
                BtnUp.Visible = false
                BtnDown.Visible = false
                for k in pairs(freecamKeys) do freecamKeys[k] = false end
                for k in pairs(freecamMobile) do freecamMobile[k] = false end
            end)
        end
    end
    ToggleFreecamBtn.MouseButton1Click:Connect(function() ToggleFreecam(not freecamEnabled) end)

    RunService.RenderStepped:Connect(function(dt)
        if not freecamEnabled then return end
        dt = dt or 0.016
        local moveDir = Vector3.new()
        if (freecamKeys[Enum.KeyCode.W] or freecamMobile.Forward) and freecamCamera then
            moveDir = moveDir + freecamCamera.CFrame.LookVector
        end
        if (freecamKeys[Enum.KeyCode.S] or freecamMobile.Backward) and freecamCamera then
            moveDir = moveDir - freecamCamera.CFrame.LookVector
        end
        if (freecamKeys[Enum.KeyCode.A] or freecamMobile.Left) and freecamCamera then
            moveDir = moveDir - freecamCamera.CFrame.RightVector
        end
        if (freecamKeys[Enum.KeyCode.D] or freecamMobile.Right) and freecamCamera then
            moveDir = moveDir + freecamCamera.CFrame.RightVector
        end
        if freecamKeys[Enum.KeyCode.Space] or freecamMobile.Up then
            moveDir = moveDir + Vector3.new(0, 1, 0)
        end
        if freecamKeys[Enum.KeyCode.LeftControl] or freecamMobile.Down then
            moveDir = moveDir - Vector3.new(0, 1, 0)
        end
        if moveDir.Magnitude > 0 and freecamCamera then
            local speed = freecamSpeed * 50 * dt
            freecamCamera.CFrame = freecamCamera.CFrame + (moveDir.Unit * speed)
        end
    end)

    local originalMaterials = {}

    local function saveOriginalMaterials()
        if next(originalMaterials) == nil then
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    originalMaterials[v] = {Material = v.Material, Reflectance = v.Reflectance, CastShadow = v.CastShadow}
                end
            end
        end
    end

    local function toggleGraphicReduction(percent, enable)
        pcall(function()
            saveOriginalMaterials()
            local totalParts = 0
            for _ in pairs(originalMaterials) do totalParts = totalParts + 1 end
            if totalParts == 0 then return end
            local targetCount = math.floor(totalParts * (percent / 100))
            local currentCount = 0
            for part, data in pairs(originalMaterials) do
                if part and part.Parent then
                    currentCount = currentCount + 1
                    if currentCount <= targetCount then
                        if enable then
                            part.Material = Enum.Material.SmoothPlastic
                            part.Reflectance = 0
                            part.CastShadow = false
                        else
                            part.Material = data.Material
                            part.Reflectance = data.Reflectance
                            part.CastShadow = data.CastShadow
                        end
                    end
                end
            end
        end)
    end

    local function activateFPSBoost()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            Lighting.GlobalShadows = false
            Lighting.Brightness = 0
            Lighting.FogEnd = 1e9
        end)
    end

    local function deactivateFPSBoost()
        pcall(function()
            Lighting.GlobalShadows = true
            Lighting.Brightness = 2
            Lighting.FogEnd = 1000
        end)
    end    local lastDash = 0
    local lockedTarget = nil

    task.spawn(function()
        while task.wait() do
            if not _G.AutoFarmLevel then
                lockedTarget = nil
                continue
            end
            pcall(function()
                local char = player.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not hrp or not hum then return end
                if not lockedTarget or not lockedTarget.Parent or not lockedTarget:FindFirstChild("Humanoid") or lockedTarget.Humanoid.Health <= 0 then
                    lockedTarget = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == _G.Settings.TargetName and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            lockedTarget = obj
                            break
                        end
                    end
                end
                if not lockedTarget then return end
                local targetHrp = lockedTarget:FindFirstChild("HumanoidRootPart")
                local targetHum = lockedTarget:FindFirstChild("Humanoid")
                if not targetHrp or not targetHum then lockedTarget = nil return end
                targetHrp.CFrame = CFrame.new(targetHrp.Position)
                targetHum.WalkSpeed = 0
                targetHum.JumpPower = 0
                targetHum.PlatformStand = true
                if tick() - lastDash >= _G.Settings.Speed then
                    lastDash = tick()
                    local offsets = {
                        Vector3.new(_G.Settings.DashDist, 0, 0),
                        Vector3.new(-_G.Settings.DashDist, 0, 0),
                        Vector3.new(0, 0, _G.Settings.DashDist),
                        Vector3.new(0, 0, -_G.Settings.DashDist)
                    }
                    local randomOffset = offsets[math.random(1, #offsets)]
                    hrp.CFrame = CFrame.lookAt(targetHrp.Position + randomOffset, targetHrp.Position)
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        tool:Activate()
                    else
                        pcall(function()
                            VirtualUser:CaptureController()
                            VirtualUser:Button1Down(Vector2.new(500, 500))
                            task.wait(0.03)
                            VirtualUser:Button1Up(Vector2.new(500, 500))
                        end)
                    end
                end
            end)
        end
    end)

    local function AutoLootNPC2()
        task.spawn(function()
            while task.wait(0.3) do
                if _G.NhatVatPham then
                    pcall(function()
                        local giangHo2 = Workspace:FindFirstChild("GiangHo2")
                        if giangHo2 then
                            local dropFolder = giangHo2:FindFirstChild("Drop")
                            if dropFolder then
                                local char = player.Character
                                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    for _, dropItem in pairs(dropFolder:GetChildren()) do
                                        if dropItem and dropItem:IsA("BasePart") then
                                            local distance = (dropItem.Position - hrp.Position).Magnitude
                                            if distance <= 500 then
                                                local prompt = dropItem:FindFirstChildOfClass("ProximityPrompt")
                                                if prompt then
                                                    pcall(function()
                                                        fireproximityprompt(prompt)
                                                    end)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
    AutoLootNPC2()

    task.spawn(function()
        while task.wait(0.5) do
            if _G.AutoLootEnabled then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, v in ipairs(Workspace:GetDescendants()) do
                        if v:IsA("ProximityPrompt") and v.Parent and v.Parent:IsA("BasePart") and (hrp.Position - v.Parent.Position).Magnitude <= 20 then
                            pcall(function() fireproximityprompt(v) end)
                        end
                        if v:IsA("TouchInterest") and v.Parent:IsA("BasePart") and (hrp.Position - v.Parent.Position).Magnitude <= 20 then
                            pcall(function()
                                firetouchinterest(hrp, v.Parent, 0)
                                firetouchinterest(hrp, v.Parent, 1)
                            end)
                        end
                    end
                end
            end
        end
    end)

    local ToaDoChua1 = Vector3.new(1561, 133, -244)
    local ToaDoChua2 = Vector3.new(1547, 133, -245)
    local TDBanhMi = {Vector3.new(573, 21, -357), Vector3.new(563, 20, -386), Vector3.new(553, 20, -413), Vector3.new(531, 21, -449)}
    local TDBenhVien = {Vector3.new(790, 22, -403), Vector3.new(790, 22, -413)}
    local TDCaoSu = {Vector3.new(1681, 19, -456), Vector3.new(1723, 19, -388)}
    local TDChotCongAn = Vector3.new(734, 20, -812)
    local TDSuKien = Vector3.new(0, 0, 0)
    local TDMatOng = {Vector3.new(567, 19, -533), Vector3.new(626, 19, -511), Vector3.new(629, 19, -419)}
    local TDBoss = Vector3.new(-2823, 274, -1896)

    local function isAreaOccupied(targetPos)
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and (p.Character.HumanoidRootPart.Position - targetPos).Magnitude <= 7 then
                return true
            end
        end
        for _, v in ipairs(Workspace:GetDescendants()) do
            if (v:IsA("Seat") or v:IsA("VehicleSeat")) and v.Occupant and v.Occupant.Parent ~= player.Character and (v.Position - targetPos).Magnitude <= 7 then
                return true
            end
        end
        return false
    end

    local function interactWithSeatPrompt(targetPos)
        for _, prompt in ipairs(Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") and (prompt.Parent.Position - targetPos).Magnitude <= 6 then
                pcall(function() fireproximityprompt(prompt) end)
                break
            end
        end
    end

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmChua then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = ToaDoChua1
                        if isAreaOccupied(ToaDoChua1) then finalTarget = ToaDoChua2 end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmBanhMi then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = nil
                        for i = 1, #TDBanhMi do
                            if not isAreaOccupied(TDBanhMi[i]) then
                                finalTarget = TDBanhMi[i]
                                break
                            end
                        end
                        if not finalTarget then finalTarget = TDBanhMi[1] end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmBenhVien then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = nil
                        for i = 1, #TDBenhVien do
                            if not isAreaOccupied(TDBenhVien[i]) then
                                finalTarget = TDBenhVien[i]
                                break
                            end
                        end
                        if not finalTarget then finalTarget = TDBenhVien[1] end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    local currentCaoSuTarget = nil
    task.spawn(function()
        while true do
            task.wait(0.8)
            if _G.AutoFarmCaoSu then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if not currentCaoSuTarget or isAreaOccupied(currentCaoSuTarget) then
                            local chosen = nil
                            for i = 1, #TDCaoSu do
                                if not isAreaOccupied(TDCaoSu[i]) then
                                    chosen = TDCaoSu[i]
                                    break
                                end
                            end
                            currentCaoSuTarget = chosen or TDCaoSu[1]
                        end
                        hrp.CFrame = CFrame.new(currentCaoSuTarget + Vector3.new(0, 2, 0))
                    end
                end)
            else
                currentCaoSuTarget = nil
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.8)
            if _G.AutoFarmChotCongAn then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if not isAreaOccupied(TDChotCongAn) then
                            hrp.CFrame = CFrame.new(TDChotCongAn + Vector3.new(0, 2, 0))
                        end
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmSuKien then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum then
                        if (hrp.Position - TDSuKien).Magnitude > 5 then
                            hrp.CFrame = CFrame.new(TDSuKien + Vector3.new(0, 2, 0))
                        end
                        task.wait(0.1)
                        interactWithSeatPrompt(TDSuKien)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.AutoFarmMatOng then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and not hum.SeatPart then
                        local finalTarget = nil
                        for i = 1, #TDMatOng do
                            if not isAreaOccupied(TDMatOng[i]) then
                                finalTarget = TDMatOng[i]
                                break
                            end
                        end
                        if not finalTarget then finalTarget = TDMatOng[1] end
                        hrp.CFrame = CFrame.new(finalTarget + Vector3.new(0, 2, 0))
                        task.wait(0.1)
                        interactWithSeatPrompt(finalTarget)
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.5)
            if _G.TeleportToBoss then
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - TDBoss).Magnitude > 3 then
                        hrp.CFrame = CFrame.new(TDBoss)
                    end
                end)
            end
        end
    end)

    local MethodAPoints = {
        Vector3.new(-2793.28, 238.63, -1784.05),
        Vector3.new(-2788.09, 238.84, -1733.05)
    }

    local MethodBPoints = {
        Vector3.new(-2793, 238, -1779),
        Vector3.new(-2811, 238, -1760),
        Vector3.new(-2771, 240, -1754)
    }

    local MethodCPoints = {
        Vector3.new(-2791.95, 238.70, -1786.11),
        Vector3.new(-2767.53, 238.63, -1762.08),
        Vector3.new(-2790.39, 238.63, -1734.33),
        Vector3.new(-2815.67, 238.63, -1763.27)
    }

    local bossAttackCooldown = 0
    local currentMethodBIndex = 1
    local currentMethodCIndex = 1
    local toggleTele = true

    task.spawn(function()
        while true do
            task.wait()
            if _G.BossMode == "A" and _G.AutoFarmBossCircle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = player.Character.HumanoidRootPart
                    local target = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "NPC2" and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            target = obj.HumanoidRootPart
                            break
                        end
                    end
                    if target then
                        local targetPos = toggleTele and MethodAPoints[1] or MethodAPoints[2]
                        local bossPos = target.Position
                        hrp.CFrame = CFrame.lookAt(targetPos, Vector3.new(bossPos.X, targetPos.Y, bossPos.Z))
                        toggleTele = not toggleTele
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        if tick() - bossAttackCooldown > 0.14 then
                            bossAttackCooldown = tick()
                            local tool = player.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool:Activate()
                            else
                                pcall(function()
                                    VirtualUser:CaptureController()
                                    VirtualUser:Button1Down(Vector2.new(0, 0))
                                    task.delay(0.02, function() VirtualUser:Button1Up(Vector2.new(0, 0)) end)
                                end)
                            end
                        end
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait()
            if _G.BossMode == "B" and _G.AutoFarmBossCircle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = player.Character.HumanoidRootPart
                    local target = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "NPC2" and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            target = obj.HumanoidRootPart
                            break
                        end
                    end
                    if target then
                        local targetPos = MethodBPoints[currentMethodBIndex]
                        local bossPos = target.Position
                        hrp.CFrame = CFrame.lookAt(targetPos, Vector3.new(bossPos.X, targetPos.Y, bossPos.Z))
                        currentMethodBIndex = currentMethodBIndex + 1
                        if currentMethodBIndex > #MethodBPoints then currentMethodBIndex = 1 end
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        if tick() - bossAttackCooldown > 0.14 then
                            bossAttackCooldown = tick()
                            local tool = player.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool:Activate()
                            else
                                pcall(function()
                                    VirtualUser:CaptureController()
                                    VirtualUser:Button1Down(Vector2.new(0, 0))
                                    task.delay(0.02, function() VirtualUser:Button1Up(Vector2.new(0, 0)) end)
                                end)
                            end
                        end
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait()
            if _G.BossMode == "C" and _G.AutoFarmBossCircle and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = player.Character.HumanoidRootPart
                    local target = nil
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "NPC2" and obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChild("Humanoid") and obj.Humanoid.Health > 0 then
                            target = obj.HumanoidRootPart
                            break
                        end
                    end
                    if target then
                        local targetPos = MethodCPoints[currentMethodCIndex]
                        local bossPos = target.Position
                        hrp.CFrame = CFrame.lookAt(targetPos, Vector3.new(bossPos.X, targetPos.Y, bossPos.Z))
                        currentMethodCIndex = currentMethodCIndex + 1
                        if currentMethodCIndex > #MethodCPoints then currentMethodCIndex = 1 end
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        if tick() - bossAttackCooldown > 0.14 then
                            bossAttackCooldown = tick()
                            local tool = player.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool:Activate()
                            else
                                pcall(function()
                                    VirtualUser:CaptureController()
                                    VirtualUser:Button1Down(Vector2.new(0, 0))
                                    task.delay(0.02, function() VirtualUser:Button1Up(Vector2.new(0, 0)) end)
                                end)
                            end
                        end
                    end
                end)
            end
        end
    end)

    local customJumpForce = 85
    local attackDelay = 0.08
    local activeHitboxes = {}
    local activeHealthGuis = {}

    local function clearAllHitboxes()
        for _, a in pairs(activeHitboxes) do
            pcall(function() a:Destroy() end)
        end
        activeHitboxes = {}
    end

    local function clearAllHealthGuis()
        for _, g in pairs(activeHealthGuis) do
            pcall(function() g:Destroy() end)
        end
        activeHealthGuis = {}
    end

    local function getClosestPlayer()
        local closest, dist = nil, math.huge
        local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if myRoot then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                    local d = (myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude
                    if d < dist then dist = d
                        closest = p end
                end
            end
        end
        return closest
    end

    UserInputService.JumpRequest:Connect(function()
        if _G.PvpJumpActive then
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum:GetState() ~= Enum.HumanoidStateType.Freefall then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, customJumpForce, hrp.Velocity.Z)
                end
            end)
        end
    end)

    task.spawn(function()
        while true do
            if _G.PvpAutoAttack and not _G.FreecamEnabled then
                task.defer(function()
                    pcall(function()
                        VirtualUser:ClickButton1(Vector2.new(freecamCamera.ViewportSize.X / 2, freecamCamera.ViewportSize.Y / 2))
                    end)
                end)
            end
            task.wait(attackDelay)
        end
    end)

    RunService.RenderStepped:Connect(function()
        pcall(function()
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if _G.PvpSpeedActive and hrp and hum and hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (hum.MoveDirection * 3)
            end
            if _G.PvpSpinActive and hrp then
                if not hrp:FindFirstChild("CAPPYBARA_SpinVelocity") then
                    local spin = Instance.new("BodyAngularVelocity")
                    spin.Name = "CAPPYBARA_SpinVelocity"
                    spin.MaxTorque = Vector3.new(0, math.huge, 0)
                    spin.AngularVelocity = Vector3.new(0, 40, 0)
                    spin.Parent = hrp
                end
            else
                if hrp and hrp:FindFirstChild("CAPPYBARA_SpinVelocity") then
                    hrp["CAPPYBARA_SpinVelocity"]:Destroy()
                end
            end
            if _G.PvpAimNoCamActive then
                local targetPlayer = getClosestPlayer()
                if targetPlayer and targetPlayer.Character and hrp then
                    local targetPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetPart then
                        hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(targetPart.Position.X, hrp.Position.Y, targetPart.Position.Z))
                    end
                end
            end
            if _G.PvpHitboxActive then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                        local root = p.Character.HumanoidRootPart
                        root.Size = Vector3.new(5, 5, 5)
                        root.CanCollide = false
                        if not activeHitboxes[p.Name] or not activeHitboxes[p.Name].Parent then
                            if activeHitboxes[p.Name] then activeHitboxes[p.Name]:Destroy() end
                            local box = Instance.new("BoxHandleAdornment")
                            box.Size = Vector3.new(5, 6, 5)
                            box.Color3 = Color3.fromRGB(255, 0, 0)
                            box.Transparency = 0.6
                            box.AlwaysOnTop = true
                            box.Adornee = root
                            box.Parent = HubScreenGui
                            activeHitboxes[p.Name] = box
                        end
                    else
                        if activeHitboxes[p.Name] then
                            pcall(function() p.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1) end)
                            activeHitboxes[p.Name]:Destroy()
                            activeHitboxes[p.Name] = nil
                        end
                    end
                end
            else
                if next(activeHitboxes) ~= nil then clearAllHitboxes() end
            end
            if _G.PvpHealthActive then
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                        local healthStr = math.floor(p.Character.Humanoid.Health) .. "/" .. math.floor(p.Character.Humanoid.MaxHealth)
                        local cur = activeHealthGuis[p.Name]
                        if not cur or not cur.Parent then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "CAPPYBARA_HealthGui"
                            bg.Size = UDim2.new(0, 200, 0, 50)
                            bg.StudsOffset = Vector3.new(0, 3.5, 0)
                            bg.AlwaysOnTop = true
                            local txt = Instance.new("TextLabel", bg)
                            txt.BackgroundTransparency = 1
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.Font = Enum.Font.GothamBold
                            txt.TextSize = 14
                            txt.TextColor3 = Color3.fromRGB(0, 255, 127)
                            txt.Text = healthStr
                            bg.Adornee = p.Character.Head
                            bg.Parent = HubScreenGui
                            activeHealthGuis[p.Name] = bg
                        else
                            local label = cur:FindFirstChildOfClass("TextLabel")
                            if label then label.Text = healthStr end
                        end
                    else
                        if activeHealthGuis[p.Name] then
                            activeHealthGuis[p.Name]:Destroy()
                            activeHealthGuis[p.Name] = nil
                        end
                    end
                end
            else
                if next(activeHealthGuis) ~= nil then clearAllHealthGuis() end
            end
        end)
    end)

    -- ==================== PVP CAPPY (Tích hợp vào tab PVP Combat) ====================
    local PvpTab = Tabs.Main6
    
    -- Thêm các toggle của CAPPY vào tab PVP Combat
    PvpTab:AddParagraph({
        Title = "PVP CAPPY",
        Text = "Tính năng bổ sung từ CAPPY: Speed Boost, Auto Hit, Lấy Ghế, Aimlock, ESP"
    })
    
    local CAPPYSpeedEnabled = false
    local CAPPYSpeedValue = 35
    
    PvpTab:AddToggle("CAPPYSpeedToggle", {
        Title = "CAPPY Speed Boost",
        Default = false,
        Callback = function(Value)
            CAPPYSpeedEnabled = Value
        end
    })
    
    PvpTab:AddSlider("CAPPYSpeedSlider", {
        Title = "CAPPY Speed Value",
        Min = 16,
        Max = 100,
        Default = 35,
        Rounding = 1,
        Callback = function(Value)
            CAPPYSpeedValue = Value
        end
    })
    
    local CAPPYAutoHit = false
    PvpTab:AddToggle("CAPPYAutoHitToggle", {
        Title = "CAPPY Auto Hit",
        Default = false,
        Callback = function(Value)
            CAPPYAutoHit = Value
        end
    })
    
    local CAPPYAimlock = false
    PvpTab:AddToggle("CAPPYAimlockToggle", {
        Title = "CAPPY Aimlock",
        Default = false,
        Callback = function(Value)
            CAPPYAimlock = Value
        end
    })
    
    local CAPPYHealthESP = false
    PvpTab:AddToggle("CAPPYHealthESPToggle", {
        Title = "CAPPY Health ESP",
        Default = false,
        Callback = function(Value)
            CAPPYHealthESP = Value
            if not Value then
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        if head:FindFirstChild("CAPPYHealthESP") then
                            head.CAPPYHealthESP:Destroy()
                        end
                    end
                end
            end
        end
    })
    
    PvpTab:AddButton({
        Title = "CAPPY Lấy Ghế",
        Callback = function()
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if not hrp or not hum then return end
                
                local ghe = workspace:FindFirstChild("Ghe")
                if not ghe then return end
                
                local chairs = {}
                for _, v in pairs(ghe:GetChildren()) do
                    if v.Name == "Chair" then
                        local hitbox = v:FindFirstChild("hitbox")
                        if hitbox then
                            local cd = hitbox:FindFirstChild("ClickDetector")
                            if cd then
                                table.insert(chairs, {click = cd, part = hitbox})
                            end
                        end
                    end
                end
                
                if #chairs > 0 then
                    local randomChair = chairs[math.random(1, #chairs)]
                    local oldPos = hrp.CFrame
                    
                    hum.Sit = false
                    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    
                    local tween = TweenService:Create(hrp, TweenInfo.new(0.22, Enum.EasingStyle.Linear), {
                        CFrame = randomChair.part.CFrame + randomChair.part.CFrame.LookVector * -2 + Vector3.new(0, 2, 0)
                    })
                    tween:Play()
                    tween.Completed:Wait()
                    
                    task.wait(0.12)
                    
                    for i = 1, 5 do
                        randomChair.click.MaxActivationDistance = 20
                        fireclickdetector(randomChair.click)
                        task.wait(0.04)
                    end
                    
                    task.wait(0.08)
                    hrp.CFrame = oldPos
                end
            end)
        end
    })
    
    -- CAPPY RenderStepped functions
    RunService.RenderStepped:Connect(function(dt)
        -- CAPPY Speed Boost
        if CAPPYSpeedEnabled then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                local dir = hum.MoveDirection
                if dir.Magnitude > 0 then
                    hrp.CFrame = hrp.CFrame + dir * ((CAPPYSpeedValue - 16) * dt)
                end
            end
        end
        
        -- CAPPY Aimlock
        if CAPPYAimlock then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest = nil
                local dist = math.huge
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local mag = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                        if mag < dist and mag <= 60 then
                            dist = mag
                            closest = plr
                        end
                    end
                end
                if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
                    hrp.CFrame = CFrame.new(hrp.Position, closest.Character.HumanoidRootPart.Position)
                end
            end
        end
    end)
    
    -- CAPPY Auto Hit
    task.spawn(function()
        while task.wait(0.15) do
            if CAPPYAutoHit then
                local char = player.Character
                if char then
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        pcall(function() tool:Activate() end)
                    end
                end
            end
        end
    end)
    
    -- CAPPY Health ESP
    local function createCAPPYESP(character)
        if not CAPPYHealthESP then return end
        local head = character:FindFirstChild("Head")
        local hum = character:FindFirstChildOfClass("Humanoid")
        if head and hum and not head:FindFirstChild("CAPPYHealthESP") then
            local bill = Instance.new("BillboardGui")
            bill.Name = "CAPPYHealthESP"
            bill.Parent = head
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(3.5, 0, 1.2, 0)
            bill.StudsOffset = Vector3.new(0, 2.6, 0)
            
            local bg = Instance.new("Frame")
            bg.Parent = bill
            bg.Size = UDim2.new(1, 0, 0.18, 0)
            bg.Position = UDim2.new(0, 0, 0.5, 0)
            bg.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
            bg.BackgroundTransparency = 0.2
            bg.BorderSizePixel = 0
            Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)
            
            local bar = Instance.new("Frame")
            bar.Parent = bg
            bar.Name = "HealthBar"
            bar.Size = UDim2.new(1, 0, 1, 0)
            bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            bar.BorderSizePixel = 0
            Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
            
            local txt = Instance.new("TextLabel")
            txt.Parent = bill
            txt.Name = "HPText"
            txt.Size = UDim2.new(1, 0, 0.4, 0)
            txt.Position = UDim2.new(0, 0, 0, -8)
            txt.BackgroundTransparency = 1
            txt.TextColor3 = Color3.new(1, 1, 1)
            txt.TextStrokeTransparency = 0
            txt.Font = Enum.Font.GothamBold
            txt.TextScaled = true
            txt.Text = math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
        end
    end
    
    RunService.RenderStepped:Connect(function()
        if CAPPYHealthESP then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    createCAPPYESP(plr.Character)
                    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                    local head = plr.Character:FindFirstChild("Head")
                    if hum and head and head:FindFirstChild("CAPPYHealthESP") then
                        local esp = head.CAPPYHealthESP
                        local bar = esp.Frame.HealthBar
                        local txt = esp.HPText
                        local percent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                        bar:TweenSize(UDim2.new(percent, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.08, true)
                        txt.Text = math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
                    end
                end
            end
        end
    end)

    -- ==================== TAB XE BAY (Main11) ====================
    local XeBayTab = Tabs.Main11

    XeBayTab:AddParagraph({
        Title = "Xe Bay",
        Text = "Bug xe bay, di chuyen nhanh. Bật/tắt bằng nút bên dưới."
    })

    local xeBayState = false
    local flySpeed = 200
    local xeBayKeys = {W = false, S = false, UP = false, DOWN = false}
    local flyConnection = nil
    local flyGui = nil
    local mobileControls = nil
    local flyParts = {}

    local function GetRootXeBay()
        local char = player.Character
        if not char then return nil end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.SeatPart then return hum.SeatPart end
        return char:FindFirstChild("HumanoidRootPart")
    end

    local function TeleportToGroundXeBay(root)
        local rayOrigin = root.Position
        local rayDirection = Vector3.new(0, -2000, 0)
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {player.Character}
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        if raycastResult then
            root.CFrame = CFrame.new(raycastResult.Position + Vector3.new(0, 4, 0))
        end
    end

    local function ToggleXeBay(state)
        xeBayState = state
        if state then
            if not flyGui then
                flyGui = Instance.new("ScreenGui")
                flyGui.Name = "XeBayMobileUI"
                flyGui.ResetOnSpawn = false
                pcall(function() flyGui.Parent = CoreGui end)
                
                mobileControls = Instance.new("Frame", flyGui)
                mobileControls.Size = UDim2.new(0, 220, 0, 150)
                mobileControls.Position = UDim2.new(0.65, 0, 0.5, 0)
                mobileControls.BackgroundTransparency = 1
                mobileControls.Visible = true
                
                local function CreateMobileBtn(txt, pos, keyName)
                    local btn = Instance.new("TextButton", mobileControls)
                    btn.Size = UDim2.new(0, 60, 0, 60)
                    btn.Position = pos
                    btn.Text = txt
                    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    btn.BackgroundTransparency = 0.5
                    btn.TextColor3 = Color3.new(1, 1, 1)
                    btn.Font = Enum.Font.GothamBold
                    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
                    btn.MouseButton1Down:Connect(function() xeBayKeys[keyName] = true end)
                    btn.MouseButton1Up:Connect(function() xeBayKeys[keyName] = false end)
                end
                
                CreateMobileBtn("⬆️", UDim2.new(0.35, 0, 0, 0), "W")
                CreateMobileBtn("⬇️", UDim2.new(0.35, 0, 0.6, 0), "S")
                CreateMobileBtn("Lên", UDim2.new(0.7, 0, 0.3, 0), "UP")
                CreateMobileBtn("Xuống", UDim2.new(0, 0, 0.3, 0), "DOWN")
            end
            
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = GetRootXeBay()
            if not root then return end
            
            local camFix = Instance.new("Part", char)
            camFix.Name = "CamFixPart"
            camFix.Transparency = 1
            camFix.CanCollide = false
            camFix.Size = Vector3.new(1,1,1)
            local weld = Instance.new("Weld", camFix)
            weld.Part0 = camFix
            weld.Part1 = root
            Workspace.CurrentCamera.CameraSubject = camFix
            
            local bv = Instance.new("BodyVelocity", root)
            bv.MaxForce = Vector3.new(1e7, 1e7, 1e7)
            bv.Velocity = Vector3.new(0, 0, 0)
            
            local bg = Instance.new("BodyGyro", root)
            bg.MaxTorque = Vector3.new(1e7, 1e7, 1e7)
            bg.P = 4000
            bg.D = 500
            
            flyParts = {camFix = camFix, weld = weld, bv = bv, bg = bg}
            
            task.spawn(function()
                while xeBayState and root and root.Parent do
                    RunService.RenderStepped:Wait()
                    local currentRoot = GetRootXeBay()
                    if not currentRoot or not currentRoot.Parent then
                        break
                    end
                    if bv.Parent ~= currentRoot then
                        bv.Parent = currentRoot
                        bg.Parent = currentRoot
                        root = currentRoot
                    end
                    local currentCamera = Workspace.CurrentCamera
                    if not currentCamera then
                        continue
                    end
                    local camCFrame = currentCamera.CFrame
                    bg.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(camCFrame.LookVector.X, 0, camCFrame.LookVector.Z))
                    local moveVec = Vector3.new(0, 0, 0)
                    if xeBayKeys.W then moveVec = moveVec + camCFrame.LookVector end
                    if xeBayKeys.S then moveVec = moveVec - camCFrame.LookVector end
                    if xeBayKeys.UP then moveVec = moveVec + Vector3.new(0, 1, 0) end
                    if xeBayKeys.DOWN then moveVec = moveVec - Vector3.new(0, 1, 0) end
                    bv.Velocity = (moveVec.Magnitude > 0) and (moveVec.Unit * flySpeed) or Vector3.new(0, 0, 0)
                end
                if bv then bv:Destroy() end
                if bg then bg:Destroy() end
                if camFix then camFix:Destroy() end
                if hum then 
                    Workspace.CurrentCamera.CameraSubject = hum 
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
                if root then
                    root.Velocity = Vector3.new(0,0,0)
                    root.RotVelocity = Vector3.new(0,0,0)
                    TeleportToGroundXeBay(root)
                    task.wait(0.1)
                    root.Velocity = Vector3.new(0,0,0)
                    root.RotVelocity = Vector3.new(0,0,0)
                end
            end)
        else
            if flyParts.camFix then flyParts.camFix:Destroy() end
            if flyParts.bv then flyParts.bv:Destroy() end
            if flyParts.bg then flyParts.bg:Destroy() end
            flyParts = {}
        end
    end

    XeBayTab:AddToggle("XeBayToggle", {
        Title = "Bật/Tắt Xe Bay",
        Default = false,
        Callback = function(Value)
            ToggleXeBay(Value)
        end
    })
    
    XeBayTab:AddSlider("XeBaySpeedSlider", {
        Title = "Tốc độ bay",
        Min = 50,
        Max = 500,
        Default = 200,
        Rounding = 1,
        Callback = function(Value)
            flySpeed = Value
        end
    })
    
    XeBayTab:AddParagraph({
        Title = "Hướng dẫn",
        Text = "PC: W/S - Tiến/Lùi, E - Lên, Q - Xuống\nMobile: Dùng nút ảo bên phải"
    })

    -- UserInputService for Xe Bay
    UserInputService.InputBegan:Connect(function(i, g)
        if g then return end
        if i.KeyCode == Enum.KeyCode.W then xeBayKeys.W = true end
        if i.KeyCode == Enum.KeyCode.S then xeBayKeys.S = true end
        if i.KeyCode == Enum.KeyCode.E then xeBayKeys.UP = true end
        if i.KeyCode == Enum.KeyCode.Q then xeBayKeys.DOWN = true end
    end)

    UserInputService.InputEnded:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.W then xeBayKeys.W = false end
        if i.KeyCode == Enum.KeyCode.S then xeBayKeys.S = false end
        if i.KeyCode == Enum.KeyCode.E then xeBayKeys.UP = false end
        if i.KeyCode == Enum.KeyCode.Q then xeBayKeys.DOWN = false end
    end)

    local ConfigFolderName = "CAPPYBARA_MultiConfigs"
    local GlobalSettingsFile = "CAPPYBARA_System_Global.json"
    _G.SelectedConfigName = ""
    _G.UseConfigSystem = false

    if makefolder and not isfolder(ConfigFolderName) then makefolder(ConfigFolderName) end

    local RegisteredToggles = {
        AutoFarmLevelToggle = "AutoFarmLevel",
        AutoFarmChuaToggle = "AutoFarmChua",
        AntiAFKToggle = "AntiAFKEnabled",
        AutoFarmBanhMiToggle = "AutoFarmBanhMi",
        AutoFarmBenhVienToggle = "AutoFarmBenhVien",
        AutoFarmCaoSuToggle = "AutoFarmCaoSu",
        AutoFarmChotCongAnToggle = "AutoFarmChotCongAn",
        AutoFarmSuKienToggle = "AutoFarmSuKien",
        AutoFarmMatOngToggle = "AutoFarmMatOng",
        TeleportToBossToggle = "TeleportToBoss",
        AutoFarmBossCircleToggle = "AutoFarmBossCircle",
        AutoAimBossNoCamToggle = "AutoAimBossNoCam",
        FreecamToggle = "FreecamEnabled",
        PvpAutoAttackToggle = "PvpAutoAttack",
        PvpSpinToggle = "PvpSpinActive",
        PvpAimNoCamToggle = "PvpAimNoCamActive",
        PvpHitboxToggle = "PvpHitboxActive",
        PvpHealthToggle = "PvpHealthActive",
        AutoBandageToggle = "AutoBandageEnabled",
        AutoBuyHealToggle = "AutoBuyHeal",
        PvpSpeedToggle = "PvpSpeedActive",
        PvpJumpToggle = "PvpJumpActive",
        FPSBoostNewToggle = "FPSBoostState",
        Reduce20Toggle = "Reduce20State",
        Reduce40Toggle = "Reduce40State",
        Reduce60Toggle = "Reduce60State",
        Reduce100Toggle = "Reduce100State",
        ClearEverythingToggle = "ClearEverythingState",
        ShowHealthToggle = "ShowHealthEnabled",
        AutoReviveToggle = "AutoReviveEnabled",
        AutoTakeReviveToggle = "AutoTakeReviveEnabled",
        NhatVatPhamToggle = "NhatVatPham"
    }

    local function getAllConfigFiles()
        local list = {}
        if listfiles then
            for _, p in ipairs(listfiles(ConfigFolderName)) do
                local n = p:match("([^/\\]+)%.json$")
                if n then table.insert(list, n) end
            end
        end
        if #list == 0 then table.insert(list, "Chua co config nao") end
        return list
    end

    local function saveGlobalSystemSettings()
        writefile(GlobalSettingsFile, HttpService:JSONEncode({UseConfigSystem = _G.UseConfigSystem, SelectedConfigName = _G.SelectedConfigName}))
    end

    local function saveNewConfigWithName(customName)
        if customName == "" then
            Fluent:Notify({Title = "Loi", Content = "Vui long nhap ten!", Duration = 3})
            return
        end
        customName = tostring(customName):gsub('[^%w_%-%s]', ''):gsub('%s+', '_')
        if customName == '' then
            Fluent:Notify({Title = "Loi", Content = "Ten config khong hop le!", Duration = 3})
            return
        end
        local data = {}
        for ui, var in pairs(RegisteredToggles) do
            data[var] = _G[var] or false
        end
        local ok, err = pcall(function()
            writefile(ConfigFolderName .. "/" .. customName .. ".json", HttpService:JSONEncode(data))
        end)
        if not ok then
            Fluent:Notify({Title = "Config", Content = "Khong the luu config: " .. tostring(err), Duration = 4})
            return
        end
        _G.SelectedConfigName = customName
        saveGlobalSystemSettings()
        if ConfigDropdown and ConfigDropdown.SetValues then
            pcall(function() ConfigDropdown:SetValues(getAllConfigFiles()) end)
        end
        Fluent:Notify({Title = "Config", Content = "Da luu: " .. customName, Duration = 3})
    end

    local function loadSelectedConfig(customName)
        if customName == "Chua co config nao" then return end
        local path = ConfigFolderName .. "/" .. customName .. ".json"
        if isfile(path) then
            local suc, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
            if suc and data then
                for ui, var in pairs(RegisteredToggles) do
                    if data[var] ~= nil then
                        _G[var] = data[var]
                        if Fluent.Options and Fluent.Options[ui] then Fluent.Options[ui]:SetValue(data[var]) end
                        if var == "FPSBoostState" and data[var] then activateFPSBoost() end
                        if var == "Reduce20State" then toggleGraphicReduction(20, data[var]) end
                        if var == "Reduce40State" then toggleGraphicReduction(40, data[var]) end
                        if var == "Reduce60State" then toggleGraphicReduction(60, data[var]) end
                        if var == "Reduce100State" then toggleGraphicReduction(100, data[var]) end
                        if var == "ClearEverythingState" and data[var] then
                            activateFPSBoost()
                            for _, v in ipairs(Workspace:GetDescendants()) do
                                if v:IsA("Decal") or v:IsA("Texture") or v:IsA("Sound") then pcall(function() v:Destroy() end) end
                                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false end
                                if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic
                                    v.Reflectance = 0
                                    v.CastShadow = false end
                            end
                        end
                    end
                end
            end
        end
    end

    local function deleteSelectedConfig(customName)
        if customName == "Chua co config nao" then return end
        local path = ConfigFolderName .. "/" .. customName .. ".json"
        if isfile(path) then
            local ok, err = pcall(function() delfile(path) end)
            if not ok then
                Fluent:Notify({Title = "Config", Content = "Khong the xoa config: " .. tostring(err), Duration = 4})
                return
            end
            _G.SelectedConfigName = ""
            saveGlobalSystemSettings()
            if ConfigDropdown and ConfigDropdown.SetValues then
                pcall(function() ConfigDropdown:SetValues(getAllConfigFiles()) end)
            end
            Fluent:Notify({Title = "Config", Content = "Da xoa: " .. customName, Duration = 3})
        end
    end

    local ProfileParagraph = Tabs.Main1:AddParagraph({Title = "THONG TIN TAI KHOAN", Text = "Ten: " .. player.DisplayName .. "\n@" .. player.Name})
    Tabs.Main1:AddParagraph({Title = "EXECUTOR", Text = "Dang chay: " .. identity .. "\nHo tro " .. #SupportedExecutors .. " executor"})
    Tabs.Main1:AddButton({Title = "Can ho tro ib tiktok", Callback = function()
        setclipboard("cappybara")
        Fluent:Notify({Title = "CAPPYBARA System", Content = "Da sao chep id Tiktok!", Duration = 3})
    end})
    Tabs.Main1:AddButton({Title = "TikTok Ho Tro", Callback = function()
        setclipboard("https://www.tiktok.com/@trungkilabo")
        Fluent:Notify({Title = "CAPPYBARA System", Content = "Da sao chep link TikTok!", Duration = 3})
    end})
    Tabs.Main1:AddParagraph({Title = "HUONG DAN FREECAM", Text = "An nut Bat/Tat Freecam. Di chuyen bang WASD + Space/LeftControl. Keo chuot phai hoac vuot de xoay. Dieu chinh toc do ben duoi."})
    Tabs.Main1:AddToggle("FreecamToggleMain", {Title = "BAT/TAT FREECAM", Default = false, Callback = function(Value) ToggleFreecam(Value) end})
    Tabs.Main1:AddSlider("FreecamSpeedSliderMain", {Title = "TOC DO FREECAM", Min = 0.5, Max = 10, Default = 1.5, Rounding = 1, Callback = function(Value) freecamSpeed = Value end})
    Tabs.Main1:AddToggle("AutoReviveToggle", {Title = "Auto Cứu (đến người chết)", Default = false, Callback = function(Value) _G.AutoReviveEnabled = Value end})
    Tabs.Main1:AddToggle("AutoTakeReviveToggle", {Title = "Lấy Cứu (teleport điểm cứu)", Default = false, Callback = function(Value) _G.AutoTakeReviveEnabled = Value end})

    Tabs.Main2:AddToggle("AutoFarmLevelToggle", {Title = "Auto Farm NPC", Default = false, Callback = function(Value) _G.AutoFarmLevel = Value end})
    Tabs.Main2:AddSlider("NpcDistanceSlider", {Title = "Khoang cach", Min = 10, Max = 25, Default = 18, Rounding = 1, Callback = function(Value) _G.Settings.DashDist = Value end})
    Tabs.Main2:AddSlider("NpcSpeedSlider", {Title = "Toc do Dash", Min = 1, Max = 20, Default = 5, Rounding = 1, Callback = function(Value) _G.Settings.Speed = Value / 100 end})
    Tabs.Main2:AddToggle("AutoLootToggle", {Title = "Auto Nhat Do", Default = false, Callback = function(Value) _G.AutoLootEnabled = Value end})
    Tabs.Main2:AddToggle("AutoFarmChuaToggle", {Title = "Auto Farm O Chua", Default = false, Callback = function(Value) _G.AutoFarmChua = Value end})
    
    local antiAFKConnection = nil
    Tabs.Main2:AddToggle("AntiAFKToggle", {Title = "Anti-AFK", Default = false, Callback = function(Value)
        _G.AntiAFKEnabled = Value
        if Value then
            if antiAFKConnection then antiAFKConnection:Disconnect() end
            antiAFKConnection = player.Idled:Connect(function()
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
            end)
            Fluent:Notify({Title = "Anti AFK", Content = "Da bat Anti-AFK!", Duration = 3})
        else
            if antiAFKConnection then
                antiAFKConnection:Disconnect()
                antiAFKConnection = nil
            end
            Fluent:Notify({Title = "Anti AFK", Content = "Da tat Anti-AFK!", Duration = 3})
        end
    end})
    
    Tabs.Main2:AddButton({Title = "admin", Callback = function()
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))() end)
    end})
    Tabs.Main2:AddButton({Title = "vfly", Callback = function()
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-V-fly-20577"))() end)
    end})

    Tabs.Main3:AddToggle("AutoFarmBanhMiToggle", {Title = "Auto Farm Banh Mi", Default = false, Callback = function(Value) _G.AutoFarmBanhMi = Value end})
    Tabs.Main3:AddToggle("AutoFarmBenhVienToggle", {Title = "Auto Farm Benh Vien", Default = false, Callback = function(Value) _G.AutoFarmBenhVien = Value end})
    Tabs.Main3:AddToggle("AutoFarmCaoSuToggle", {Title = "Auto Farm Cao Su", Default = false, Callback = function(Value) _G.AutoFarmCaoSu = Value end})
    Tabs.Main3:AddToggle("AutoFarmChotCongAnToggle", {Title = "Auto Farm Chot Cong An", Default = false, Callback = function(Value) _G.AutoFarmChotCongAn = Value end})

    Tabs.Main4:AddToggle("AutoFarmSuKienToggle", {Title = "Auto Farm Su Kien", Default = false, Callback = function(Value) _G.AutoFarmSuKien = Value end})
    Tabs.Main4:AddToggle("AutoFarmMatOngToggle", {Title = "Auto Farm Mat Ong", Default = false, Callback = function(Value) _G.AutoFarmMatOng = Value end})

    Tabs.Main5:AddToggle("TeleportToBossToggle", {Title = "Dich Chuyen Den Boss", Default = false, Callback = function(Value) _G.TeleportToBoss = Value end})
    Tabs.Main5:AddToggle("AutoFarmBossCircleToggle", {Title = "Auto Farm Boss", Default = false, Callback = function(Value) _G.AutoFarmBossCircle = Value end})
    Tabs.Main5:AddDropdown("BossFarmModeDropdown", {Title = "Che Do Farm", Values = {"A", "B", "C"}, Default = "A", Callback = function(Value) _G.BossMode = Value end})
    Tabs.Main5:AddToggle("NhatVatPhamToggle", {Title = "Auto Loot Boss", Default = false, Callback = function(Value)
        _G.NhatVatPham = Value
        if Value then
            Fluent:Notify({Title = "Auto Loot Boss", Content = "Da bat auto loot Boss!", Duration = 3})
        else
            Fluent:Notify({Title = "Auto Loot Boss", Content = "Da tat auto loot Boss!", Duration = 3})
        end
    end})
    Tabs.Main5:AddToggle("AutoAimBossNoCamToggle", {Title = "Aim Huong Danh", Default = false, Callback = function(Value) _G.AutoAimBossNoCam = Value end})
    Tabs.Main5:AddToggle("ShowHealthToggle", {Title = "Hien Mau Boss", Default = false, Callback = function(Value) _G.ShowHealthEnabled = Value end})

    Tabs.Main6:AddToggle("PvpAimNoCamToggle", {Title = "Aim Nhan Vat", Default = false, Callback = function(Value) _G.PvpAimNoCamActive = Value end})
    Tabs.Main6:AddToggle("PvpAutoAttackToggle", {Title = "Auto Click", Default = false, Callback = function(Value) _G.PvpAutoAttack = Value end})
    Tabs.Main6:AddToggle("PvpHitboxToggle", {Title = "Hitbox", Default = false, Callback = function(Value)
        _G.PvpHitboxActive = Value
        if not Value then clearAllHitboxes() end
    end})
    Tabs.Main6:AddToggle("PvpHealthToggle", {Title = "Hien Mau", Default = false, Callback = function(Value)
        _G.PvpHealthActive = Value
        if not Value then clearAllHealthGuis() end
    end})
    Tabs.Main6:AddToggle("PvpSpinToggle", {Title = "Spin", Default = false, Callback = function(Value) _G.PvpSpinActive = Value end})
    Tabs.Main6:AddToggle("PvpSpeedToggle", {Title = "Sieu Toc", Default = false, Callback = function(Value) _G.PvpSpeedActive = Value end})
    Tabs.Main6:AddToggle("PvpJumpToggle", {Title = "Sieu Nhay", Default = false, Callback = function(Value) _G.PvpJumpActive = Value end})

    Tabs.Main7:AddToggle("FPSBoostNewToggle", {Title = "FPS Boost", Default = false, Callback = function(Value)
        _G.FPSBoostState = Value
        if Value then activateFPSBoost() else deactivateFPSBoost() end
    end})
    Tabs.Main7:AddToggle("Reduce20Toggle", {Title = "Giam 20% do hoa", Default = false, Callback = function(Value)
        _G.Reduce20State = Value
        toggleGraphicReduction(20, Value)
    end})
    Tabs.Main7:AddToggle("Reduce40Toggle", {Title = "Giam 40%", Default = false, Callback = function(Value)
        _G.Reduce40State = Value
        toggleGraphicReduction(40, Value)
    end})
    Tabs.Main7:AddToggle("Reduce60Toggle", {Title = "Giam 60%", Default = false, Callback = function(Value)
        _G.Reduce60State = Value
        toggleGraphicReduction(60, Value)
    end})
    Tabs.Main7:AddToggle("Reduce100Toggle", {Title = "Giam 100%", Default = false, Callback = function(Value)
        _G.Reduce100State = Value
        toggleGraphicReduction(100, Value)
    end})
    Tabs.Main7:AddToggle("ClearEverythingToggle", {Title = "Xoa toan bo hieu ung", Default = false, Callback = function(Value)
        _G.ClearEverythingState = Value
        if Value then
            activateFPSBoost()
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") or v:IsA("Sound") then pcall(function() v:Destroy() end) end
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false end
                if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                    v.CastShadow = false end
            end
        end
    end})

    Tabs.Main8:AddParagraph({Title = "He thong Config", Text = "Luu trang thai tat ca toggle. Dat ten, tao, chon, xoa config."})
    local NewConfigNameInput = ""
    Tabs.Main8:AddInput("ConfigNameInput", {Title = "Ten config moi", Placeholder = "Nhap ten khong dau", Finished = true, Callback = function(Value)
        NewConfigNameInput = Value:gsub("%s+", "")
    end})
    Tabs.Main8:AddButton({Title = "Tao Config", Callback = function()
        if NewConfigNameInput == "" then
            Fluent:Notify({Title = "Loi", Content = "Nhap ten truoc!", Duration = 3})
        else
            saveNewConfigWithName(NewConfigNameInput)
        end
    end})
    ConfigDropdown = Tabs.Main8:AddDropdown("SelectConfigDropdown", {Title = "Danh sach", Values = getAllConfigFiles(), Default = "Chua co config nao", Callback = function(Value)
        if Value ~= "Chua co config nao" then
            _G.SelectedConfigName = Value
            saveGlobalSystemSettings()
            if _G.UseConfigSystem then loadSelectedConfig(Value) end
        end
    end})
    Tabs.Main8:AddToggle("UseConfigSystemToggle", {Title = "Su dung config dang chon", Default = false, Callback = function(Value)
        _G.UseConfigSystem = Value
        saveGlobalSystemSettings()
        if Value and _G.SelectedConfigName ~= "" and _G.SelectedConfigName ~= "Chua co config nao" then
            loadSelectedConfig(_G.SelectedConfigName)
        end
    end})
    Tabs.Main8:AddButton({Title = "Xoa Config dang chon", Callback = function()
        if _G.SelectedConfigName ~= "" and _G.SelectedConfigName ~= "Chua co config nao" then
            deleteSelectedConfig(_G.SelectedConfigName)
        else
            Fluent:Notify({Title = "Loi", Content = "Chon config truoc!", Duration = 3})
        end
    end})

    local bossHealthGui = Instance.new("ScreenGui")
    bossHealthGui.Name = "BossHealthGUI"
    bossHealthGui.IgnoreGuiInset = true
    bossHealthGui.ResetOnSpawn = false
    bossHealthGui.Parent = player:WaitForChild("PlayerGui")

    local healthBarContainer = Instance.new("Frame")
    healthBarContainer.Name = "HealthBarContainer"
    healthBarContainer.Size = UDim2.new(0.3, 0, 0, 60)
    healthBarContainer.Position = UDim2.new(0.35, 0, 0.02, 0)
    healthBarContainer.BackgroundColor3 = Color3.new(0, 0, 0)
    healthBarContainer.BackgroundTransparency = 0.2
    healthBarContainer.BorderSizePixel = 2
    healthBarContainer.BorderColor3 = Color3.new(1, 1, 1)
    healthBarContainer.Visible = false
    healthBarContainer.Parent = bossHealthGui

    local bossNameLabel = Instance.new("TextLabel")
    bossNameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    bossNameLabel.BackgroundTransparency = 1
    bossNameLabel.TextColor3 = Color3.new(1, 1, 1)
    bossNameLabel.Text = "NPC2 HP: 0/0"
    bossNameLabel.Font = Enum.Font.GothamBold
    bossNameLabel.TextSize = 18
    bossNameLabel.Parent = healthBarContainer

    local healthBarBackground = Instance.new("Frame")
    healthBarBackground.Size = UDim2.new(0.9, 0, 0, 20)
    healthBarBackground.Position = UDim2.new(0.05, 0, 0.6, 0)
    healthBarBackground.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    healthBarBackground.BorderSizePixel = 1
    healthBarBackground.BorderColor3 = Color3.new(1, 1, 1)
    healthBarBackground.Parent = healthBarContainer

    local healthBarFill = Instance.new("Frame")
    healthBarFill.Size = UDim2.new(1, 0, 1, 0)
    healthBarFill.BackgroundColor3 = Color3.new(1, 0, 0)
    healthBarFill.BorderSizePixel = 0
    healthBarFill.Parent = healthBarBackground

    local function updateBossHealthBar(h, mx)
        if healthBarContainer and h and mx then
            local p = 0
            if tonumber(mx) and mx > 0 then
                p = math.clamp(h / mx, 0, 1)
            end
            healthBarFill.Size = UDim2.new(p, 0, 1, 0)
            if p > 0.7 then healthBarFill.BackgroundColor3 = Color3.new(0, 1, 0)
            elseif p > 0.3 then healthBarFill.BackgroundColor3 = Color3.new(1, 1, 0)
            else healthBarFill.BackgroundColor3 = Color3.new(1, 0, 0) end
            bossNameLabel.Text = string.format("NPC2 HP: %d / %d", math.floor(h), math.floor(mx))
        end
    end

    local function setBossHealthBarVisible(v)
        if healthBarContainer then healthBarContainer.Visible = v end
    end

    local BILLBOARD_NAME = "GH2HealthBillboard"

    local function getBoss2()
        local gh2 = Workspace:FindFirstChild("GiangHo2")
        if not gh2 then return nil end
        local npcs = gh2:FindFirstChild("NPCs")
        if not npcs then return nil end
        return npcs:FindFirstChild("NPC2")
    end

    local function getOrCreateSimpleBillboard(head)
        if not head then return nil end
        local billboard = head:FindFirstChild(BILLBOARD_NAME)
        if not billboard then
            billboard = Instance.new("BillboardGui")
            billboard.Name = BILLBOARD_NAME
            billboard.Size = UDim2.new(0, 120, 0, 35)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.AlwaysOnTop = true
            billboard.Adornee = head
            billboard.Parent = head
            local label = Instance.new("TextLabel")
            label.Name = "HealthLabel"
            label.Size = UDim2.new(1, 0, 0.6, 0)
            label.Position = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextStrokeTransparency = 0.2
            label.Font = Enum.Font.GothamBold
            label.TextScaled = true
            label.Text = ""
            label.Parent = billboard
            local bg = Instance.new("Frame")
            bg.Name = "HealthBarBackground"
            bg.Size = UDim2.new(1, 0, 0.3, 0)
            bg.Position = UDim2.new(0, 0, 0.65, 0)
            bg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            bg.BorderSizePixel = 1
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.Parent = billboard
            local fill = Instance.new("Frame")
            fill.Name = "HealthBar"
            fill.Size = UDim2.new(1, 0, 1, 0)
            fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            fill.BorderSizePixel = 0
            fill.Parent = bg
        end
        return billboard
    end

    local function removeBillboard(head)
        if head then
            local bb = head:FindFirstChild(BILLBOARD_NAME)
            if bb then bb:Destroy() end
        end
    end

    local lastHead = nil
    RunService.Heartbeat:Connect(function()
        pcall(function()
            local npc = getBoss2()
            if _G.ShowHealthEnabled and npc and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("Head") then
                local hum = npc.Humanoid
                local head = npc.Head
                setBossHealthBarVisible(true)
                if hum.Health and hum.MaxHealth then
                    updateBossHealthBar(hum.Health, hum.MaxHealth)
                end
                local bb = getOrCreateSimpleBillboard(head)
                lastHead = head
                if hum.Health and hum.Health > 0 then
                    bb.Enabled = true
                    local label = bb:FindFirstChild("HealthLabel")
                    local bg = bb:FindFirstChild("HealthBarBackground")
                    if bg then
                        local fill = bg:FindFirstChild("HealthBar")
                        if label then
                            label.Text = string.format("%d / %d", math.floor(hum.Health), math.floor(hum.MaxHealth))
                        end
                        if fill and hum.Health and hum.MaxHealth then
                            local percent = 0
                            if hum.MaxHealth > 0 then
                                percent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                            end
                            fill.Size = UDim2.new(percent, 0, 1, 0)
                            if percent > 0.7 then fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                            elseif percent > 0.3 then fill.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                            else fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) end
                        end
                    end
                else
                    bb.Enabled = false
                end
            else
                if not _G.ShowHealthEnabled or not npc then
                    setBossHealthBarVisible(false)
                end
                if lastHead then
                    removeBillboard(lastHead)
                    lastHead = nil
                end
            end
        end)
    end)

    local kickConnection = nil
    local lastKickedPlayers = {}
    local kickCooldown = 5

    local function KickYourself(reason)
        pcall(function()
            game.Players.LocalPlayer:Kick(reason or "Nguoi choi khac den qua gan!")
        end)
    end

    local function CheckNearbyPlayers()
        if not _G.AutoKickEnabled then return end
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local currentTime = tick()
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local targetChar = player.Character
                if targetChar then
                    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
                    if targetHrp then
                        local distance = (hrp.Position - targetHrp.Position).Magnitude
                        if distance <= _G.AutoKickDistance then
                            local lastKick = lastKickedPlayers[player.Name] or 0
                            if currentTime - lastKick >= kickCooldown then
                                lastKickedPlayers[player.Name] = currentTime
                                KickYourself(string.format("⚠️ %s den gan (%.1f stud)", player.Name, distance))
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    Tabs.Main9:AddParagraph({Title = "AUTO KICK", Text = "Tu dong tu da khi co nguoi choi khac den gan"})
    Tabs.Main9:AddInput("AutoKickDistanceInput", {
        Title = "Khoang cach tu da (stud)",
        Placeholder = "15",
        Default = "15",
        Finished = true,
        Callback = function(value)
            local num = tonumber(value)
            if num then
                _G.AutoKickDistance = math.clamp(num, 1, 50)
            else
                _G.AutoKickDistance = 15
            end
        end
    })
    Tabs.Main9:AddToggle("AutoKickToggleMain", {
        Title = "Tu dong da khi nguoi choi den gan",
        Default = _G.AutoKickEnabled,
        Callback = function(state)
            _G.AutoKickEnabled = state
            if state then
                if kickConnection then kickConnection:Disconnect() end
                kickConnection = game:GetService("RunService").RenderStepped:Connect(CheckNearbyPlayers)
                Fluent:Notify({Title = "Auto Kick", Content = "Da bat tu dong da khi co nguoi den gan!", Duration = 3})
            else
                if kickConnection then kickConnection:Disconnect() end
                lastKickedPlayers = {}
                Fluent:Notify({Title = "Auto Kick", Content = "Da tat tu dong da!", Duration = 3})
            end
        end
    })

    Tabs.Main10:AddParagraph({Title = "AUTO HEAL", Text = "Tu dong su dung bang gac khi HP thap"})
    Tabs.Main10:AddSlider("HealHPSlider", {
        Title = "HP toi thieu de heal",
        Min = 10,
        Max = 100,
        Default = 80,
        Rounding = 1,
        Callback = function(value)
            _G.HealThreshold = tonumber(value) or 80
        end
    })
    Tabs.Main10:AddToggle("AutoHealToggle", {
        Title = "Tu dong heal",
        Default = false,
        Callback = function(state)
            _G.AutoHealEnabled = state
        end
    })
    Tabs.Main10:AddToggle("AutoBuyHealToggle", {
        Title = "Tu dong mua bang gac",
        Default = false,
        Callback = function(state)
            _G.AutoBuyHealEnabled = state
        end
    })

    task.spawn(function()
        while task.wait(1) do
            if _G.AutoHealEnabled then
                pcall(function()
                    local hum = player.Character and player.Character:FindFirstChild("Humanoid")
                    if hum and hum.Health > 0 and hum.Health < _G.HealThreshold then
                        ReplicatedStorage.Remotes.Heal:FireServer()
                    end
                end)
            end
        end
    end)

    task.spawn(function()
        while true do
            if _G.AutoBuyHealEnabled then
                pcall(function()
                    local ShopRemote = ReplicatedStorage:WaitForChild("KnitPackages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ShopService"):WaitForChild("RE"):WaitForChild("buyItem")
                    ShopRemote:FireServer("băng gạc", 5)
                end)
            end
            task.wait(7)
        end
    end)

    Fluent:Notify({Title = "CAPPYBARA hub", Content = "Da tai thanh cong!", Duration = 5})
end

CheckKey.MouseButton1Click:Connect(function()
    if TextBox.Text ~= "CAPPY_B9471" then
        TweenService:Create(CheckKey, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        }):Play()
        task.wait(1)
        TweenService:Create(CheckKey, TweenInfo.new(0.3), {
            BackgroundColor3 = Color3.fromRGB(80, 170, 80)
        }):Play()
        StarterGui:SetCore("SendNotification", {
            Text = "Hãy ấn nút 'Lấy Key' để lấy key mới!",
            Title = "Key sai",
            Duration = 3
        })
    else
        StarterGui:SetCore("SendNotification", {
            Text = "Key chính xác! Đang tải...",
            Title = "Thành công",
            Duration = 3
        })
        LoadMainScript()
    end
end)

-- Utility Pack is provided as Cappybara_UtilityPack.lua alongside this file.


-- PVP HEALTH ESP TOGGLE
if Tabs and Tabs.Main6 then
    Tabs.Main6:CreateParagraph("CAPPYHealthInfo", {
        Title = "PLAYER HEALTH",
        Content = "Tên player + thanh máu"
    })

    Tabs.Main6:CreateToggle("CAPPYHealthESP_New", {
        Title = "Hiện Máu Player",
        Default = false,
        Callback = function(Value)
            CAPPYHealthESPEnabled = Value
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= player then
                    if Value then
                        CAPPYCreateHealthESP(plr)
                    else
                        CAPPYRemoveHealthESP(plr)
                    end
                end
            end
        end
    })
end
