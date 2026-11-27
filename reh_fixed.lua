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

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function safeDestroy(name)
    local g = playerGui:FindFirstChild(name)
    if g then g:Destroy() end
end
safeDestroy("AutoTypingOverlay")
safeDestroy("Renx")
safeDestroy("KeySystem")
safeDestroy("RenxBossHudTop")

do
    local gui = Instance.new("ScreenGui")
    gui.Name = "AutoTypingOverlay"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = playerGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.fromScale(1, 1)
    bg.BackgroundColor3 = Color3.new(0, 0, 0)
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.fromScale(1, 1)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(0, 255, 0)
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 20
    lbl.Text = "Renx v10.5 LOADING..."
    lbl.Parent = bg

    task.delay(0.6, function()
        TweenService:Create(bg, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(lbl, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
        task.delay(0.35, function()
            if gui.Parent then gui:Destroy() end
        end)
    end)
end

repeat task.wait() until game:IsLoaded()

local function safeLoad(url)
    local ok, src = pcall(function() return game:HttpGetAsync(url) end)
    if not ok or type(src) ~= "string" or #src < 50 then return nil end
    local fn = loadstring(src)
    if not fn then return nil end
    local ok2, res = pcall(fn)
    return ok2 and res or nil
end

local Library = safeLoad("https://raw.githubusercontent.com/le443347-eng/gaylo/refs/heads/main/FluentCustom.luau.txt")
    or safeLoad("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua")
assert(Library, "[Renx] Khong tai duoc UI library")

local SaveManager = safeLoad("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/Addons/SaveManager.luau")
local InterfaceManager = safeLoad("https://raw.githubusercontent.com/angeryy-tvy/Fluent-Port-Vxeze/refs/heads/main/Addons/InterfaceManager.luau")

local function notify(t, c, d)
    pcall(function() Library:Notify({ Title = t, Content = c, Duration = d or 4 }) end)
end

-- Window size: scale down on small (mobile) screens so content area is not pushed off-screen
local cam = Workspace.CurrentCamera
local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
local winW = math.clamp(vp.X - 80, 420, 680)
local winH = math.clamp(vp.Y - 60, 280, 480)

local Window = Library:CreateWindow({
    Title = "Renx Hub",
    SubTitle = "By zervex_d | v10.5",
    TabWidth = math.clamp(math.floor(winW * 0.25), 120, 170),
    Size = UDim2.fromOffset(winW, winH),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

-- API shim: some Fluent forks use AddTab instead of CreateTab
if not Window.CreateTab and Window.AddTab then
    Window.CreateTab = function(self, cfg) return self:AddTab(cfg) end
end

local HubScreenGui = Instance.new("ScreenGui")
pcall(function() HubScreenGui.Parent = CoreGui end)
if not HubScreenGui.Parent then HubScreenGui.Parent = playerGui end
HubScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HubScreenGui.Name = "RenxHubRoot"

local Tabs = {
    Main1  = Window:CreateTab({ Title = "Thông Tin",    Icon = "home" }),
    Main2  = Window:CreateTab({ Title = "Farm NPC",     Icon = "trending-up" }),
    Main3  = Window:CreateTab({ Title = "Farm Tiền",    Icon = "dollar-sign" }),
    Main4  = Window:CreateTab({ Title = "Farm Sự Kiện", Icon = "star" }),
    Main5  = Window:CreateTab({ Title = "Farm Boss",    Icon = "swords" }),
    Main6  = Window:CreateTab({ Title = "PVP",          Icon = "target" }),
    Main7  = Window:CreateTab({ Title = "Teleport",     Icon = "map-pin" }),
    Main8  = Window:CreateTab({ Title = "Fake Role",    Icon = "eye" }),
    Main9  = Window:CreateTab({ Title = "Fix Lag",      Icon = "cpu" }),
    Main10 = Window:CreateTab({ Title = "Auto Kick",    Icon = "user-x" }),
    Main11 = Window:CreateTab({ Title = "Auto Heal",    Icon = "package" }),
    Main12 = Window:CreateTab({ Title = "Xe Bay",       Icon = "plane" }),
    Main13 = Window:CreateTab({ Title = "Config",       Icon = "settings" }),
}

Tabs.Main1:AddParagraph({
    Title = "Renx Hub",
    Content = "Developer: zervex_d\nTikTok: @zervex_d\nVersion: 10.5"
})

_G.AutoFarmLevel      = false
_G.NpcDistance        = 18.2
_G.NpcSpeed           = 0.05
_G.AutoLootEnabled    = false
_G.AutoFarmChua       = false
_G.AntiAFKEnabled     = false
_G.AutoFarmBanhMi     = false
_G.AutoFarmBenhVien   = false
_G.AutoFarmCaoSu      = false
_G.AutoFarmChotCongAn = false
_G.AutoFarmSuKien     = false
_G.AutoFarmMatOng     = false
_G.TeleportToBoss     = false
_G.BossMode           = "A"
_G.AutoFarmBossCircle = false
_G.ShowHealthEnabled  = false
_G.PvpAutoAttack      = false
_G.AutoBandageEnabled = false
_G.AutoBuyHeal        = false
_G.FreecamEnabled     = false
_G.PvpAimNoCamActive  = false
_G.PvpHitboxActive    = false
_G.PvpSpinActive      = false
_G.PvpSpeedActive     = false
_G.PvpJumpActive      = false
_G.PvpHealthActive    = false
_G.PvpEspEnabled      = false
_G.PvpHitboxWeapon    = false
_G.PvpFastSwitch      = false
_G.PvpAutoPvp         = false
_G.FPSBoostState      = false
_G.AutoReviveEnabled  = false
_G.AutoTakeReviveEnabled = false
_G.AutoKickEnabled    = false
_G.AutoKickDistance   = 15
_G.AutoKickCooldown   = 5
_G.AutoHealEnabled    = false
_G.AutoBuyHealEnabled = false
_G.HealThreshold      = 80
_G.NhatVatPham        = false
_G.AutoEquipWeapon    = false
_G.SelectedWeapon     = nil
_G.Settings = { TargetName = "CityNPC", DashDist = 18.2, Speed = 0.05 }

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
local freecamMobile = { Forward = false, Backward = false, Left = false, Right = false, Up = false, Down = false }

local FreecamScreenGui = Instance.new("ScreenGui")
FreecamScreenGui.Name = "FreecamMobileUI"
FreecamScreenGui.IgnoreGuiInset = true
FreecamScreenGui.ResetOnSpawn = false
if not pcall(function() FreecamScreenGui.Parent = CoreGui end) then
    FreecamScreenGui.Parent = playerGui
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

local BtnFwd   = CreateFreecamButton("Forward", "↑", UDim2.new(0.5, -35, 0.7, 0))
local BtnBack  = CreateFreecamButton("Backward", "↓", UDim2.new(0.5, -35, 0.85, 0))
local BtnLeft  = CreateFreecamButton("Left", "←", UDim2.new(0.35, -35, 0.775, 0))
local BtnRight = CreateFreecamButton("Right", "→", UDim2.new(0.65, -35, 0.775, 0))
local BtnUp    = CreateFreecamButton("Up", "▲", UDim2.new(0.82, -35, 0.7, 0))
local BtnDown  = CreateFreecamButton("Down", "▼", UDim2.new(0.82, -35, 0.85, 0))

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
            freecamCamera.CFrame = CFrame.new(freecamCamera.CFrame.Position)
                * CFrame.Angles(0, math.rad(freecamYaw), 0)
                * CFrame.Angles(math.rad(freecamPitch), 0, 0)
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
                BtnFwd.Visible = true; BtnBack.Visible = true
                BtnLeft.Visible = true; BtnRight.Visible = true
                BtnUp.Visible = true; BtnDown.Visible = true
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
            BtnFwd.Visible = false; BtnBack.Visible = false
            BtnLeft.Visible = false; BtnRight.Visible = false
            BtnUp.Visible = false; BtnDown.Visible = false
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
        freecamCamera.CFrame = freecamCamera.CFrame + (moveDir.Unit * freecamSpeed * 50 * dt)
    end
end)

local function RequestFromInventory(name)
    pcall(function()
        ReplicatedStorage:WaitForChild("KnitPackages"):WaitForChild("_Index")
            :WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit")
            :WaitForChild("Services"):WaitForChild("InventoryService")
            :WaitForChild("RE"):WaitForChild("updateInventory"):FireServer("eue", name)
    end)
end

local function EquipWeapon(name)
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not char or not hum then return false end
    local tool = player.Backpack:FindFirstChild(name) or char:FindFirstChild(name)
    if not tool then
        RequestFromInventory(name)
        task.wait(0.15)
        tool = player.Backpack:FindFirstChild(name) or char:FindFirstChild(name)
    end
    if tool and tool.Parent ~= char then
        hum:EquipTool(tool)
        return true
    end
    return false
end

local function GetSwordList()
    local list = {}
    pcall(function()
        local invRE = ReplicatedStorage:WaitForChild("KnitPackages"):WaitForChild("_Index")
            :WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit")
            :WaitForChild("Services"):WaitForChild("InventoryService")
            :WaitForChild("RE"):WaitForChild("updateInventory")
        invRE:FireServer("refresh")
    end)
    task.wait(0.15)

    local gui = player:FindFirstChild("PlayerGui")
    local scroll = gui
        and gui:FindFirstChild("Inventory")
        and gui.Inventory:FindFirstChild("MainFrame")
        and gui.Inventory.MainFrame:FindFirstChild("Container")
        and gui.Inventory.MainFrame.Container:FindFirstChild("Main")
        and gui.Inventory.MainFrame.Container.Main:FindFirstChild("ToolList")
        and gui.Inventory.MainFrame.Container.Main.ToolList:FindFirstChild("ScrollingFrame")

    if scroll then
        for _, btn in ipairs(scroll:GetChildren()) do
            if btn:IsA("TextButton") and btn:FindFirstChild("Type") and btn:FindFirstChild("ToolName") then
                if btn.Type.Value == "Sword" then
                    table.insert(list, btn.ToolName.Text)
                end
            end
        end
    end

    if #list == 0 then
        for _, v in ipairs(player.Backpack:GetChildren()) do
            if v:IsA("Tool") then table.insert(list, v.Name) end
        end
        if player.Character then
            for _, v in ipairs(player.Character:GetChildren()) do
                if v:IsA("Tool") and not table.find(list, v.Name) then table.insert(list, v.Name) end
            end
        end
    end

    return (#list > 0) and list or { "Không có vũ khí" }
end

local RenxFarm = {
    Enabled = false, Radius = 30, Speed = 0.2, HudEnabled = false, HudGui = nil
}

local function getBossModel()
    local gh2 = Workspace:FindFirstChild("GiangHo2")
    local npcs = gh2 and gh2:FindFirstChild("NPCs")
    if npcs then
        local npc2 = npcs:FindFirstChild("NPC2")
        if npc2 and npc2:FindFirstChild("HumanoidRootPart") and npc2:FindFirstChildOfClass("Humanoid") then
            return npc2
        end
        for _, obj in ipairs(npcs:GetChildren()) do
            if obj:FindFirstChild("HumanoidRootPart") and obj:FindFirstChildOfClass("Humanoid") then
                return obj
            end
        end
    end
    return nil
end

local function destroyBossHud()
    if RenxFarm.HudGui and RenxFarm.HudGui.Parent then
        RenxFarm.HudGui:Destroy()
    end
    RenxFarm.HudGui = nil
end

local function createBossHud()
    destroyBossHud()
    local parentTarget = (gethui and gethui()) or CoreGui
    local sg = Instance.new("ScreenGui")
    sg.Name = "RenxBossHudTop"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.Parent = parentTarget

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(0, 320, 0, 0)
    container.Position = UDim2.new(0.5, -160, 0, 14)
    container.BackgroundTransparency = 1
    container.Parent = sg

    local list = Instance.new("UIListLayout")
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 6)
    list.Parent = container

    RenxFarm.HudGui = sg
    local bossCards = {}

    local function makeCard(name)
        local card = Instance.new("Frame")
        card.Name = "Card_" .. name
        card.Size = UDim2.new(1, 0, 0, 42)
        card.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
        card.BackgroundTransparency = 0.1
        card.BorderSizePixel = 0
        card.Parent = container
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(80, 105, 145)
        stroke.Thickness = 1
        stroke.Transparency = 0.4
        stroke.Parent = card

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -12, 0, 16)
        nameLbl.Position = UDim2.fromOffset(8, 4)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = name
        nameLbl.TextColor3 = Color3.fromRGB(242, 246, 255)
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextSize = 12
        nameLbl.Parent = card

        local barBg = Instance.new("Frame")
        barBg.Size = UDim2.new(1, -16, 0, 12)
        barBg.Position = UDim2.fromOffset(8, 22)
        barBg.BackgroundColor3 = Color3.fromRGB(30, 34, 46)
        barBg.BorderSizePixel = 0
        barBg.Parent = card
        Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 6)

        local barFill = Instance.new("Frame")
        barFill.Size = UDim2.new(0, 0, 1, 0)
        barFill.BackgroundColor3 = Color3.fromRGB(34, 197, 148)
        barFill.BorderSizePixel = 0
        barFill.Parent = barBg
        Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 6)

        local hpTxt = Instance.new("TextLabel")
        hpTxt.Size = UDim2.fromScale(1, 1)
        hpTxt.BackgroundTransparency = 1
        hpTxt.Text = "0/0"
        hpTxt.TextColor3 = Color3.new(1, 1, 1)
        hpTxt.TextStrokeTransparency = 0.3
        hpTxt.Font = Enum.Font.GothamBold
        hpTxt.TextSize = 9
        hpTxt.ZIndex = 3
        hpTxt.Parent = barBg

        return { card = card, fill = barFill, txt = hpTxt, stroke = stroke }
    end

    local function getBosses()
        local list = {}
        local gh2 = Workspace:FindFirstChild("GiangHo2")
        local npcs = gh2 and gh2:FindFirstChild("NPCs")
        if npcs then
            for _, obj in ipairs(npcs:GetChildren()) do
                local hum = obj:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 and obj:FindFirstChild("HumanoidRootPart") then
                    table.insert(list, obj)
                end
            end
        end
        return list
    end

    task.spawn(function()
        while RenxFarm.HudEnabled do
            task.wait(0.25)
            if not RenxFarm.HudGui or not RenxFarm.HudGui.Parent then break end
            local bosses = getBosses()
            local seen = {}

            for _, boss in ipairs(bosses) do
                seen[boss.Name] = true
                local card = bossCards[boss.Name]
                if not card then
                    card = makeCard(boss.Name)
                    bossCards[boss.Name] = card
                end
                local hum = boss:FindFirstChildOfClass("Humanoid")
                if hum then
                    local hp = math.max(0, math.floor(hum.Health))
                    local maxHp = math.max(1, math.floor(hum.MaxHealth))
                    local ratio = math.clamp(hp / maxHp, 0, 1)
                    card.txt.Text = string.format("%d / %d (%.0f%%)", hp, maxHp, ratio * 100)
                    local col = ratio > 0.6 and Color3.fromRGB(34, 197, 148)
                        or (ratio > 0.3 and Color3.fromRGB(245, 158, 11) or Color3.fromRGB(239, 68, 68))
                    TweenService:Create(card.fill, TweenInfo.new(0.15), { Size = UDim2.new(ratio, 0, 1, 0), BackgroundColor3 = col }):Play()
                    card.stroke.Color = col
                end
            end

            for name, card in pairs(bossCards) do
                if not seen[name] then
                    card.card:Destroy()
                    bossCards[name] = nil
                end
            end
        end
        for _, card in pairs(bossCards) do
            if card.card and card.card.Parent then card.card:Destroy() end
        end
    end)
end

local function renxCircleBoss(bossRoot)
    task.spawn(function()
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not root or not bossRoot then return end
        local angle = 0
        while RenxFarm.Enabled and bossRoot.Parent and bossRoot.Parent:FindFirstChild("Humanoid") and bossRoot.Parent.Humanoid.Health > 0 do
            angle = (angle + RenxFarm.Speed * task.wait()) % (2 * math.pi)
            local pos = bossRoot.Position + Vector3.new(math.cos(angle) * RenxFarm.Radius, 0, math.sin(angle) * RenxFarm.Radius)
            root.CFrame = CFrame.lookAt(pos + Vector3.new(0, 2, 0), bossRoot.Position)
            if _G.SelectedWeapon and _G.AutoEquipWeapon then
                local char = player.Character
                if char and not char:FindFirstChild(_G.SelectedWeapon) then
                    EquipWeapon(_G.SelectedWeapon)
                end
            end
            VirtualUser:CaptureController()
            VirtualUser:Button1Down(Vector2.new(1280, 672))
        end
    end)
end

local function renxStartFarm()
    task.spawn(function()
        while RenxFarm.Enabled do
            local boss = getBossModel()
            if boss then
                local bossRoot = boss:FindFirstChild("HumanoidRootPart")
                if bossRoot then renxCircleBoss(bossRoot) end
                while RenxFarm.Enabled and boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 do
                    task.wait(0.2)
                end
                task.wait(5)
            else
                task.wait(0.5)
            end
        end
    end)
end

local ToaDoChua1 = Vector3.new(1561, 133, -244)
local ToaDoChua2 = Vector3.new(1547, 133, -245)
local TDBanhMi = { Vector3.new(573, 21, -357), Vector3.new(563, 20, -386), Vector3.new(553, 20, -413), Vector3.new(531, 21, -449) }
local TDBenhVien = { Vector3.new(790, 22, -403), Vector3.new(790, 22, -413) }
local TDCaoSu = { Vector3.new(1681, 19, -456), Vector3.new(1723, 19, -388) }
local TDChotCongAn = Vector3.new(734, 20, -812)
local TDSuKien = Vector3.new(0, 0, 0)
local TDMatOng = { Vector3.new(567, 19, -533), Vector3.new(626, 19, -511), Vector3.new(629, 19, -419) }
local TDBoss = Vector3.new(-2823, 274, -1896)

local function isAreaOccupied(targetPos)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            and (p.Character.HumanoidRootPart.Position - targetPos).Magnitude <= 7 then
            return true
        end
    end
    return false
end

local function interactWithSeatPrompt(targetPos)
    for _, prompt in ipairs(Workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") and prompt.Parent and prompt.Parent:IsA("BasePart")
            and (prompt.Parent.Position - targetPos).Magnitude <= 6 then
            pcall(function() fireproximityprompt(prompt) end)
            break
        end
    end
end

local function teleportTo(pos)
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame = CFrame.new(pos + Vector3.new(0, 2, 0)) end
end

local fpsValue = 0
local fpsFrames, fpsTime = 0, 0
local fpsLabel = nil

RunService.RenderStepped:Connect(function(dt)
    fpsFrames = fpsFrames + 1
    fpsTime = fpsTime + dt
    if fpsTime >= 0.5 then
        fpsValue = math.floor(fpsFrames / fpsTime)
        fpsFrames, fpsTime = 0, 0
        if fpsLabel then
            pcall(function() fpsLabel:SetDesc("FPS: " .. fpsValue) end)
        end
    end
end)

local function setupFakeRole(tab)
    local LocalPlayer = player
    getgenv().RoleSettings = getgenv().RoleSettings or {
        Text = "",
        Color = Color3.new(1, 1, 1),
        ColorMode = "Trang",
        CustomColor = Color3.fromRGB(255, 255, 255),
        Color1 = Color3.fromRGB(255, 0, 0),
        Color2 = Color3.fromRGB(0, 0, 255),
        DisplayName = { UseRainbow = false, CustomColor = Color3.fromRGB(76, 255, 121), UseCustomColor = false, CustomLevel = "", CustomName = "" },
        Username = { CustomText = "", CustomColor = Color3.fromRGB(255, 255, 255), UseCustomColor = false, UseRainbow = false }
    }

    local cfg = getgenv().RoleSettings
    local rainbowAngle, gradientTime = 0, 0

    local function rainbowAt(offset)
        local r = (math.sin(rainbowAngle + offset) + 1) / 2
        local g = (math.sin(rainbowAngle + offset + 2 * math.pi / 3) + 1) / 2
        local b = (math.sin(rainbowAngle + offset + 4 * math.pi / 3) + 1) / 2
        return Color3.new(r, g, b)
    end

    local function applyFake()
        local model = Workspace:FindFirstChild(LocalPlayer.Name)
        local main = model and model:FindFirstChild("NameTag") and model.NameTag:FindFirstChild("Main")
        if not main then return end
        local rank = main:FindFirstChild("Rank")
        if rank then
            if cfg.Text and cfg.Text ~= "" then rank.Text = cfg.Text end
            if cfg.Color then rank.TextColor3 = cfg.Color end
        end
        local disp = main:FindFirstChild("UserDisplayName")
        if disp then
            local lvl, cname = cfg.DisplayName.CustomLevel, cfg.DisplayName.CustomName
            if lvl ~= "" or cname ~= "" then
                local c = cfg.DisplayName.CustomColor
                local hex = string.format("#%02x%02x%02x", math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
                local showLvl = lvl ~= "" and lvl or "99"
                local showName = cname ~= "" and cname or LocalPlayer.Name
                disp.Text = string.format('<font color="%s">(Lv %s)</font> %s', hex, showLvl, showName)
            end
            if cfg.DisplayName.UseRainbow then disp.TextColor3 = rainbowAt(0)
            elseif cfg.DisplayName.UseCustomColor then disp.TextColor3 = cfg.DisplayName.CustomColor end
        end
        local uname = main:FindFirstChild("Username")
        if uname then
            if cfg.Username.CustomText ~= "" then uname.Text = cfg.Username.CustomText end
            if cfg.Username.UseRainbow then uname.TextColor3 = rainbowAt(1.5)
            elseif cfg.Username.UseCustomColor then uname.TextColor3 = cfg.Username.CustomColor end
        end
    end

    tab:AddInput("FakeRoleText", { Title = "Role", Default = cfg.Text or "", Placeholder = "Nhập role...", Numeric = false, Finished = false }):OnChanged(function(txt)
        cfg.Text = txt; applyFake()
    end)
    tab:AddDropdown("FakeRoleColorMode", { Title = "Màu Role", Values = { "Trang", "Chon", "Gradient", "Rainbow" }, Default = cfg.ColorMode or "Trang" }):OnChanged(function(mode)
        cfg.ColorMode = mode
        if mode == "Trang" then cfg.Color = Color3.new(1, 1, 1); applyFake()
        elseif mode == "Chon" then cfg.Color = cfg.CustomColor; applyFake() end
    end)
    tab:AddColorpicker("FakeRoleCustomColor", { Title = "Màu Tùy Chọn Role", Default = cfg.CustomColor }):OnChanged(function(col)
        cfg.CustomColor = col
        if cfg.ColorMode == "Chon" then cfg.Color = col; applyFake() end
    end)
    tab:AddColorpicker("FakeRoleGrad1", { Title = "Màu 1 (Gradient Role)", Default = cfg.Color1 }):OnChanged(function(col) cfg.Color1 = col end)
    tab:AddColorpicker("FakeRoleGrad2", { Title = "Màu 2 (Gradient Role)", Default = cfg.Color2 }):OnChanged(function(col) cfg.Color2 = col end)
    tab:AddInput("FakeLevelInput", { Title = "Level", Default = cfg.DisplayName.CustomLevel or "", Placeholder = "Nhập level...", Numeric = true, Finished = false }):OnChanged(function(txt)
        cfg.DisplayName.CustomLevel = txt; applyFake()
    end)
    tab:AddInput("FakeDisplayNameInput", { Title = "Tên Hiển Thị", Default = cfg.DisplayName.CustomName or "", Placeholder = "Nhập tên...", Numeric = false, Finished = false }):OnChanged(function(txt)
        cfg.DisplayName.CustomName = txt; applyFake()
    end)
    tab:AddToggle("FakeDispRainbow", { Title = "Rainbow Tên Hiển Thị", Default = cfg.DisplayName.UseRainbow or false }):OnChanged(function(val)
        cfg.DisplayName.UseRainbow = val
        if val then cfg.DisplayName.UseCustomColor = false end
        applyFake()
    end)
    tab:AddToggle("FakeDispCustomCol", { Title = "Màu Tùy Chỉnh Tên", Default = cfg.DisplayName.UseCustomColor or false }):OnChanged(function(val)
        cfg.DisplayName.UseCustomColor = val
        if val then cfg.DisplayName.UseRainbow = false end
        applyFake()
    end)
    tab:AddColorpicker("FakeDispColorPicker", { Title = "Màu Tên", Default = cfg.DisplayName.CustomColor }):OnChanged(function(col)
        cfg.DisplayName.CustomColor = col; applyFake()
    end)
    tab:AddInput("FakeUsernameInput", { Title = "Tên 2 (Username)", Default = cfg.Username.CustomText or "", Placeholder = "Nhập tên 2...", Numeric = false, Finished = false }):OnChanged(function(txt)
        cfg.Username.CustomText = txt; applyFake()
    end)
    tab:AddToggle("FakeUserRainbow", { Title = "Rainbow Cho Tên 2", Default = cfg.Username.UseRainbow or false }):OnChanged(function(val)
        cfg.Username.UseRainbow = val
        if val then cfg.Username.UseCustomColor = false end
        applyFake()
    end)
    tab:AddToggle("FakeUserCustomCol", { Title = "Màu Tùy Chỉnh Tên 2", Default = cfg.Username.UseCustomColor or false }):OnChanged(function(val)
        cfg.Username.UseCustomColor = val
        if val then cfg.Username.UseRainbow = false end
        applyFake()
    end)
    tab:AddColorpicker("FakeUserColorPicker", { Title = "Màu Tên 2", Default = cfg.Username.CustomColor }):OnChanged(function(col)
        cfg.Username.CustomColor = col; applyFake()
    end)

    RunService.RenderStepped:Connect(function(dt)
        local active = (cfg.ColorMode == "Gradient") or (cfg.ColorMode == "Rainbow") or cfg.DisplayName.UseRainbow or cfg.Username.UseRainbow
        if active then
            rainbowAngle = (rainbowAngle + dt * 3) % (math.pi * 2)
            if cfg.ColorMode == "Rainbow" then cfg.Color = rainbowAt(0)
            elseif cfg.ColorMode == "Gradient" then
                gradientTime = (gradientTime + dt * 0.5) % 1
                local t = (math.sin(gradientTime * math.pi * 2) + 1) / 2
                local c1, c2 = cfg.Color1, cfg.Color2
                cfg.Color = Color3.new(c1.R * (1 - t) + c2.R * t, c1.G * (1 - t) + c2.G * t, c1.B * (1 - t) + c2.B * t)
            end
            applyFake()
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1); applyFake()
    end)
    if LocalPlayer.Character then
        task.spawn(function() task.wait(1); applyFake() end)
    end
end

local originalMaterials = {}
local function saveOriginalMaterials()
    if next(originalMaterials) == nil then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                originalMaterials[v] = { Material = v.Material, Reflectance = v.Reflectance, CastShadow = v.CastShadow }
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

local FarmNPCTab = Tabs.Main2

FarmNPCTab:AddToggle("RenxFarmToggle", { Title = "Farm NPC (Renx Method)", Default = false }):OnChanged(function(v)
    RenxFarm.Enabled = v
    if v then renxStartFarm() end
end)

FarmNPCTab:AddSlider("RenxRadiusSlider", {
    Title = "Bán kính quay", Min = 5, Max = 50, Default = 17, Rounding = 1
}):OnChanged(function(v) RenxFarm.Radius = v end)

FarmNPCTab:AddSlider("RenxSpeedSlider", {
    Title = "Tốc độ quay", Min = 5, Max = 120, Default = 35, Rounding = 1
}):OnChanged(function(v) RenxFarm.Speed = v end)

FarmNPCTab:AddToggle("RenxHudToggle", { Title = "Hiển Thị Máu Boss", Default = false }):OnChanged(function(v)
    RenxFarm.HudEnabled = v
    if v then createBossHud() else destroyBossHud() end
end)

FarmNPCTab:AddToggle("AutoLootRenxToggle", { Title = "Auto Loot (Range 500)", Default = false }):OnChanged(function(v)
    _G.NhatVatPham = v
end)

task.spawn(function()
    while task.wait(0.4) do
        if _G.NhatVatPham then
            pcall(function()
                local gh2 = Workspace:FindFirstChild("GiangHo2")
                local dropFolder = gh2 and gh2:FindFirstChild("Drop")
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if dropFolder and hrp then
                    for _, drop in pairs(dropFolder:GetChildren()) do
                        if drop and drop:IsA("BasePart") and (drop.Position - hrp.Position).Magnitude <= 500 then
                            local prompt = drop:FindFirstChildOfClass("ProximityPrompt")
                            if prompt then pcall(function() fireproximityprompt(prompt) end) end
                        end
                    end
                end
            end)
        end
    end
end)

local WeaponTab = Tabs.Main5

WeaponTab:AddToggle("AutoEquipWeaponToggle", { Title = "Auto Trang Bị Vũ Khí", Default = false }):OnChanged(function(v)
    _G.AutoEquipWeapon = v
end)

local weaponDD = WeaponTab:AddDropdown("WeaponSelectDD", {
    Title = "Chọn Vũ Khí",
    Values = { "Bấm Refresh" },
    Multi = false,
    Default = 1,
    Searchable = true
})
weaponDD:OnChanged(function(v)
    if v and v ~= "Bấm Refresh" and v ~= "Không có vũ khí" then
        _G.SelectedWeapon = v
        EquipWeapon(v)
    end
end)

WeaponTab:AddButton({
    Title = "Refresh Danh Sách Vũ Khí",
    Callback = function()
        local list = GetSwordList()
        weaponDD:SetValues(list)
        Library:Notify({ Title = "Renx Hub", Content = "Đã load " .. #list .. " vũ khí!", Duration = 3 })
    end
})

WeaponTab:AddButton({
    Title = "Trang Bị Ngay",
    Callback = function()
        if _G.SelectedWeapon then
            local ok = EquipWeapon(_G.SelectedWeapon)
            Library:Notify({
                Title = "Renx Hub",
                Content = ok and ("Đã trang bị: " .. _G.SelectedWeapon) or "Không thể trang bị!",
                Duration = 3
            })
        else
            Library:Notify({ Title = "Renx Hub", Content = "Chưa chọn vũ khí!", Duration = 3 })
        end
    end
})

task.spawn(function()
    while task.wait(1) do
        if _G.AutoEquipWeapon and _G.SelectedWeapon then
            local char = player.Character
            if char and not char:FindFirstChild(_G.SelectedWeapon) then
                EquipWeapon(_G.SelectedWeapon)
            end
        end
    end
end)

local TeleTab = Tabs.Main7
TeleTab:AddButton({ Title = "Dịch chuyển tới Boss", Callback = function() teleportTo(TDBoss) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Chùa (Slot 1)", Callback = function() teleportTo(ToaDoChua1) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Chùa (Slot 2)", Callback = function() teleportTo(ToaDoChua2) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Bánh Mì", Callback = function() teleportTo(TDBanhMi[1]) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Bệnh Viện", Callback = function() teleportTo(TDBenhVien[1]) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Cao Su", Callback = function() teleportTo(TDCaoSu[1]) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Chốt Công An", Callback = function() teleportTo(TDChotCongAn) end })
TeleTab:AddButton({ Title = "Dịch chuyển tới Mật Ong", Callback = function() teleportTo(TDMatOng[1]) end })

TeleTab:AddToggle("AutoFarmChuaToggle", { Title = "Auto Farm Chùa", Default = false }):OnChanged(function(v) _G.AutoFarmChua = v end)
TeleTab:AddToggle("AutoFarmBanhMiToggle", { Title = "Auto Farm Bánh Mì", Default = false }):OnChanged(function(v) _G.AutoFarmBanhMi = v end)
TeleTab:AddToggle("AutoFarmBenhVienToggle", { Title = "Auto Farm Bệnh Viện", Default = false }):OnChanged(function(v) _G.AutoFarmBenhVien = v end)
TeleTab:AddToggle("AutoFarmCaoSuToggle", { Title = "Auto Farm Cao Su", Default = false }):OnChanged(function(v) _G.AutoFarmCaoSu = v end)
TeleTab:AddToggle("AutoFarmCongAnToggle", { Title = "Auto Farm Chốt Công An", Default = false }):OnChanged(function(v) _G.AutoFarmChotCongAn = v end)
TeleTab:AddToggle("AutoFarmMatOngToggle", { Title = "Auto Farm Mật Ong", Default = false }):OnChanged(function(v) _G.AutoFarmMatOng = v end)
TeleTab:AddToggle("TeleportToBossToggle", { Title = "Bám Boss", Default = false }):OnChanged(function(v) _G.TeleportToBoss = v end)

task.spawn(function()
    while task.wait(0.5) do
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hrp and hum then
            if _G.AutoFarmChua and not hum.SeatPart then
                local target = isAreaOccupied(ToaDoChua1) and ToaDoChua2 or ToaDoChua1
                teleportTo(target); task.wait(0.1); interactWithSeatPrompt(target)
            elseif _G.AutoFarmBanhMi and not hum.SeatPart then
                local target = TDBanhMi[1]
                for i = 1, #TDBanhMi do if not isAreaOccupied(TDBanhMi[i]) then target = TDBanhMi[i]; break end end
                teleportTo(target); task.wait(0.1); interactWithSeatPrompt(target)
            elseif _G.AutoFarmBenhVien and not hum.SeatPart then
                local target = TDBenhVien[1]
                for i = 1, #TDBenhVien do if not isAreaOccupied(TDBenhVien[i]) then target = TDBenhVien[i]; break end end
                teleportTo(target); task.wait(0.1); interactWithSeatPrompt(target)
            elseif _G.AutoFarmCaoSu then
                teleportTo(TDCaoSu[1])
            elseif _G.AutoFarmChotCongAn then
                if not isAreaOccupied(TDChotCongAn) then teleportTo(TDChotCongAn) end
            elseif _G.AutoFarmMatOng and not hum.SeatPart then
                local target = TDMatOng[1]
                for i = 1, #TDMatOng do if not isAreaOccupied(TDMatOng[i]) then target = TDMatOng[i]; break end end
                teleportTo(target); task.wait(0.1); interactWithSeatPrompt(target)
            elseif _G.TeleportToBoss then
                if (hrp.Position - TDBoss).Magnitude > 3 then teleportTo(TDBoss) end
            end
        end
    end
end)

local FixTab = Tabs.Main9
local fpsPara = FixTab:AddParagraph({ Title = "FPS Hiện Tại", Content = "Đang đo..." })
fpsLabel = fpsPara

FixTab:AddButton({ Title = "Bật FPS Boost", Callback = function()
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        Lighting.GlobalShadows = false
        Lighting.Brightness = 0
        Lighting.FogEnd = 1e9
    end)
end })
FixTab:AddButton({ Title = "Tắt FPS Boost", Callback = function()
    pcall(function()
        Lighting.GlobalShadows = true
        Lighting.Brightness = 2
        Lighting.FogEnd = 1000
    end)
end })
FixTab:AddButton({ Title = "Giảm Đồ Họa 40%", Callback = function() toggleGraphicReduction(40, true) end })
FixTab:AddButton({ Title = "Giảm Đồ Họa 70%", Callback = function() toggleGraphicReduction(70, true) end })
FixTab:AddButton({ Title = "Khôi Phục Đồ Họa", Callback = function() toggleGraphicReduction(100, false) end })
FixTab:AddButton({ Title = "Xóa Sương Mù & Đèn", Callback = function()
    pcall(function()
        Lighting.FogEnd = 9e9
        Lighting.GlobalShadows = false
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") then
                v.Enabled = false
            end
        end
    end)
end })

local PvpTab = Tabs.Main6
local customJumpForce, attackDelay = 85, 0.08
local activeHitboxes, activeHealthGuis = {}, {}

local function clearAllHitboxes()
    for _, a in pairs(activeHitboxes) do pcall(function() a:Destroy() end) end
    activeHitboxes = {}
end
local function clearAllHealthGuis()
    for _, g in pairs(activeHealthGuis) do pcall(function() g:Destroy() end) end
    activeHealthGuis = {}
end
local function getClosestPlayer()
    local closest, dist = nil, math.huge
    local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if myRoot then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                local d = (myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if d < dist then dist = d; closest = p end
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
    while task.wait(attackDelay) do
        if _G.PvpAutoAttack and not _G.FreecamEnabled then
            pcall(function()
                VirtualUser:ClickButton1(Vector2.new(Workspace.CurrentCamera.ViewportSize.X / 2, Workspace.CurrentCamera.ViewportSize.Y / 2))
            end)
        end
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
            if not hrp:FindFirstChild("Renx_SpinVelocity") then
                local spin = Instance.new("BodyAngularVelocity")
                spin.Name = "Renx_SpinVelocity"
                spin.MaxTorque = Vector3.new(0, math.huge, 0)
                spin.AngularVelocity = Vector3.new(0, 40, 0)
                spin.Parent = hrp
            end
        else
            if hrp and hrp:FindFirstChild("Renx_SpinVelocity") then hrp.Renx_SpinVelocity:Destroy() end
        end
        if _G.PvpAimNoCamActive then
            local target = getClosestPlayer()
            if target and target.Character and hrp then
                local tPart = target.Character:FindFirstChild("HumanoidRootPart")
                if tPart then hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(tPart.Position.X, hrp.Position.Y, tPart.Position.Z)) end
            end
        end
        if _G.PvpHitboxActive then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                    and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
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
                        activeHitboxes[p.Name]:Destroy(); activeHitboxes[p.Name] = nil
                    end
                end
            end
        elseif next(activeHitboxes) ~= nil then clearAllHitboxes() end
        if _G.PvpHealthActive then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Head")
                    and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                    local healthStr = math.floor(p.Character.Humanoid.Health) .. "/" .. math.floor(p.Character.Humanoid.MaxHealth)
                    local cur = activeHealthGuis[p.Name]
                    if not cur or not cur.Parent then
                        local bg = Instance.new("BillboardGui")
                        bg.Name = "Renx_HealthGui"
                        bg.Size = UDim2.new(0, 200, 0, 50)
                        bg.StudsOffset = Vector3.new(0, 3.5, 0)
                        bg.AlwaysOnTop = true
                        local txt = Instance.new("TextLabel", bg)
                        txt.BackgroundTransparency = 1
                        txt.Size = UDim2.fromScale(1, 1)
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
                elseif activeHealthGuis[p.Name] then
                    activeHealthGuis[p.Name]:Destroy(); activeHealthGuis[p.Name] = nil
                end
            end
        elseif next(activeHealthGuis) ~= nil then clearAllHealthGuis() end
    end)
end)

PvpTab:AddToggle("PvpAutoAttackToggle", { Title = "Auto Attack", Default = false }):OnChanged(function(v) _G.PvpAutoAttack = v end)
PvpTab:AddToggle("PvpSpinToggle", { Title = "Spin", Default = false }):OnChanged(function(v) _G.PvpSpinActive = v end)
PvpTab:AddToggle("PvpSpeedToggle", { Title = "Speed Boost", Default = false }):OnChanged(function(v) _G.PvpSpeedActive = v end)
PvpTab:AddToggle("PvpJumpToggle", { Title = "Jump Boost", Default = false }):OnChanged(function(v) _G.PvpJumpActive = v end)
PvpTab:AddToggle("PvpAimToggle", { Title = "Aim No Cam", Default = false }):OnChanged(function(v) _G.PvpAimNoCamActive = v end)
PvpTab:AddToggle("PvpHitboxToggle", { Title = "Hitbox Expand", Default = false }):OnChanged(function(v) _G.PvpHitboxActive = v end)
PvpTab:AddToggle("PvpHealthToggle", { Title = "Hiện Máu", Default = false }):OnChanged(function(v) _G.PvpHealthActive = v end)
PvpTab:AddToggle("FreecamToggle", { Title = "Freecam", Default = false }):OnChanged(function(v) ToggleFreecam(v) end)

setupFakeRole(Tabs.Main8)

local MoneyTab = Tabs.Main3
local leaderstats = player:FindFirstChild("leaderstats") or player:WaitForChild("leaderstats", 5)
local VND = leaderstats and (leaderstats:FindFirstChild("VND") or leaderstats:WaitForChild("VND", 5))
if not VND then
    -- game doesn't expose VND: fall back to a dummy value so the tab still builds
    VND = Instance.new("IntValue")
    VND.Name = "VND_Fallback"
    VND.Value = 0
    notify("Renx Hub", "Khong tim thay leaderstats.VND, bo dem tien se khong chay.", 5)
end

local function formatNumber(n)
    local str = tostring(n)
    local k
    while true do
        str, k = str:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
        if k == 0 then break end
    end
    return str
end

local totalEarned = 0
local lastValue = VND.Value
local earnedLabel = MoneyTab:AddParagraph({ Title = "Bộ đếm tiền", Content = formatNumber(totalEarned) .. " VND" })
local currentLabel = MoneyTab:AddParagraph({ Title = "Số Dư Hiện Tại", Content = formatNumber(lastValue) .. " VND" })

MoneyTab:AddButton({ Title = "Reset bộ đếm tiền", Callback = function()
    totalEarned = 0
    earnedLabel:SetDesc(formatNumber(totalEarned) .. " VND")
end })

VND:GetPropertyChangedSignal("Value"):Connect(function()
    local newValue = VND.Value
    if newValue > lastValue then
        totalEarned = totalEarned + (newValue - lastValue)
        earnedLabel:SetDesc(formatNumber(totalEarned) .. " VND")
    end
    currentLabel:SetDesc(formatNumber(newValue) .. " VND")
    lastValue = newValue
end)

MoneyTab:AddToggle("AntiAFKToggle", { Title = "Anti AFK", Default = false }):OnChanged(function(v)
    _G.AntiAFKEnabled = v
    if v then
        task.spawn(function()
            while _G.AntiAFKEnabled do
                task.wait(1080)
                if not _G.AntiAFKEnabled then break end
                pcall(function()
                    VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
                end)
            end
        end)
    end
end)

local HealTab = Tabs.Main11
local healThreshold = 80
local lastHeal = 0
local cooldown = 0.25

HealTab:AddInput("HealPercentInput", { Title = "HP Tối Thiểu (%)", Default = tostring(healThreshold), Placeholder = "VD: 80", Numeric = true, Finished = false }):OnChanged(function(v)
    local num = tonumber(v)
    if num and num > 0 and num <= 100 then healThreshold = num end
end)
HealTab:AddToggle("AutoHealToggle", { Title = "Tự Động Heal", Default = false }):OnChanged(function(v) _G.AutoHealEnabled = v end)
HealTab:AddToggle("AutoBuyHealToggle", { Title = "Tự Động Mua Băng Gạc", Default = false }):OnChanged(function(v) _G.AutoBuyHealEnabled = v end)

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoHealEnabled and (tick() - lastHeal >= cooldown) then
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 and hum.MaxHealth > 0 then
                if (hum.Health / hum.MaxHealth) * 100 <= healThreshold then
                    pcall(function()
                        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                        local healRemote = remotes and remotes:FindFirstChild("Heal")
                        if healRemote then healRemote:FireServer() end
                    end)
                    lastHeal = tick()
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(10) do
        if _G.AutoBuyHealEnabled then
            pcall(function()
                local buyRE = ReplicatedStorage:WaitForChild("KnitPackages")
                    :WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0")
                    :WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ShopService")
                    :WaitForChild("RE"):WaitForChild("buyItem")
                buyRE:FireServer("băng gạc", 5)
            end)
        end
    end
end)

local KickTab = Tabs.Main10
KickTab:AddToggle("AutoKickToggle", { Title = "Auto Kick Player Gần", Default = false }):OnChanged(function(v) _G.AutoKickEnabled = v end)
KickTab:AddSlider("AutoKickDist", { Title = "Khoảng Cách Kick", Min = 5, Max = 100, Default = 15, Rounding = 1 }):OnChanged(function(v) _G.AutoKickDistance = v end)

Tabs.Main4:AddToggle("AutoFarmSuKienToggle", { Title = "Auto Farm Sự Kiện", Default = false }):OnChanged(function(v) _G.AutoFarmSuKien = v end)

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoFarmSuKien then
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - TDSuKien).Magnitude > 5 then
                    teleportTo(TDSuKien)
                end
            end)
        end
    end
end)

-- ===== XE BAY =====
local XeBayTab = Tabs.Main12
local Player = player
local isFlying = false
local flySpeed = 200
local flyKeys = { W = false, S = false, UP = false, DOWN = false }
local flyConn = nil

local FlyScreenGui = Instance.new("ScreenGui")
FlyScreenGui.Name = "Renx_XeBay"
FlyScreenGui.ResetOnSpawn = false
if not pcall(function() FlyScreenGui.Parent = CoreGui end) then
    FlyScreenGui.Parent = playerGui
end

local FlyMobile = Instance.new("Frame")
FlyMobile.Size = UDim2.new(0, 220, 0, 150)
FlyMobile.Position = UDim2.new(0.65, 0, 0.5, 0)
FlyMobile.BackgroundTransparency = 1
FlyMobile.Visible = false
FlyMobile.Parent = FlyScreenGui

local function CreateFlyBtn(txt, pos, keyName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 60, 0, 60)
    btn.Position = pos
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.Parent = FlyMobile
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    btn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            flyKeys[keyName] = true
        end
    end)
    btn.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            flyKeys[keyName] = false
        end
    end)
end

CreateFlyBtn("⬆️", UDim2.new(0.35, 0, 0, 0), "W")
CreateFlyBtn("⬇️", UDim2.new(0.35, 0, 0.6, 0), "S")
CreateFlyBtn("Lên", UDim2.new(0.7, 0, 0.3, 0), "UP")
CreateFlyBtn("Xuống", UDim2.new(0, 0, 0.3, 0), "DOWN")

local function GetFlyRoot()
    local char = player.Character
    if not char then return nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.SeatPart then
        return hum.SeatPart.AssemblyRootPart or hum.SeatPart
    end
    return char:FindFirstChild("HumanoidRootPart")
end

local function SetXeBay(state)
    isFlying = state
    FlyMobile.Visible = state
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = GetFlyRoot()
    if not root then return end

    if state then
        local camFix = char:FindFirstChild("CamFixPart") or Instance.new("Part", char)
        camFix.Name = "CamFixPart"
        camFix.Transparency = 1
        camFix.CanCollide = false
        camFix.Size = Vector3.new(1, 1, 1)
        local weld = camFix:FindFirstChildOfClass("Weld") or Instance.new("Weld", camFix)
        weld.Part0 = camFix
        weld.Part1 = root
        Workspace.CurrentCamera.CameraSubject = camFix

        local bv = root:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.Parent = root
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.zero

        local bg = root:FindFirstChild("FlyGyro") or Instance.new("BodyGyro")
        bg.Name = "FlyGyro"
        bg.Parent = root
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.P = 9e4
        bg.D = 500

        flyConn = RunService.RenderStepped:Connect(function()
            if not isFlying then return end
            local curRoot = GetFlyRoot()
            if not curRoot then return end
            if bv.Parent ~= curRoot then bv.Parent = curRoot end
            if bg.Parent ~= curRoot then bg.Parent = curRoot end
            root = curRoot
            root.AssemblyLinearVelocity = Vector3.new(0, 0.01, 0)
            local camCF = Workspace.CurrentCamera.CFrame
            bg.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z))
            local mv = Vector3.zero
            if flyKeys.W then mv = mv + camCF.LookVector end
            if flyKeys.S then mv = mv - camCF.LookVector end
            if flyKeys.UP then mv = mv + Vector3.new(0, 1, 0) end
            if flyKeys.DOWN then mv = mv - Vector3.new(0, 1, 0) end
            bv.Velocity = mv.Magnitude > 0 and mv.Unit * flySpeed or Vector3.zero
        end)
    else
        if flyConn then flyConn:Disconnect(); flyConn = nil end
        local curRoot = GetFlyRoot()
        if curRoot then
            local bv = curRoot:FindFirstChild("FlyVelocity")
            local bg = curRoot:FindFirstChild("FlyGyro")
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end
        local camFix = char:FindFirstChild("CamFixPart")
        if camFix then camFix:Destroy() end
        if hum then
            Workspace.CurrentCamera.CameraSubject = hum
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end
end

UserInputService.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.W then flyKeys.W = true end
    if i.KeyCode == Enum.KeyCode.S then flyKeys.S = true end
    if i.KeyCode == Enum.KeyCode.E then flyKeys.UP = true end
    if i.KeyCode == Enum.KeyCode.Q then flyKeys.DOWN = true end
end)
UserInputService.InputEnded:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.W then flyKeys.W = false end
    if i.KeyCode == Enum.KeyCode.S then flyKeys.S = false end
    if i.KeyCode == Enum.KeyCode.E then flyKeys.UP = false end
    if i.KeyCode == Enum.KeyCode.Q then flyKeys.DOWN = false end
end)

XeBayTab:AddToggle("XeBayToggle", { Title = "Bật Xe Bay", Default = false }):OnChanged(function(v)
    SetXeBay(v)
end)
XeBayTab:AddSlider("XeBaySpeedSlider", {
    Title = "Tốc độ bay", Min = 50, Max = 500, Default = 200, Rounding = 1
}):OnChanged(function(v) flySpeed = v end)

pcall(function()
    if InterfaceManager and SaveManager then
        InterfaceManager:SetLibrary(Library)
        SaveManager:SetLibrary(Library)
        SaveManager:IgnoreThemeSettings()
        SaveManager:SetIgnoreIndexes({})
        InterfaceManager:SetFolder("RenxHub")
        SaveManager:SetFolder("RenxHub/Configs")
        InterfaceManager:BuildInterfaceSection(Tabs.Main13)
        SaveManager:BuildConfigSection(Tabs.Main13)
    end
end)

-- force the first tab to render (fixes the empty content panel)
task.defer(function()
    task.wait(0.15)
    pcall(function() Window:SelectTab(2) end)
    task.wait(0.05)
    pcall(function() Window:SelectTab(1) end)
    pcall(function() if SaveManager then SaveManager:LoadAutoloadConfig() end end)
    notify("Renx Hub", "Load xong tat ca chuc nang!", 3)
end)
